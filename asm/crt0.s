.include "asm/macros.inc"

.syntax unified

	ARM_FUNC_START _start
_start: @ 0x08000000
	b start_vector
header:
	.include "asm/rom_header.inc"
start_vector:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _080000F8
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _080000F4
	ldr r1, =0x03007FFC
	add r0, pc, #0x18
	str r0, [r1]
	ldr r1, =Dick+1
	mov lr, pc
	bx r1
	b start_vector
_080000F4: .4byte 0x03007C00
_080000F8: .4byte 0x03007F00

	ARM_FUNC_START intr_main
intr_main:
	mov r3, 0x4000000
	ldr r2, [r3, 0x200]!
	and r2, r2, r2, lsr #16
	mov r1, #-1
.loop:
	add r1, #1
	lsrs r2, #1
	bcc .loop
	ldr r2, =IntrTable
	mov r0, #1
	lsl r0, r1
	strh r0, [r3, #2]
	ldr r0, [r2, r1, lsl #2]
	bx r0

	.pool

	.global seg_m4aLib_top
seg_m4aLib_top:

	.section .rodata
	.global seg_m4aLib_rodata_top
seg_m4aLib_rodata_top:
	.4byte 0
