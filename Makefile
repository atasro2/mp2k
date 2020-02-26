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

ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data
SONG_SUBDIR = sound/songs
MID_SUBDIR = sound/songs/midi

ASM_BUILDDIR = $(ASM_SUBDIR)
DATA_ASM_BUILDDIR = $(DATA_ASM_SUBDIR)
SONG_BUILDDIR = $(SONG_SUBDIR)
MID_BUILDDIR = $(MID_SUBDIR)

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

SONG_SRCS := $(wildcard $(SONG_SUBDIR)/*.s)
SONG_OBJS := $(patsubst $(SONG_SUBDIR)/%.s,$(SONG_BUILDDIR)/%.o,$(SONG_SRCS))

MID_SRCS := $(wildcard $(MID_SUBDIR)/*.mid)
MID_OBJS := $(patsubst $(MID_SUBDIR)/%.mid,$(MID_BUILDDIR)/%.o,$(MID_SRCS))

OBJS     := $(ASM_OBJS) $(DATA_ASM_OBJS) $(SONG_OBJS) $(MID_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

NAME := SoundMon
ROM := $(NAME).gba
ELF := $(NAME).elf

# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

.SECONDEXPANSION:

.PHONY: all compare clean

all: $(ROM)

compare: $(ROM)
	$(SHA1SUM) rom.sha1

clean:
	rm -f $(ROM) $(ELF) $(OBJS)
include songs.mk

sound/%.bin: sound/%.aif ; $(AIF) $< $@

GCC_VER := $(shell $(GCC) -dumpversion)

$(ROM): $(ELF)
	$(OBJCOPY) -O binary $< $@

ld_script.ld: ld_script.txt sym_iwram.ld sym_ewram.ld
	cp $< $@ 
sym_iwram.ld: sym_iwram.txt
	cp $< $@ 
sym_ewram.ld: sym_ewram.txt
	cp $< $@ 

$(ELF): %.elf: $(OBJS) ld_script.ld
	$(LD) -T ld_script.ld -Map $*.map -o $@ $(OBJS) -L /usr/lib/gcc/arm-none-eabi/$(GCC_VER)/thumb -L /usr/lib/arm-none-eabi/lib/thumb -lgcc -lc
	$(GBAFIX) -m01 --silent $@

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