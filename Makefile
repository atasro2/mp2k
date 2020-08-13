ifeq ($(CC),)
HOSTCC := gcc
else
HOSTCC := $(CC)
endif

ifeq ($(CXX),)
HOSTCXX := g++
else
HOSTCXX := $(CXX)
endif

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

AS := arm-none-eabi-as
LD := arm-none-eabi-ld
GCC := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
CPP := arm-none-eabi-cpp
SHA1SUM := sha1sum -c
GBAFIX := tools/gbafix/gbafix
MID := tools/mid2agb/mid2agb
AIF := tools/aif2pcm/aif2pcm
SCANINC := tools/scaninc/scaninc
PREPROC := tools/preproc/preproc
ASFLAGS := -mcpu=arm7tdmi

TOOLDIRS := $(filter-out tools/agbcc tools/binutils,$(wildcard tools/*))
TOOLBASE = $(TOOLDIRS:tools/%=%)
TOOLS = $(foreach tool,$(TOOLBASE),tools/$(tool)/$(tool)$(EXE))

MAKEFLAGS += --no-print-directory

OBJ_DIR := build/mp2k

C_SUBDIR = src
ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data
SONG_SUBDIR = sound/songs
MID_SUBDIR = sound/songs/midi

C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)
SONG_BUILDDIR = $(OBJ_DIR)/$(SONG_SUBDIR)
MID_BUILDDIR = $(OBJ_DIR)/$(MID_SUBDIR)

C_SRCS := $(wildcard $(C_SUBDIR)/*.c $(C_SUBDIR)/*/*.c $(C_SUBDIR)/*/*/*.c)
C_OBJS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_SRCS))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

SONG_SRCS := $(wildcard $(SONG_SUBDIR)/*.s)
SONG_OBJS := $(patsubst $(SONG_SUBDIR)/%.s,$(SONG_BUILDDIR)/%.o,$(SONG_SRCS))

MID_SRCS := $(wildcard $(MID_SUBDIR)/*.mid)
MID_OBJS := $(patsubst $(MID_SUBDIR)/%.mid,$(MID_BUILDDIR)/%.o,$(MID_SRCS))

OBJS     := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS) $(SONG_OBJS) $(MID_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

SUBDIRS  := $(sort $(dir $(OBJS)))

$(shell mkdir -p $(SUBDIRS))

NAME := mp2k
ROM := $(NAME).gba
ELF := $(NAME).elf
MAP := $(NAME).map

LIBPATH := -L "$(dir $(shell $(GCC) -mthumb -print-file-name=libgcc.a))" -L "$(dir $(shell $(GCC) -mthumb -print-file-name=libc.a))"
LIB := $(LIBPATH) -lgcc -lc

# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

.SECONDEXPANSION:

.PHONY: all compare clean tools clean-tools

infoshell = $(foreach line, $(shell $1 | sed "s/ /__SPACE__/g"), $(info $(subst __SPACE__, ,$(line))))

# Build tools when building the rom
# Disable dependency scanning for clean/tidy/tools
ifeq (,$(filter-out all rom compare modern berry_fix libagbsyscall,$(MAKECMDGOALS)))
$(call infoshell, $(MAKE) tools)
else
NODEP := 1
endif

all: $(ROM)

tools: $(TOOLS)

$(TOOLS): %:
	@$(MAKE) -C $(@D) CC=$(HOSTCC) CXX=$(HOSTCXX)

compare: $(ROM)
	$(SHA1SUM) rom.sha1
	
clean: mostlyclean clean-tools

mostlyclean:
	rm -f $(ROM) $(ELF) $(MAP) $(OBJS)
	rm -f sound/direct_sound_samples/*.bin
	
clean-tools:
	@$(foreach tooldir,$(TOOLDIRS),$(MAKE) clean -C $(tooldir);)

include songs.mk

sound/%.bin: sound/%.aif ; $(AIF) $< $@

GCC_VER := $(shell $(GCC) -dumpversion)

override CFLAGS += -S -mthumb -mthumb-interwork -O2 -mabi=apcs-gnu -mtune=arm7tdmi -march=armv4t -fno-toplevel-reorder -fno-aggressive-loop-optimizations -Wno-pointer-to-int-cast

CPPFLAGS := -iquote include

$(ROM): $(ELF)
	$(OBJCOPY) -O binary $< $@
	$(GBAFIX) -p --silent $@

$(OBJ_DIR)/ld_script.ld: ld_script.txt
	cd $(OBJ_DIR) && sed "s#tools/#../../tools/#g" ../../ld_script.txt > ld_script.ld

$(OBJ_DIR)/sym_iwram.ld: sym_iwram.txt
	cp $< $@ 

$(ELF): %.elf: $(OBJS) $(OBJ_DIR)/ld_script.ld $(OBJ_DIR)/sym_iwram.ld
	cd $(OBJ_DIR) && $(LD) -T ld_script.ld -Map ../../$(MAP) -o ../../$@ $(OBJS_REL) $(LIB)
	$(GBAFIX) -m01 --silent $@

ifeq ($(NODEP),1)
$(ASM_BUILDDIR)/%.o: asm_dep :=
else
$(ASM_BUILDDIR)/%.o: asm_dep = $(shell $(SCANINC) -I "" $(ASM_SUBDIR)/$*.s)
endif

$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s $$(asm_dep)
	$(AS) $(ASFLAGS) -o $@ $<

ifeq ($(NODEP),1)
$(DATA_ASM_BUILDDIR)/%.o: data_dep :=
else
$(DATA_ASM_BUILDDIR)/%.o: data_dep = $(shell $(SCANINC) -I include -I "" $(DATA_ASM_SUBDIR)/$*.s)
endif

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s $$(data_dep)
	$(PREPROC) $< charmap.txt | $(AS) $(ASFLAGS) -o $@ 

$(SONG_BUILDDIR)/%.o: $(SONG_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -I sound -o $@ $<
	
$(C_BUILDDIR)/m4a.o: CFLAGS += -fno-gcse

ifeq ($(NODEP),1)
$(C_BUILDDIR)/%.o: c_dep :=
else
$(C_BUILDDIR)/%.o: c_dep = $(shell $(SCANINC) -I include $(C_SUBDIR)/$*.c)
endif

$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.c $$(c_dep)
	$(GCC) $(CFLAGS) $(CPPFLAGS) $< -o $(C_BUILDDIR)/$*.s
	$(AS) $(ASFLAGS) -o $@ $(C_BUILDDIR)/$*.s