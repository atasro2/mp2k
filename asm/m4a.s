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
	bl SoundInit_rev01
	ldr r0, _08000EF4
	bl MPlayExtender
	ldr r0, _08000EF8
	bl SoundMode_rev01
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
	bl MPlayOpen_rev01
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
	bl MPlayStart_rev01
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
	bl MPlayStart_rev01
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
	bl MPlayStart_rev01
_08000F88:
	pop {r0}
	bx r0

	THUMB_FUNC_START m4aSongNumStartOrContinue
m4aSongNumStartOrContinue: @ 0x08000F8C
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08000FB8
	ldr r1, _08000FBC
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
	beq _08000FC0
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart_rev01
	b _08000FDC
	.align 2, 0
_08000FB8: .4byte gMPlayTable
_08000FBC: .4byte song_table
_08000FC0:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _08000FD2
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart_rev01
	b _08000FDC
_08000FD2:
	cmp r2, #0
	bge _08000FDC
	adds r0, r1, #0
	bl MPlayContinue
_08000FDC:
	pop {r0}
	bx r0

	THUMB_FUNC_START m4aSongNumStop
m4aSongNumStop: @ 0x08000FE0
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0800100C
	ldr r1, _08001010
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _08001006
	adds r0, r2, #0
	bl MPlayStop_rev01
_08001006:
	pop {r0}
	bx r0
	.align 2, 0
_0800100C: .4byte gMPlayTable
_08001010: .4byte song_table

	THUMB_FUNC_START m4aSongNumContinue
m4aSongNumContinue: @ 0x08001014
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08001040
	ldr r1, _08001044
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _0800103A
	adds r0, r2, #0
	bl MPlayContinue
_0800103A:
	pop {r0}
	bx r0
	.align 2, 0
_08001040: .4byte gMPlayTable
_08001044: .4byte song_table

	THUMB_FUNC_START m4aMPlayAllStop
m4aMPlayAllStop: @ 0x08001048
	push {r4, r5, lr}
	ldr r0, _0800106C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08001066
	ldr r5, _08001070
	adds r4, r0, #0
_08001058:
	ldr r0, [r5]
	bl MPlayStop_rev01
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _08001058
_08001066:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800106C: .4byte 0x00000004
_08001070: .4byte gMPlayTable

	THUMB_FUNC_START m4aMPlayContinue
m4aMPlayContinue: @ 0x08001074
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	.align 2, 0

	THUMB_FUNC_START m4aMPlayAllContinue
m4aMPlayAllContinue: @ 0x08001080
	push {r4, r5, lr}
	ldr r0, _080010A4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0800109E
	ldr r5, _080010A8
	adds r4, r0, #0
_08001090:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _08001090
_0800109E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080010A4: .4byte 0x00000004
_080010A8: .4byte gMPlayTable

	THUMB_FUNC_START m4aMPlayFadeOut
m4aMPlayFadeOut: @ 0x080010AC
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl MPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0

	THUMB_FUNC_START m4aMPlayFadeOutPause
