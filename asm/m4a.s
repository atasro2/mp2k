.include "asm/macros.inc"
.include "constants/m4a_constants.inc"

.syntax unified

.text

	THUMB_FUNC_START m4aSoundInit
m4aSoundInit: @ 0x08000E90
	push {r4, r5, r6, lr}
	ldr r0, _08000EE4
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _08000EE8
	ldr r2, _08000EEC
	bl CpuSet
	ldr r0, _08000EF0
	bl SoundInit
	ldr r0, _08000EF4
	bl MPlayExtender
	ldr r0, _08000EF8
	bl m4aSoundMode
	ldr r0, _08000EFC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08000EDE
	ldr r5, _08000F00
	adds r6, r0, #0
_08000EC2:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	bl MPlayOpen
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _08000F04
	str r0, [r4, #0x18]
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bne _08000EC2
_08000EDE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08000EE4: .4byte SoundMainRAM+1
_08000EE8: .4byte SoundMainRAM_Buffer
_08000EEC: .4byte 0x04000300
_08000EF0: .4byte gSoundInfo
_08000EF4: .4byte gCgbChans
_08000EF8: .4byte 0x009CD800
_08000EFC: .4byte 0x00000004
_08000F00: .4byte gMPlayTable
_08000F04: .4byte gMPlayMemAccArea

	THUMB_FUNC_START m4aSoundMain
m4aSoundMain: @ 0x08000F08
	push {lr}
	bl SoundMain
	pop {r0}
	bx r0
	.align 2, 0

	THUMB_FUNC_START m4aSongNumStart
m4aSongNumStart: @ 0x08000F14
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08000F38
	ldr r1, _08000F3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl MPlayStart
	pop {r0}
	bx r0
	.align 2, 0
_08000F38: .4byte gMPlayTable
_08000F3C: .4byte song_table

	THUMB_FUNC_START m4aSongNumStartOrChange
m4aSongNumStartOrChange: @ 0x08000F40
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08000F6C
	ldr r1, _08000F70
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _08000F74
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _08000F88
	.align 2, 0
_08000F6C: .4byte gMPlayTable
_08000F70: .4byte song_table
_08000F74:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _08000F80
	cmp r2, #0
	bge _08000F88
_08000F80:
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
_08000F88:
	pop {r0}
	bx r0

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
