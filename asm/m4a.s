.include "asm/macros.inc"
.include "constants/m4a_constants.inc"

.syntax unified

.text

	THUMB_FUNC_START ClearChain_rev
ClearChain_rev: @ 0x08001268
	push {lr}
	ldr r1, _08001278
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08001278: .4byte gMPlayJumpTable+0x88
