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
	bl MPlayStart
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
	bl MPlayStart
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
	bl m4aMPlayStop
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
	bl m4aMPlayStop
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
_08001240: .4byte SampleFreqSet+1
_08001244: .4byte TrackStop+1
_08001248: .4byte FadeOutBody+1
_0800124C: .4byte TrkVolPitSet+1
_08001250: .4byte CgbSound+1
_08001254: .4byte CgbOscOff+1
_08001258: .4byte MidiKeyToCgbFreq+1
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
	bl SampleFreqSet
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

	THUMB_FUNC_START SampleFreqSet
SampleFreqSet: @ 0x08001388
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
	bl m4aSoundVSyncOn
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
