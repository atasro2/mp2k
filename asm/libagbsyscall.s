.include "asm/macros.inc"

.syntax unified

	THUMB_FUNC_START CpuSet
CpuSet: @ 0x08003BD0
	svc #0xb
	bx lr

	THUMB_FUNC_START MidiKey2Freq
MidiKey2Freq: @ 0x08003BD4
	svc #0x1f
	bx lr

	THUMB_FUNC_START VBlankIntrWait
VBlankIntrWait: @ 0x08003BD8
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0