m4aMPlayFadeOutPause: @ 0x080010BC
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080010D4
	cmp r3, r0
	bne _080010D2
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _080010D8
	strh r0, [r2, #0x28]
_080010D2:
	bx lr
	.align 2, 0
_080010D4: .4byte 0x68736D53
_080010D8: .4byte 0x00000101

	THUMB_FUNC_START m4aMPlayFadeInContinue
m4aMPlayFadeInContinue: @ 0x080010DC
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080010FC
	cmp r3, r0
	bne _080010FA
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _08001100
	ands r0, r1
	str r0, [r2, #4]
_080010FA:
	bx lr
	.align 2, 0
_080010FC: .4byte 0x68736D53
_08001100: .4byte 0x7FFFFFFF

	THUMB_FUNC_START m4aMPlayImmInit
m4aMPlayImmInit: @ 0x08001104
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _08001146
	movs r7, #0x80
_08001110:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0800113E
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0800113E
	adds r0, r4, #0
	bl Clear64byte_rev
	strb r7, [r4]
	movs r0, #2
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0800113E:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08001110
_08001146:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START MPlayExtender
MPlayExtender: @ 0x0800114C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08001214
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _08001218
	movs r2, #0
	strh r2, [r3]
	ldr r0, _0800121C
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _08001220
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _08001224
	cmp r6, r0
	bne _0800120C
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _08001228
	ldr r0, _0800122C
	str r0, [r1, #0x20]
	ldr r0, _08001230
	str r0, [r1, #0x44]
	ldr r0, _08001234
	str r0, [r1, #0x4c]
	ldr r0, _08001238
	str r0, [r1, #0x70]
	ldr r0, _0800123C
	str r0, [r1, #0x74]
	ldr r0, _08001240
	str r0, [r1, #0x78]
	ldr r0, _08001244
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _08001248
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _0800124C
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _08001250
	str r0, [r4, #0x28]
	ldr r0, _08001254
	str r0, [r4, #0x2c]
	ldr r0, _08001258
	str r0, [r4, #0x30]
	ldr r0, _0800125C
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _08001260
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_0800120C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001214: .4byte 0x04000084
_08001218: .4byte 0x04000080
_0800121C: .4byte 0x04000063
_08001220: .4byte 0x03007FF0
_08001224: .4byte 0x68736D53
_08001228: .4byte gMPlayJumpTable
_0800122C: .4byte ply_memacc+1
_08001230: .4byte ply_lfos_rev01+1
_08001234: .4byte ply_mod_rev01+1
_08001238: .4byte ply_xcmd+1
_0800123C: .4byte ply_endtie_rev01+1
_08001240: .4byte SampleFreqSet_rev01+1
_08001244: .4byte TrackStop_rev01+1
_08001248: .4byte FadeOutBody_rev01+1
_0800124C: .4byte TrkVolPitSet_rev01+1
_08001250: .4byte CgbSound+1
_08001254: .4byte CgbOscOff+1
_08001258: .4byte MidiKey2CgbFr+1
_0800125C: .4byte 0x00000000
_08001260: .4byte 0x05000040

	THUMB_FUNC_START MusicPlayerJumpTableCopy
MusicPlayerJumpTableCopy: @ 0x08001264
	svc #0x2a
	bx lr

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

	THUMB_FUNC_START Clear64byte_rev
Clear64byte_rev: @ 0x0800127C
	push {lr}
	ldr r1, _0800128C
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0800128C: .4byte gMPlayJumpTable+0x8C

	THUMB_FUNC_START SoundInit_rev01
SoundInit_rev01: @ 0x08001290
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _08001348
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _080012AC
	ldr r0, _0800134C
	str r0, [r1]
_080012AC:
	ldr r1, _08001350
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080012BA
	ldr r0, _0800134C
	str r0, [r1]
_080012BA:
	ldr r0, _08001354
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _08001358
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _0800135C
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _08001360
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08001364
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _08001368
	str r0, [r1]
	adds r1, #8
	ldr r2, =PCM_DMA_BUF_SIZE+0x350
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _0800136C
	str r0, [r1]
	ldr r0, _08001370
	str r5, [r0]
	str r3, [sp]
	ldr r2, _08001374
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _08001378
	str r0, [r5, #0x38]
	ldr r0, _0800137C
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _08001380
	adds r0, r4, #0
	bl MPlyJmpTblCopy
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl SampleFreqSet_rev01
	ldr r0, _08001384
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	.pool
_08001348: .4byte 0x040000C4
_0800134C: .4byte 0x84400004
_08001350: .4byte 0x040000D0
_08001354: .4byte 0x040000C6
_08001358: .4byte 0x04000084
_0800135C: .4byte 0x0000A90E
_08001360: .4byte 0x04000089
_08001364: .4byte 0x040000BC
_08001368: .4byte 0x040000A0
_0800136C: .4byte 0x040000A4
_08001370: .4byte 0x03007FF0
_08001374: .4byte 0x050003EC
_08001378: .4byte ply_note_rev01+1
_0800137C: .4byte DummyFunc+1
_08001380: .4byte gMPlayJumpTable
_08001384: .4byte 0x68736D53

	THUMB_FUNC_START SampleFreqSet_rev01
SampleFreqSet_rev01: @ 0x08001388
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _08001408
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _0800140C
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	ldr r0, =PCM_DMA_BUF_SIZE
	adds r1, r5, #0
	bl __divsi3
	strb r0, [r4, #0xb]
	ldr r0, _08001410
	muls r0, r5, r0
	ldr r1, _08001414
	adds r0, r0, r1
	ldr r1, _08001418
	bl __divsi3
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl __divsi3
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _0800141C
	strh r6, [r0]
	ldr r4, _08001420
	ldr r0, _08001424
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	bl SoundVSyncOn_rev01
	ldr r1, _08001428
_080013EC:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _080013EC
	ldr r1, _08001428
_080013F4:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _080013F4
	ldr r1, _0800141C
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	.pool
_08001408: .4byte 0x03007FF0
_0800140C: .4byte gPcmSamplesPerVBlankTable
_08001410: .4byte 0x00091D1B
_08001414: .4byte 0x00001388
_08001418: .4byte 0x00002710
_0800141C: .4byte 0x04000102
_08001420: .4byte 0x04000100
_08001424: .4byte 0x00044940
_08001428: .4byte 0x04000006

	THUMB_FUNC_START SoundMode_rev01
SoundMode_rev01: @ 0x0800142C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _080014B8
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _080014BC
	cmp r1, r0
	bne _080014B2
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _0800144E
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_0800144E:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _0800146E
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_08001464:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _08001464
_0800146E:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _0800147C
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_0800147C:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _0800149A
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _080014C0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_0800149A:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _080014AE
	bl SoundVSyncOff_rev01
	adds r0, r4, #0
	bl SampleFreqSet_rev01
_080014AE:
	ldr r0, _080014BC
	str r0, [r5]
_080014B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080014B8: .4byte 0x03007FF0
_080014BC: .4byte 0x68736D53
_080014C0: .4byte 0x04000089

	THUMB_FUNC_START SoundClear_rev01
SoundClear_rev01: @ 0x080014C4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08001510
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _08001514
	cmp r1, r0
	bne _0800150A
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_080014DE:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _080014DE
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _08001506
	movs r5, #1
	movs r7, #0
_080014F2:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl _call_via_r1
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _080014F2
_08001506:
	ldr r0, _08001514
	str r0, [r6]
_0800150A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001510: .4byte 0x03007FF0
_08001514: .4byte 0x68736D53

	THUMB_FUNC_START SoundVSyncOff_rev01
SoundVSyncOff_rev01: @ 0x08001518
	push {lr}
	sub sp, #4
	ldr r0, _08001578
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _0800157C
	adds r0, r1, r3
	cmp r0, #1
	bhi _08001570
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _08001580
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _08001542
	ldr r0, _08001584
	str r0, [r1]
_08001542:
	ldr r1, _08001588
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _08001550
	ldr r0, _08001584
	str r0, [r1]
_08001550:
	ldr r0, _0800158C
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r2, _08001590
	mov r0, sp
	bl CpuSet
_08001570:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08001578: .4byte 0x03007FF0
_0800157C: .4byte 0x978C92AD
_08001580: .4byte 0x040000C4
_08001584: .4byte 0x84400004
_08001588: .4byte 0x040000D0
_0800158C: .4byte 0x040000C6
_08001590: .4byte 0x05000318

	THUMB_FUNC_START SoundVSyncOn_rev01
SoundVSyncOn_rev01: @ 0x08001594
	push {r4, lr}
	ldr r0, _080015C4
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _080015C8
	cmp r3, r0
	beq _080015BC
	ldr r0, _080015CC
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r1, r4, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldrb r0, [r2, #4]
	movs r0, #0
	strb r0, [r2, #4]
	adds r0, r3, #0
	subs r0, #0xa
	str r0, [r2]
_080015BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080015C4: .4byte 0x03007FF0
_080015C8: .4byte 0x68736D53
_080015CC: .4byte 0x040000C6

	THUMB_FUNC_START MPlayOpen_rev01
MPlayOpen_rev01: @ 0x080015D0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _08001634
	cmp r4, #0x10
	bls _080015E4
	movs r4, #0x10
_080015E4:
	ldr r0, _0800163C
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _08001640
	cmp r1, r0
	bne _08001634
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl Clear64byte_rev
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _08001618
	movs r1, #0
_0800160A:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _0800160A
_08001618:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _08001628
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_08001628:
	str r7, [r5, #0x24]
	ldr r0, _08001644
	str r0, [r5, #0x20]
	ldr r0, _08001640
	str r0, [r5]
	str r0, [r7, #0x34]
_08001634:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800163C: .4byte 0x03007FF0
_08001640: .4byte 0x68736D53
_08001644: .4byte MPlayMain_rev01+1

	THUMB_FUNC_START MPlayStart_rev01
MPlayStart_rev01: @ 0x08001648
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _08001728
	cmp r1, r0
	bne _0800171E
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _0800168A
	ldr r0, [r5]
	cmp r0, #0
	beq _08001674
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08001680
_08001674:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _0800168A
	cmp r1, #0
	blt _0800168A
_08001680:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _0800171E
_0800168A:
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0
	str r1, [r5, #4]
	str r7, [r5]
	ldr r0, [r7, #4]
	str r0, [r5, #0x30]
	strb r2, [r5, #9]
	str r1, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x20]
	adds r0, #0x6a
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r6, #0
	ldr r4, [r5, #0x2c]
	ldrb r1, [r7]
	cmp r6, r1
	bge _080016EA
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _0800170A
	mov r8, r6
_080016BE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop_rev01
	movs r0, #0xc0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, #0x20]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x40]
	adds r6, #1
	adds r4, #0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _080016EA
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _080016BE
_080016EA:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _0800170A
	movs r1, #0
	mov r8, r1
_080016F4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop_rev01
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _080016F4
_0800170A:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _0800171A
	ldrb r0, [r7, #3]
	bl SoundMode_rev01
_0800171A:
	ldr r0, _08001728
	str r0, [r5, #0x34]
_0800171E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001728: .4byte 0x68736D53

	THUMB_FUNC_START MPlayStop_rev01
MPlayStop_rev01: @ 0x0800172C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _08001768
	cmp r1, r0
	bne _08001762
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r6, #4]
	ldrb r4, [r6, #8]
	ldr r5, [r6, #0x2c]
	cmp r4, #0
	ble _0800175E
_0800174E:
	adds r0, r6, #0
	adds r1, r5, #0
	bl TrackStop_rev01
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _0800174E
_0800175E:
	ldr r0, _08001768
	str r0, [r6, #0x34]
_08001762:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001768: .4byte 0x68736D53

	THUMB_FUNC_START FadeOutBody_rev01
FadeOutBody_rev01: @ 0x0800176C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _0800182E
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _080017AC
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0800182E
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080017B0
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _08001802
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _08001802
	.align 2, 0
_080017AC: .4byte 0x0000FFFF
_080017B0:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08001802
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _080017E2
_080017C6:
	adds r0, r6, #0
	adds r1, r4, #0
	bl TrackStop_rev01
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _080017DA
	strb r0, [r4]
_080017DA:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _080017C6
_080017E2:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _080017F6
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _080017FA
_080017F6:
	movs r0, #0x80
	lsls r0, r0, #0x18
_080017FA:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _0800182E
_08001802:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _0800182E
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_08001810:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08001826
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_08001826:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08001810
_0800182E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START TrkVolPitSet_rev01
TrkVolPitSet_rev01: @ 0x08001834
	push {r4, lr}
	adds r2, r1, #0
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08001898
	ldrb r3, [r2, #0x13]
	ldrb r1, [r2, #0x12]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r3, r0, #5
	ldrb r4, [r2, #0x18]
	cmp r4, #1
	bne _0800185C
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r3, r0, #7
_0800185C:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, #2
	bne _08001872
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
_08001872:
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0800187E
	adds r1, r0, #0
	b _08001884
_0800187E:
	cmp r1, #0x7f
	ble _08001884
	movs r1, #0x7f
_08001884:
	adds r0, r1, #0
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x10]
	movs r0, #0x7f
	subs r0, r0, r1
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x11]
_08001898:
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _080018DC
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xf]
	muls r0, r1, r0
	movs r1, #0xc
	ldrsb r1, [r2, r1]
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #0xd]
	adds r1, r0, r1
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _080018D6
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	adds r1, r1, r0
_080018D6:
	asrs r0, r1, #8
	strb r0, [r2, #8]
	strb r1, [r2, #9]
_080018DC:
	movs r0, #0xfa
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START MidiKey2CgbFr
MidiKey2CgbFr: @ 0x080018E8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _08001920
	cmp r5, #0x14
	bhi _08001904
	movs r5, #0
	b _08001912
_08001904:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _08001912
	movs r5, #0x3b
_08001912:
	ldr r0, _0800191C
	adds r0, r5, r0
	ldrb r0, [r0]
	b _08001982
	.align 2, 0
_0800191C: .4byte gNoiseTable
_08001920:
	cmp r5, #0x23
	bhi _0800192C
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _0800193E
_0800192C:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _0800193E
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_0800193E:
	ldr r3, _08001988
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _0800198C
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_08001982:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08001988: .4byte gCgbScaleTable
_0800198C: .4byte gCgbFreqTable

	THUMB_FUNC_START CgbOscOff
CgbOscOff: @ 0x08001990
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _080019B8
	cmp r0, #2
	bgt _080019A4
	cmp r0, #1
	beq _080019AA
	b _080019CC
_080019A4:
	cmp r1, #3
	beq _080019C0
	b _080019CC
_080019AA:
	ldr r1, _080019B4
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _080019D4
	.align 2, 0
_080019B4: .4byte 0x04000063
_080019B8:
	ldr r1, _080019BC
	b _080019CE
	.align 2, 0
_080019BC: .4byte 0x04000069
_080019C0:
	ldr r1, _080019C8
	movs r0, #0
	b _080019D6
	.align 2, 0
_080019C8: .4byte 0x04000070
_080019CC:
	ldr r1, _080019DC
_080019CE:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_080019D4:
	movs r0, #0x80
_080019D6:
	strb r0, [r1]
	bx lr
	.align 2, 0
_080019DC: .4byte 0x04000079

	THUMB_FUNC_START CgbModVol
CgbModVol: @ 0x080019E0
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	lsls r2, r0, #0x18
	lsrs r4, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _08001A00
	lsrs r0, r2, #0x19
	cmp r0, r3
	blo _08001A0C
	movs r0, #0xf
	strb r0, [r1, #0x1b]
	b _08001A1A
_08001A00:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _08001A0C
	movs r0, #0xf0
	strb r0, [r1, #0x1b]
	b _08001A1A
_08001A0C:
	movs r0, #0xff
	strb r0, [r1, #0x1b]
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	b _08001A2A
_08001A1A:
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	strb r0, [r1, #0xa]
	cmp r0, #0xf
	bls _08001A2C
	movs r0, #0xf
_08001A2A:
	strb r0, [r1, #0xa]
_08001A2C:
	ldrb r2, [r1, #6]
	ldrb r3, [r1, #0xa]
	adds r0, r2, #0
	muls r0, r3, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r1, #0x19]
	ldrb r0, [r1, #0x1c]
	ldrb r2, [r1, #0x1b]
	ands r0, r2
	strb r0, [r1, #0x1b]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START CgbSound
CgbSound: @ 0x08001A48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08001A68
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _08001A6C
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _08001A72
	.align 2, 0
_08001A68: .4byte 0x03007FF0
_08001A6C:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_08001A72:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_08001A78:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _08001A8E
	b _08001E78
_08001A8E:
	cmp r6, #2
	beq _08001AC0
	cmp r6, #2
	bgt _08001A9C
	cmp r6, #1
	beq _08001AA2
	b _08001AF8
_08001A9C:
	cmp r6, #3
	beq _08001AD8
	b _08001AF8
_08001AA2:
	ldr r0, _08001AB4
	str r0, [sp, #8]
	ldr r7, _08001AB8
	ldr r2, _08001ABC
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _08001B08
	.align 2, 0
_08001AB4: .4byte 0x04000060
_08001AB8: .4byte 0x04000062
_08001ABC: .4byte 0x04000063
_08001AC0:
	ldr r0, _08001ACC
	str r0, [sp, #8]
	ldr r7, _08001AD0
	ldr r2, _08001AD4
	b _08001B00
	.align 2, 0
_08001ACC: .4byte 0x04000061
_08001AD0: .4byte 0x04000068
_08001AD4: .4byte 0x04000069
_08001AD8:
	ldr r0, _08001AEC
	str r0, [sp, #8]
	ldr r7, _08001AF0
	ldr r2, _08001AF4
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _08001B08
	.align 2, 0
_08001AEC: .4byte 0x04000070
_08001AF0: .4byte 0x04000072
_08001AF4: .4byte 0x04000073
_08001AF8:
	ldr r0, _08001B58
	str r0, [sp, #8]
	ldr r7, _08001B5C
	ldr r2, _08001B60
_08001B00:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_08001B08:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08001BFE
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _08001C22
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl CgbModVol
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _08001B70
	cmp r6, #2
	bgt _08001B64
	cmp r6, #1
	beq _08001B6A
	b _08001BC4
	.align 2, 0
_08001B58: .4byte 0x04000071
_08001B5C: .4byte 0x04000078
_08001B60: .4byte 0x04000079
_08001B64:
	cmp r6, #3
	beq _08001B7C
	b _08001BC4
_08001B6A:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_08001B70:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _08001BD0
_08001B7C:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _08001BA4
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _08001BB8
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_08001BA4:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08001BBC
	movs r0, #0xc0
	b _08001BDE
	.align 2, 0
_08001BB8: .4byte 0x04000090
_08001BBC:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _08001BE0
_08001BC4:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_08001BD0:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08001BDE
	movs r0, #0x40
_08001BDE:
	strb r0, [r4, #0x1a]
_08001BE0:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _08001BFA
	b _08001D36
_08001BFA:
	strb r2, [r4, #9]
	b _08001D64
_08001BFE:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08001C30
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _08001C22
	b _08001D76
_08001C22:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _08001E74
_08001C30:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _08001C70
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08001C70
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _08001CA2
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _08001D64
	ldrb r2, [r4, #7]
	mov r8, r2
	b _08001D64
_08001C70:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _08001D64
	cmp r6, #3
	bne _08001C82
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_08001C82:
	adds r0, r4, #0
	bl CgbModVol
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _08001CD6
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08001CD2
_08001CA2:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08001C22
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _08001D76
	movs r2, #8
	mov r8, r2
	b _08001D76
_08001CD2:
	ldrb r0, [r4, #7]
	b _08001D62
_08001CD6:
	cmp r0, #1
	bne _08001CE2
_08001CDA:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _08001D62
_08001CE2:
	cmp r0, #2
	bne _08001D26
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _08001D22
_08001CFA:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _08001D0A
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _08001CA2
_08001D0A:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _08001CDA
	movs r0, #8
	mov r8, r0
	b _08001CDA
_08001D22:
	ldrb r0, [r4, #5]
	b _08001D62
_08001D26:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _08001D60
_08001D36:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _08001CFA
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _08001D64
	ldrb r2, [r4, #5]
	mov r8, r2
	b _08001D64
_08001D60:
	ldrb r0, [r4, #4]
_08001D62:
	strb r0, [r4, #0xb]
_08001D64:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _08001D76
	subs r0, #1
	str r0, [sp]
	b _08001C70
_08001D76:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _08001DEE
	cmp r6, #3
	bgt _08001DB6
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _08001DB6
	ldr r0, _08001DA0
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _08001DA8
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _08001DA4
	b _08001DB2
	.align 2, 0
_08001DA0: .4byte 0x04000089
_08001DA4: .4byte 0x000007FC
_08001DA8:
	cmp r0, #0x7f
	bgt _08001DB6
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _08001DC4
_08001DB2:
	ands r0, r1
	str r0, [r4, #0x20]
_08001DB6:
	cmp r6, #4
	beq _08001DC8
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _08001DD6
	.align 2, 0
_08001DC4: .4byte 0x000007FE
_08001DC8:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_08001DD6:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_08001DEE:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _08001E74
	ldr r1, _08001E38
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _08001E40
	ldr r0, _08001E3C
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _08001E74
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _08001E74
	.align 2, 0
_08001E38: .4byte 0x04000081
_08001E3C: .4byte gCgb3Vol
_08001E40:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _08001E74
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08001E74
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_08001E74:
	movs r0, #0
	strb r0, [r4, #0x1d]
_08001E78:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _08001E82
	b _08001A78
_08001E82:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
