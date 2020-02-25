.include "asm/macros.inc"

.syntax unified

	THUMB_FUNC_START seg_m4aLib_end
seg_m4aLib_end: @ 0x08002384
	bx lr
	.align 2, 0

	THUMB_FUNC_START _MPlayFadeOut
_MPlayFadeOut: @ 0x08002388
	svc #0x22
	bx lr

	THUMB_FUNC_START AgbMain
AgbMain: @ 0x0800238C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080025AC
	ldr r1, _080025B0
	str r1, [r0]
	ldr r2, _080025B4
	str r2, [r0, #4]
	ldr r1, _080025B8
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080025BC
	str r2, [r1]
	ldr r3, _080025C0
	str r3, [r0]
	ldr r1, _080025C4
	str r1, [r0, #4]
	ldr r2, _080025C8
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _080025CC
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r3, _080025D0
	str r3, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r2, _080025D4
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _080025D8
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080025DC
	str r1, [r0]
	ldr r2, _080025E0
	str r2, [r0, #4]
	ldr r1, _080025E4
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _080025E8
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r2, _080025EC
	ldr r0, _080025F0
	mov sb, r0
	ldr r1, _080025F4
	mov r8, r1
	ldr r6, _080025F8
	ldr r7, _080025FC
	ldr r3, _08002600
	adds r4, r2, #0
	movs r5, #0x7f
_0800240C:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	stm r4!, {r0, r1}
	subs r5, #1
	cmp r5, #0
	bge _0800240C
	ldr r0, _08002604
	ldrh r3, [r2, #4]
	ands r0, r3
	movs r1, #0x13
	orrs r0, r1
	strh r0, [r2, #4]
	movs r0, #0xf
	ldrb r4, [r2, #5]
	ands r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #0
	strb r0, [r6]
	mov r5, r8
	strb r0, [r5]
	mov r1, sb
	strb r0, [r1]
	movs r4, #0
	ldr r0, _08002608
	ldrh r3, [r2, #2]
	ands r0, r3
	ldrb r5, [r7, #2]
	orrs r0, r5
	strh r0, [r2, #2]
	ldrb r0, [r7, #3]
	strb r0, [r2]
	ldr r1, _080025AC
	str r2, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0800260C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xcc
	movs r0, #8
	strh r0, [r1]
	bl m4aSoundInit
	bl MidiInputInit
	ldr r2, _08002610
	ldr r1, _08002614
	ldr r0, _08002618
	strh r4, [r0]
	strh r4, [r1]
	strh r4, [r2]
	ldr r1, _0800261C
	ldr r0, _08002620
	strh r4, [r0]
	strh r4, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0
	ldr r2, _08002624
	ldr r0, _08002628
	movs r5, #3
_0800248C:
	stm r0!, {r3}
	stm r2!, {r1}
	subs r5, #1
	cmp r5, #0
	bge _0800248C
	bl SongWrite
	ldr r4, _0800262C
	ldr r3, _08002630
	ldr r2, _08002634
	ldr r1, _08002638
	movs r0, #0xff
	strb r0, [r1]
	strb r0, [r2]
	strb r0, [r3]
	strb r0, [r4]
	bl ModeWrite
	ldr r1, _0800263C
	ldr r0, _08002640
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	ldr r1, _08002644
	ldr r0, _08002648
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r1, _0800264C
	ldr r0, _08002650
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	bl MidiWrite
	ldr r2, _08002654
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
	ldr r0, _08002658
	subs r2, r2, r0
	ldr r0, _0800265C
	ldr r1, _08002660
	subs r0, r0, r1
	adds r2, r2, r0
	ldr r0, _08002664
	ldr r1, _08002668
	subs r0, r0, r1
	adds r2, r2, r0
	movs r0, #0xa8
	movs r1, #0x80
	movs r3, #8
	bl ValueWriteHex
	ldr r0, _0800266C
	movs r2, #1
	strh r2, [r0]
	ldr r1, _08002670
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _08002674
	movs r0, #8
	strh r0, [r1]
	subs r1, #4
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _080025FC
	mov r8, r3
	ldr r4, _08002624
	mov sl, r4
	ldr r5, _080025EC
	mov sb, r5
_08002522:
	bl KeyRead
	ldr r1, _080025F4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08002678
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800253C
	b _0800267C
_0800253C:
	ldr r6, _080025F8
	ldrb r0, [r6]
	lsls r1, r0, #2
	mov r2, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #1
	beq _0800254E
	b _08002824
_0800254E:
	ldr r4, _08002628
	adds r0, r1, r4
	ldr r0, [r0]
	cmp r0, #0
	blt _08002560
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
_08002560:
	ldrb r3, [r6]
	lsls r0, r3, #2
	add r0, sl
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldrb r5, [r6]
	lsls r0, r5, #2
	adds r1, r0, r4
	add r0, sl
	ldr r0, [r0]
	str r0, [r1]
	movs r5, #0
	adds r7, r6, #0
	movs r6, #1
	rsbs r6, r6, #0
_08002580:
	ldrb r2, [r7]
	cmp r5, r2
	beq _080025A0
	lsls r0, r5, #2
	ldr r3, _08002624
	adds r0, r0, r3
	ldr r1, [r4]
	ldr r0, [r0]
	cmp r1, r0
	bne _080025A0
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r1, r0
	bne _080025A0
	str r6, [r4]
_080025A0:
	adds r4, #4
	adds r5, #1
	cmp r5, #3
	ble _08002580
	b _08002824
	.align 2, 0
_080025AC: .4byte 0x040000D4
_080025B0: .4byte intr_main
_080025B4: .4byte IntrMainBuf
_080025B8: .4byte 0x84000200
_080025BC: .4byte 0x03007FFC
_080025C0: .4byte CharData_Sample
_080025C4: .4byte 0x06008000
_080025C8: .4byte 0x80000600
_080025CC: .4byte 0x06010000
_080025D0: .4byte PlttData_Sample
_080025D4: .4byte 0x80000100
_080025D8: .4byte 0x05000200
_080025DC: .4byte BgScData_Sample
_080025E0: .4byte BgBak
_080025E4: .4byte 0x80000280
_080025E8: .4byte 0x80000400
_080025EC: .4byte OamBak
_080025F0: .4byte KeyRep
_080025F4: .4byte vcount
_080025F8: .4byte CurtCurs
_080025FC: .4byte CurP
_08002600: .4byte OamData_Sample
_08002604: .4byte 0xFFFFFC00
_08002608: .4byte 0xFFFFFE00
_0800260C: .4byte 0x84000100
_08002610: .4byte MaxLin
_08002614: .4byte AvrLinT
_08002618: .4byte AvrLinC
_0800261C: .4byte MaxChn
_08002620: .4byte MaxChnC
_08002624: .4byte c_song
_08002628: .4byte p_song
_0800262C: .4byte p_rev
_08002630: .4byte p_mch
_08002634: .4byte p_fre
_08002638: .4byte p_bit
_0800263C: .4byte c_mvg
_08002640: .4byte pbymidi_vg
_08002644: .4byte c_mvo
_08002648: .4byte pbymidi_mv
_0800264C: .4byte c_mpr
_08002650: .4byte pbymidi_pr
_08002654: .4byte seg_m4aLib_end+1
_08002658: .4byte seg_m4aLib_top
_0800265C: .4byte seg_m4aLib_rodata_end
_08002660: .4byte MPlyJmpTbl @ seg_m4aLib_rodata_top anyone?
_08002664: .4byte seg_rodata_end
_08002668: .4byte seg_rodata_top
_0800266C: .4byte 0x04000208
_08002670: .4byte 0x04000200
_08002674: .4byte 0x04000004
_08002678: .4byte Trg
_0800267C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08002706
	ldr r0, _080026D0
	ldrb r1, [r0]
	lsls r3, r1, #2
	mov r2, r8
	adds r1, r3, r2
	adds r6, r0, #0
	ldrh r1, [r1]
	cmp r1, #1
	beq _08002698
	b _08002824
_08002698:
	ldr r2, _080026D4
	adds r0, r3, r2
	mov r4, sl
	adds r1, r3, r4
	ldr r3, [r0]
	ldr r0, [r1]
	adds r4, r2, #0
	cmp r3, r0
	bne _080026E0
	ldr r2, _080026D8
	ldr r0, _080026DC
	lsls r1, r3, #3
	adds r1, r1, r0
	ldrh r5, [r1, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	bge _080026E0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumContinue
	b _08002824
	.align 2, 0
_080026D0: .4byte CurtCurs
_080026D4: .4byte p_song
_080026D8: .4byte mplay_table
_080026DC: .4byte song_table
_080026E0:
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bge _080026EE
	b _08002824
_080026EE:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	ldrb r6, [r6]
	lsls r0, r6, #2
	mov r2, sl
	adds r1, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	b _08002824
_08002706:
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0800271A
	movs r0, #0xa
	bl ValueChangePlus
	b _08002824
_0800271A:
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0800272E
	movs r0, #0x64
	bl ValueChangePlus
	b _08002824
_0800272E:
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08002744
	bl m4aMPlayAllStop
	bl MidiAllStop
	b _08002824
_08002744:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08002758
	ldr r0, _08002754
	strh r2, [r0]
	b _08002824
	.align 2, 0
_08002754: .4byte MaxLin
_08002758:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08002798
	ldr r2, _08002790
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800276C
	subs r0, #1
	strb r0, [r2]
_0800276C:
	ldrb r5, [r2]
	lsls r1, r5, #2
	add r1, r8
	ldr r3, _08002794
	adds r0, r3, #0
	mov r4, sb
	ldrh r4, [r4, #2]
	ands r0, r4
	ldrb r1, [r1, #2]
	orrs r0, r1
	mov r5, sb
	strh r0, [r5, #2]
	ldrb r2, [r2]
	lsls r0, r2, #2
	add r0, r8
	ldrb r0, [r0, #3]
	strb r0, [r5]
	b _08002824
	.align 2, 0
_08002790: .4byte CurtCurs
_08002794: .4byte 0xFFFFFE00
_08002798:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08002804
	ldr r0, _080027BC
	cmp r0, #0
	beq _080027C4
	ldr r1, _080027C0
	ldrb r2, [r1]
	adds r2, #1
	lsls r0, r2, #2
	add r0, r8
	adds r6, r1, #0
	ldrh r0, [r0]
	cmp r0, #8
	bhi _080027D8
	b _080027D6
	.align 2, 0
_080027BC: .4byte pbymidi_swi
_080027C0: .4byte CurtCurs
_080027C4:
	ldr r1, _080027FC
	ldrb r2, [r1]
	adds r2, #1
	lsls r0, r2, #2
	add r0, r8
	adds r6, r1, #0
	ldrh r0, [r0]
	cmp r0, #5
	bhi _080027D8
_080027D6:
	strb r2, [r6]
_080027D8:
	ldrb r0, [r6]
	lsls r1, r0, #2
	add r1, r8
	ldr r2, _08002800
	adds r0, r2, #0
	mov r3, sb
	ldrh r3, [r3, #2]
	ands r0, r3
	ldrb r1, [r1, #2]
	orrs r0, r1
	mov r4, sb
	strh r0, [r4, #2]
	ldrb r6, [r6]
	lsls r0, r6, #2
	add r0, r8
	ldrb r0, [r0, #3]
	strb r0, [r4]
	b _08002824
	.align 2, 0
_080027FC: .4byte CurtCurs
_08002800: .4byte 0xFFFFFE00
_08002804:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08002816
	movs r0, #1
	rsbs r0, r0, #0
	bl ValueChange
	b _08002824
_08002816:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08002824
	movs r0, #1
	bl ValueChange
_08002824:
	movs r5, #0
	ldr r1, _08002978
	ldr r2, _0800297C
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r3, r0
	beq _08002838
	strb r0, [r1]
	ldrb r5, [r2]
	adds r5, #0x80
_08002838:
	ldr r1, _08002980
	ldr r2, _08002984
	ldrb r0, [r2]
	ldrb r4, [r1]
	cmp r4, r0
	beq _0800284C
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #8
	orrs r5, r0
_0800284C:
	ldr r3, _08002988
	ldr r4, _0800298C
	ldrb r2, [r4]
	ldrb r0, [r3]
	cmp r0, r2
	beq _0800286C
	ldr r1, _08002990
	movs r0, #0xf0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800286C
	strb r2, [r3]
	ldrb r4, [r4]
	lsls r0, r4, #0x10
	orrs r5, r0
_0800286C:
	ldr r1, _08002994
	ldr r2, _08002998
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r3, r0
	beq _08002884
	strb r0, [r1]
	movs r0, #0x11
	ldrb r2, [r2]
	subs r0, r0, r2
	lsls r0, r0, #0x14
	orrs r5, r0
_08002884:
	cmp r5, #0
	beq _0800288E
	adds r0, r5, #0
	bl SoundMode_rev01
_0800288E:
	bl SongWrite
	bl ModeWrite
	bl MidiWrite
	ldr r0, _0800299C
	ldrb r5, [r0, #6]
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	cmp r5, #0
	ble _080028BE
	movs r3, #0xc7
_080028AA:
	adds r0, r3, #0
	ldrb r4, [r1]
	ands r0, r4
	cmp r0, #0
	beq _080028B6
	adds r2, #1
_080028B6:
	subs r5, #1
	adds r1, #0x40
	cmp r5, #0
	bgt _080028AA
_080028BE:
	ldr r5, _080029A0
	ldrh r0, [r5]
	cmp r0, r2
	bge _080028C8
	strh r2, [r5]
_080028C8:
	ldr r4, _080029A4
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bls _080028EA
	ldrh r2, [r5]
	movs r0, #0x30
	movs r1, #0x70
	movs r3, #2
	bl ValueWrite
	movs r0, #0
	strh r0, [r4]
	strh r0, [r5]
_080028EA:
	ldr r4, _080029A8
	ldrb r0, [r4]
	adds r5, r0, #0
	bl m4aSoundMain
	bl MidiInputMain
	ldrb r0, [r4]
	subs r5, r0, r5
	cmp r5, #0
	bge _08002902
	adds r5, #0xe4
_08002902:
	ldr r0, _080029AC
	ldrh r1, [r0]
	cmp r1, r5
	bge _08002918
	strh r5, [r0]
	ldrh r2, [r0]
	movs r0, #0xd0
	movs r1, #0x90
	movs r3, #3
	bl ValueWrite
_08002918:
	ldr r4, _080029B0
	ldrh r2, [r4]
	adds r0, r2, r5
	strh r0, [r4]
	ldr r5, _080029B4
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bls _0800294E
	ldrh r0, [r4]
	movs r1, #0xf
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xb0
	movs r1, #0x90
	movs r3, #3
	bl ValueWrite
	movs r0, #0
	strh r0, [r5]
	strh r0, [r4]
_0800294E:
	bl VBlankIntrWait
	ldr r1, _080029B8
	ldr r0, _080029BC
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080029C0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r3, sb
	str r3, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080029C4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08002522
	.align 2, 0
_08002978: .4byte p_rev
_0800297C: .4byte c_rev
_08002980: .4byte p_mch
_08002984: .4byte c_mch
_08002988: .4byte p_fre
_0800298C: .4byte c_fre
_08002990: .4byte Cont
_08002994: .4byte p_bit
_08002998: .4byte c_bit
_0800299C: .4byte m4a_sound
_080029A0: .4byte MaxChn
_080029A4: .4byte MaxChnC
_080029A8: .4byte 0x04000006
_080029AC: .4byte MaxLin
_080029B0: .4byte AvrLinT
_080029B4: .4byte AvrLinC
_080029B8: .4byte 0x040000D4
_080029BC: .4byte BgBak
_080029C0: .4byte 0x80000400
_080029C4: .4byte 0x84000100

	THUMB_FUNC_START KeyRead
KeyRead: @ 0x080029C8
	push {r4, r5, lr}
	ldr r0, _08002A08
	ldrh r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r5, _08002A0C
	ldr r0, _08002A10
	adds r2, r1, #0
	ldrh r3, [r0]
	bics r2, r3
	strh r2, [r5]
	strh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08002A18
	ldr r3, _08002A14
	ldrb r4, [r3]
	adds r0, r4, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _08002A1C
	subs r0, r4, #5
	strb r0, [r3]
	orrs r1, r2
	strh r1, [r5]
	b _08002A1C
	.align 2, 0
_08002A08: .4byte 0x04000130
_08002A0C: .4byte Trg
_08002A10: .4byte Cont
_08002A14: .4byte KeyRep
_08002A18:
	ldr r0, _08002A24
	strb r1, [r0]
_08002A1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002A24: .4byte KeyRep

	THUMB_FUNC_START VBlankIntr
VBlankIntr: @ 0x08002A28
	push {lr}
	bl SoundVSync_rev01
	ldr r1, _08002A38
	movs r0, #1
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08002A38: .4byte 0x03007FF8

	THUMB_FUNC_START IntrDummy
IntrDummy: @ 0x08002A3C
	bx lr
	.align 2, 0

	THUMB_FUNC_START ValueChange
ValueChange: @ 0x08002A40
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08002A64
	ldr r2, _08002A68
	ldrb r4, [r2]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r1, #1
	adds r5, r0, #0
	cmp r1, #7
	bls _08002A5A
	b _08002C84
_08002A5A:
	lsls r0, r1, #2
	ldr r1, _08002A6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002A64: .4byte CurP
_08002A68: .4byte CurtCurs
_08002A6C: .4byte _08002A70
_08002A70: @ jump table
	.4byte _08002A90 @ case 0
	.4byte _08002AD0 @ case 1
	.4byte _08002B0E @ case 2
	.4byte _08002B30 @ case 3
	.4byte _08002B7C @ case 4
	.4byte _08002BBA @ case 5
	.4byte _08002C08 @ case 6
	.4byte _08002C58 @ case 7
_08002A90:
	ldr r0, _08002AAC
	ldrb r4, [r2]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r1, r1, r3
	adds r3, r0, #0
	cmp r1, #0
	bge _08002AB4
	ldr r0, _08002AB0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r1, r0, #1
	b _08002AC0
	.align 2, 0
_08002AAC: .4byte c_song
_08002AB0: .4byte __total_song_n
_08002AB4:
	ldr r0, _08002ACC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blt _08002AC0
	movs r1, #0
_08002AC0:
	ldrb r2, [r2]
	lsls r0, r2, #2
	adds r0, r0, r3
	str r1, [r0]
	b _08002C84
	.align 2, 0
_08002ACC: .4byte __total_song_n
_08002AD0:
	ldr r0, _08002AE8
	ldrb r4, [r0]
	adds r1, r4, r3
	strb r1, [r0]
	lsls r3, r1, #0x18
	lsrs r1, r3, #0x18
	adds r4, r0, #0
	cmp r1, #0xf0
	bls _08002AEC
	movs r0, #0
	b _08002AF2
	.align 2, 0
_08002AE8: .4byte c_rev
_08002AEC:
	cmp r3, #0
	bge _08002AF4
	movs r0, #0x7f
_08002AF2:
	strb r0, [r4]
_08002AF4:
	ldrb r2, [r2]
	lsls r1, r2, #2
	adds r1, r1, r5
	ldrb r0, [r1, #2]
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldrb r2, [r4]
	movs r3, #3
	bl ValueWrite
	b _08002C84
_08002B0E:
	ldr r1, _08002B24
	ldrb r4, [r1]
	adds r0, r4, r3
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #0
	bne _08002B28
	movs r0, #1
	b _08002B9E
	.align 2, 0
_08002B24: .4byte c_mch
_08002B28:
	cmp r0, #0xc
	bls _08002BA0
	movs r0, #0xc
	b _08002B9E
_08002B30:
	ldr r1, _08002B48
	ldrb r4, [r1]
	adds r0, r4, r3
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0
	bne _08002B4C
	movs r0, #1
	b _08002B52
	.align 2, 0
_08002B48: .4byte c_fre
_08002B4C:
	cmp r0, #0xc
	bls _08002B54
	movs r0, #0xc
_08002B52:
	strb r0, [r4]
_08002B54:
	ldrb r2, [r2]
	lsls r1, r2, #2
	adds r1, r1, r5
	ldrb r0, [r1, #2]
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldr r3, _08002B78
	ldrb r2, [r4]
	subs r2, #1
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r3, #5
	bl ValueWrite
	b _08002C84
	.align 2, 0
_08002B78: .4byte FreTbl
_08002B7C:
	ldr r1, _08002B94
	ldrb r4, [r1]
	adds r0, r4, r3
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #5
	bhi _08002B98
	movs r0, #6
	b _08002B9E
	.align 2, 0
_08002B94: .4byte c_bit
_08002B98:
	cmp r0, #9
	bls _08002BA0
	movs r0, #9
_08002B9E:
	strb r0, [r3]
_08002BA0:
	ldrb r2, [r2]
	lsls r1, r2, #2
	adds r1, r1, r5
	ldrb r0, [r1, #2]
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldrb r2, [r3]
	movs r3, #2
	bl ValueWrite
	b _08002C84
_08002BBA:
	ldr r0, _08002BCC
	ldr r1, [r0]
	adds r1, r1, r3
	str r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bge _08002BD0
	movs r0, #0
	b _08002BDC
	.align 2, 0
_08002BCC: .4byte c_mvg
_08002BD0:
	ldr r0, _08002BF8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blt _08002BDE
	subs r0, #1
_08002BDC:
	str r0, [r2]
_08002BDE:
	ldr r0, _08002BFC
	cmp r0, #0
	beq _08002C84
	ldr r1, _08002C00
	ldr r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08002C84
	ldr r0, _08002C04
	str r1, [r0, #0x30]
	b _08002C84
	.align 2, 0
_08002BF8: .4byte __total_vgrp_n
_08002BFC: .4byte pbymidi_swi
_08002C00: .4byte app_vgrp_table
_08002C04: .4byte midi_ma
_08002C08:
	ldr r0, _08002C1C
	ldr r1, [r0]
	adds r1, r1, r3
	str r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bge _08002C20
	movs r0, #0
	b _08002C26
	.align 2, 0
_08002C1C: .4byte c_mvo
_08002C20:
	cmp r1, #0x7f
	ble _08002C28
	movs r0, #0x7f
_08002C26:
	str r0, [r2]
_08002C28:
	ldr r0, _08002C4C
	cmp r0, #0
	beq _08002C84
	ldr r4, _08002C50
	ldr r5, _08002C54
	ldr r0, [r2]
	lsls r0, r0, #8
	movs r1, #0x7f
	bl __divsi3
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayVolumeControl
	b _08002C84
	.align 2, 0
_08002C4C: .4byte pbymidi_swi
_08002C50: .4byte midi_ma
_08002C54: .4byte 0x0000FFFF
_08002C58:
	ldr r0, _08002C6C
	ldr r1, [r0]
	adds r1, r1, r3
	str r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bge _08002C70
	movs r0, #0
	b _08002C76
	.align 2, 0
_08002C6C: .4byte c_mpr
_08002C70:
	cmp r1, #0xff
	ble _08002C78
	movs r0, #0xff
_08002C76:
	str r0, [r2]
_08002C78:
	ldr r0, _08002C8C
	cmp r0, #0
	beq _08002C84
	ldr r1, _08002C90
	ldr r0, [r2]
	strb r0, [r1, #9]
_08002C84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002C8C: .4byte pbymidi_swi
_08002C90: .4byte midi_ma

	THUMB_FUNC_START ValueChangePlus
ValueChangePlus: @ 0x08002C94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, _08002CC0
	ldr r2, _08002CC4
	ldrb r3, [r2]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r1, #1
	mov r8, r0
	adds r7, r2, #0
	cmp r1, #7
	bls _08002CB4
	b _08002EAE
_08002CB4:
	lsls r0, r1, #2
	ldr r1, _08002CC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002CC0: .4byte CurP
_08002CC4: .4byte CurtCurs
_08002CC8: .4byte _08002CCC
_08002CCC: @ jump table
	.4byte _08002CEC @ case 0
	.4byte _08002D3C @ case 1
	.4byte _08002EAE @ case 2
	.4byte _08002EAE @ case 3
	.4byte _08002EAE @ case 4
	.4byte _08002D90 @ case 5
	.4byte _08002DFC @ case 6
	.4byte _08002E68 @ case 7
_08002CEC:
	ldr r4, _08002D10
	ldrb r1, [r7]
	lsls r0, r1, #2
	adds r0, r0, r4
	ldr r6, [r0]
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r0, r6, #0
	bl __modsi3
	adds r2, r0, #0
	lsls r0, r5, #3
	adds r0, r0, r5
	cmp r2, r0
	blt _08002D14
	rsbs r5, r0, #0
	b _08002D2C
	.align 2, 0
_08002D10: .4byte c_song
_08002D14:
	adds r1, r6, r5
	ldr r0, _08002D38
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blt _08002D2C
	adds r0, r2, #0
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	muls r5, r0, r5
_08002D2C:
	ldrb r7, [r7]
	lsls r0, r7, #2
	adds r0, r0, r4
	adds r1, r6, r5
	str r1, [r0]
	b _08002EAE
	.align 2, 0
_08002D38: .4byte __total_song_n
_08002D3C:
	ldr r4, _08002D5C
	ldrb r6, [r4]
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r0, r6, #0
	bl __modsi3
	adds r1, r0, #0
	lsls r0, r5, #3
	adds r0, r0, r5
	cmp r1, r0
	blt _08002D60
	rsbs r5, r0, #0
	b _08002D72
	.align 2, 0
_08002D5C: .4byte c_rev
_08002D60:
	adds r0, r6, r5
	cmp r0, #0x7f
	ble _08002D72
	adds r0, r1, #0
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	muls r5, r0, r5
_08002D72:
	adds r0, r6, r5
	strb r0, [r4]
	ldrb r7, [r7]
	lsls r1, r7, #2
	add r1, r8
	ldrb r0, [r1, #2]
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldrb r2, [r4]
	movs r3, #3
	bl ValueWrite
	b _08002EAE
_08002D90:
	ldr r4, _08002DB0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r6, [r4]
	adds r0, r6, #0
	bl __modsi3
	adds r2, r0, #0
	lsls r0, r5, #3
	adds r0, r0, r5
	cmp r2, r0
	blt _08002DB4
	rsbs r5, r0, #0
	b _08002DCC
	.align 2, 0
_08002DB0: .4byte c_mvg
_08002DB4:
	adds r1, r6, r5
	ldr r0, _08002DEC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blt _08002DCC
	adds r0, r2, #0
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	muls r5, r0, r5
_08002DCC:
	ldr r0, [r4]
	adds r2, r0, r5
	str r2, [r4]
	ldr r0, _08002DF0
	cmp r0, #0
	beq _08002EAE
	ldr r1, _08002DF4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08002EAE
	ldr r0, _08002DF8
	str r1, [r0, #0x30]
	b _08002EAE
	.align 2, 0
_08002DEC: .4byte __total_vgrp_n
_08002DF0: .4byte pbymidi_swi
_08002DF4: .4byte app_vgrp_table
_08002DF8: .4byte midi_ma
_08002DFC:
	ldr r4, _08002E1C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r6, [r4]
	adds r0, r6, #0
	bl __modsi3
	adds r1, r0, #0
	lsls r0, r5, #3
	adds r0, r0, r5
	cmp r1, r0
	blt _08002E20
	rsbs r5, r0, #0
	b _08002E32
	.align 2, 0
_08002E1C: .4byte c_mvo
_08002E20:
	adds r0, r6, r5
	cmp r0, #0x7f
	ble _08002E32
	adds r0, r1, #0
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	muls r5, r0, r5
_08002E32:
	ldr r0, [r4]
	adds r1, r0, r5
	str r1, [r4]
	ldr r0, _08002E5C
	cmp r0, #0
	beq _08002EAE
	ldr r4, _08002E60
	ldr r5, _08002E64
	lsls r0, r1, #8
	movs r1, #0x7f
	bl __divsi3
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayVolumeControl
	b _08002EAE
	.align 2, 0
_08002E5C: .4byte pbymidi_swi
_08002E60: .4byte midi_ma
_08002E64: .4byte 0x0000FFFF
_08002E68:
	ldr r4, _08002E88
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r6, [r4]
	adds r0, r6, #0
	bl __modsi3
	adds r1, r0, #0
	lsls r0, r5, #3
	adds r0, r0, r5
	cmp r1, r0
	blt _08002E8C
	rsbs r5, r0, #0
	b _08002E9E
	.align 2, 0
_08002E88: .4byte c_mpr
_08002E8C:
	adds r0, r6, r5
	cmp r0, #0xff
	ble _08002E9E
	adds r0, r1, #0
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	muls r5, r0, r5
_08002E9E:
	ldr r0, [r4]
	adds r1, r0, r5
	str r1, [r4]
	ldr r0, _08002EB8
	cmp r0, #0
	beq _08002EAE
	ldr r0, _08002EBC
	strb r1, [r0, #9]
_08002EAE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002EB8: .4byte pbymidi_swi
_08002EBC: .4byte midi_ma

	THUMB_FUNC_START StrWrite
StrWrite: @ 0x08002EC0
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x1b
	lsrs r1, r1, #0x1b
	lsls r1, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08002ED4
	adds r1, r0, r1
	b _08002EE0
	.align 2, 0
_08002ED4: .4byte BgBak
_08002ED8:
	ldrb r0, [r2]
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
_08002EE0:
	ldrb r0, [r2]
	cmp r0, #0
	bne _08002ED8
	bx lr

	THUMB_FUNC_START ValueWrite
ValueWrite: @ 0x08002EE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #4]
	str r0, [sp]
	movs r6, #0
	mov r1, sp
	movs r0, #0x30
	strb r0, [r1]
	ldr r0, _08002F78
	mov sl, r0
	cmp r5, #0
	beq _08002F3E
_08002F1E:
	mov r1, sp
	adds r4, r1, r6
	adds r0, r5, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r6, #1
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _08002F1E
_08002F3E:
	movs r6, #0
	mov r2, r8
	lsrs r0, r2, #3
	mov r2, sb
	lsrs r1, r2, #3
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r7
	lsls r0, r0, #1
	mov r2, sl
	adds r1, r0, r2
	cmp r6, r7
	bge _08002F68
_08002F58:
	mov r2, sp
	adds r0, r2, r6
	ldrb r0, [r0]
	strh r0, [r1]
	adds r6, #1
	subs r1, #2
	cmp r6, r7
	blt _08002F58
_08002F68:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F78: .4byte p_fre+0xE

	THUMB_FUNC_START ValueWriteHex
ValueWriteHex: @ 0x08002F7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #4]
	str r0, [sp]
	movs r3, #0
	mov r1, sp
	movs r0, #0x30
	strb r0, [r1]
	ldr r0, _08003008
	mov r8, r0
	cmp r4, #0
	beq _08002FCC
	movs r6, #0xf
_08002FAE:
	mov r0, sp
	adds r2, r0, r3
	adds r1, r4, #0
	ands r1, r6
	adds r0, r1, #0
	adds r0, #0x30
	strb r0, [r2]
	cmp r0, #0x39
	bls _08002FC4
	adds r0, #7
	strb r0, [r2]
_08002FC4:
	adds r3, #1
	lsrs r4, r4, #4
	cmp r4, #0
	bne _08002FAE
_08002FCC:
	mov r2, sp
	adds r1, r2, r3
	movs r0, #0x24
	strb r0, [r1]
	movs r3, #0
	lsrs r0, r7, #3
	mov r2, ip
	lsrs r1, r2, #3
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r0, r2
	cmp r3, r5
	bge _08002FFC
_08002FEC:
	mov r2, sp
	adds r0, r2, r3
	ldrb r0, [r0]
	strh r0, [r1]
	adds r3, #1
	subs r1, #2
	cmp r3, r5
	blt _08002FEC
_08002FFC:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003008: .4byte p_fre+0xE

	THUMB_FUNC_START SongWrite
SongWrite: @ 0x0800300C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sb, r0
	ldr r1, _08003060
	mov sl, r1
_0800301E:
	ldr r1, _08003064
	ldr r0, _08003068
	mov r3, sb
	lsls r2, r3, #2
	adds r0, r2, r0
	ldr r3, [r0]
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	mov r8, r0
	ldr r1, _0800306C
	movs r0, #0x1f
	ldrb r1, [r1]
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0x10
	bls _08003078
	ldr r0, _08003070
	adds r0, r7, r0
	ldr r0, [r0]
	cmp r0, r3
	beq _08003078
	mov r0, sl
	adds r1, r7, r0
	ldrb r0, [r1, #2]
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldr r2, _08003074
	bl StrWrite
	b _08003092
	.align 2, 0
_08003060: .4byte CurP
_08003064: .4byte song_table
_08003068: .4byte c_song
_0800306C: .4byte vcount
_08003070: .4byte p_song
_08003074: .4byte gUnknown_08005524
_08003078:
	mov r2, sl
	adds r1, r7, r2
	ldrb r0, [r1, #2]
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldr r3, _08003184
	adds r2, r7, r3
	ldr r2, [r2]
	movs r3, #4
	bl ValueWrite
_08003092:
	mov r0, sl
	adds r1, r7, r0
	ldrb r6, [r1, #2]
	adds r0, r6, #0
	adds r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r5, [r1, #3]
	adds r1, r5, #0
	mov r2, r8
	movs r3, #3
	bl ValueWrite
	adds r0, r6, #0
	adds r0, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08003184
	adds r4, r7, r4
	ldr r1, [r4]
	lsls r1, r1, #2
	ldr r2, _08003188
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r5, #0
	movs r3, #3
	bl ValueWrite
	adds r0, r6, #0
	adds r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #2
	ldr r3, _08003188
	adds r1, r1, r3
	ldrh r2, [r1, #2]
	adds r1, r5, #0
	movs r3, #3
	bl ValueWrite
	adds r0, r6, #0
	adds r0, #0x90
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _0800318C
	ldr r1, [r4]
	lsls r1, r1, #3
	adds r1, r1, r6
	ldr r1, [r1]
	ldrb r2, [r1, #2]
	adds r1, r5, #0
	movs r3, #3
	bl ValueWrite
	ldr r0, _08003190
	adds r0, r7, r0
	ldr r1, [r0]
	ldr r0, [r4]
	mov r2, r8
	lsls r5, r2, #1
	cmp r1, r0
	bne _080031B6
	lsls r1, r1, #3
	adds r1, r1, r6
	adds r0, r5, r2
	lsls r3, r0, #2
	ldr r2, _08003194
	adds r0, r3, r2
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _080031B6
	movs r2, #0
	movs r1, #0
	mov r6, sb
	adds r6, #1
	ldr r0, _08003194
	adds r0, r3, r0
	ldr r0, [r0]
	ldr r3, [r0, #4]
	movs r4, #1
_08003138:
	adds r0, r4, #0
	lsls r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08003144
	adds r2, #1
_08003144:
	adds r1, #1
	cmp r1, #0xf
	ble _08003138
	cmp r2, #0
	beq _080031A0
	ldr r1, _08003198
	movs r0, #0x1f
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0x10
	bls _080031A0
	mov r3, r8
	adds r0, r5, r3
	lsls r0, r0, #2
	ldr r1, _08003194
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	bge _080031A0
	mov r2, sl
	adds r1, r7, r2
	ldrb r0, [r1, #2]
	adds r0, #0xb0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldr r2, _0800319C
	bl StrWrite
	b _080031CE
	.align 2, 0
_08003184: .4byte c_song
_08003188: .4byte app_song_table
_0800318C: .4byte song_table
_08003190: .4byte p_song
_08003194: .4byte mplay_table
_08003198: .4byte vcount
_0800319C: .4byte gUnknown_0800552C
_080031A0:
	mov r3, sl
	adds r1, r7, r3
	ldrb r0, [r1, #2]
	adds r0, #0xb0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	movs r3, #2
	bl ValueWrite
	b _080031CE
_080031B6:
	mov r0, sl
	adds r1, r7, r0
	ldrb r0, [r1, #2]
	adds r0, #0xb0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	ldr r2, _08003204
	bl StrWrite
	mov r6, sb
	adds r6, #1
_080031CE:
	mov r2, sl
	adds r1, r7, r2
	ldrb r0, [r1, #2]
	adds r0, #0xc8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	mov r3, r8
	adds r2, r5, r3
	lsls r2, r2, #2
	ldr r3, _08003208
	adds r2, r2, r3
	ldrh r2, [r2, #8]
	movs r3, #2
	bl ValueWrite
	mov sb, r6
	cmp r6, #3
	bgt _080031F6
	b _0800301E
_080031F6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003204: .4byte gUnknown_08005530
_08003208: .4byte mplay_table

	THUMB_FUNC_START ModeWrite
ModeWrite: @ 0x0800320C
	push {r4, lr}
	ldr r2, _08003298
	ldr r4, _0800329C
	ldrb r1, [r4, #5]
	ldrb r0, [r2]
	cmp r0, r1
	beq _0800322C
	ldr r0, _080032A0
	strb r1, [r0]
	strb r1, [r2]
	ldrb r2, [r0]
	movs r0, #0x48
	movs r1, #0x60
	movs r3, #3
	bl ValueWrite
_0800322C:
	ldr r2, _080032A4
	ldrb r1, [r4, #6]
	ldrb r0, [r2]
	cmp r0, r1
	beq _08003248
	ldr r0, _080032A8
	strb r1, [r0]
	strb r1, [r2]
	ldrb r2, [r0]
	movs r0, #0x50
	movs r1, #0x70
	movs r3, #2
	bl ValueWrite
_08003248:
	ldr r2, _080032AC
	ldrb r1, [r4, #8]
	ldrb r0, [r2]
	cmp r0, r1
	beq _0800326E
	ldr r0, _080032B0
	strb r1, [r0]
	strb r1, [r2]
	ldr r1, _080032B4
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x38
	movs r1, #0x80
	movs r3, #5
	bl ValueWrite
_0800326E:
	ldr r0, _080032B8
	ldrb r0, [r0]
	lsrs r0, r0, #6
	movs r1, #9
	subs r1, r1, r0
	ldr r2, _080032BC
	ldrb r0, [r2]
	cmp r0, r1
	beq _08003292
	ldr r0, _080032C0
	strb r1, [r0]
	strb r1, [r2]
	ldrb r2, [r0]
	movs r0, #0x50
	movs r1, #0x90
	movs r3, #2
	bl ValueWrite
_08003292:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003298: .4byte p_rev
_0800329C: .4byte m4a_sound
_080032A0: .4byte c_rev
_080032A4: .4byte p_mch
_080032A8: .4byte c_mch
_080032AC: .4byte p_fre
_080032B0: .4byte c_fre
_080032B4: .4byte FreTbl
_080032B8: .4byte 0x04000089
_080032BC: .4byte p_bit
_080032C0: .4byte c_bit

	THUMB_FUNC_START MidiWrite
MidiWrite: @ 0x080032C4
	push {lr}
	ldr r0, _0800332C
	cmp r0, #0
	beq _0800335E
	ldr r2, _08003330
	movs r0, #0x80
	movs r1, #0x60
	bl StrWrite
	ldr r0, _08003334
	ldr r2, [r0]
	movs r0, #0xc8
	movs r1, #0x60
	movs r3, #3
	bl ValueWrite
	ldr r2, _08003338
	movs r0, #0xa0
	movs r1, #0x68
	bl StrWrite
	ldr r0, _0800333C
	ldr r2, [r0]
	movs r0, #0xc8
	movs r1, #0x68
	movs r3, #3
	bl ValueWrite
	ldr r2, _08003340
	movs r0, #0xa0
	movs r1, #0x70
	bl StrWrite
	ldr r0, _08003344
	ldr r2, [r0]
	movs r0, #0xc8
	movs r1, #0x70
	movs r3, #3
	bl ValueWrite
	ldr r0, _08003348
	ldr r1, _0800334C
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bne _08003354
	ldr r2, _08003350
	movs r0, #0x78
	movs r1, #0x60
	bl StrWrite
	b _0800335E
	.align 2, 0
_0800332C: .4byte pbymidi_swi
_08003330: .4byte gUnknown_08005534
_08003334: .4byte c_mvg
_08003338: .4byte gUnknown_08005540
_0800333C: .4byte c_mvo
_08003340: .4byte gUnknown_08005548
_08003344: .4byte c_mpr
_08003348: .4byte w_midibuf
_0800334C: .4byte r_midibuf
_08003350: .4byte gUnknown_08005550
_08003354:
	ldr r2, _08003364
	movs r0, #0x78
	movs r1, #0x60
	bl StrWrite
_0800335E:
	pop {r0}
	bx r0
	.align 2, 0
_08003364: .4byte gUnknown_08005554

	THUMB_FUNC_START MidiInputInit
MidiInputInit: @ 0x08003368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800344C
	cmp r0, #0
	beq _0800343C
	ldr r0, _08003450
	ldr r0, [r0, #0x34]
	adds r0, #0x8c
	ldr r4, _08003454
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r2, _08003458
	str r2, [r4, #0x2c]
	movs r3, #0
	movs r0, #0x10
	strb r0, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r4, #4]
	ldr r1, _0800345C
	ldr r0, _08003460
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x30]
	ldr r0, _08003464
	strb r0, [r4, #9]
	ldr r0, _08003468
	strh r0, [r4, #0x1c]
	strh r0, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1e]
	strh r3, [r4, #0x22]
	ldr r0, _0800346C
	str r0, [r4, #0x34]
	movs r6, #0
	adds r4, r2, #0
	movs r7, #2
	movs r1, #0x7f
	mov sb, r1
	adds r5, r4, #0
	adds r5, #0x24
	ldr r0, _08003470
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	mov r8, r0
_080033D2:
	ldr r0, _08003450
	ldr r0, [r0, #0x34]
	adds r0, #0x8c
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	movs r0, #0x80
	strb r0, [r4]
	strb r7, [r4, #0xf]
	mov r0, r8
	movs r1, #0x7f
	bl __divsi3
	strb r0, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	movs r0, #1
	strb r0, [r5]
	str r7, [r4, #0x28]
	movs r0, #0xf
	strb r0, [r5, #0xa]
	mov r3, sb
	strb r3, [r4, #0x12]
	movs r0, #3
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	adds r6, #1
	adds r5, #0x50
	adds r4, #0x50
	ldr r0, _08003454
	ldrb r0, [r0, #8]
	cmp r6, r0
	blt _080033D2
	ldr r4, _08003474
	ldr r3, _08003478
	ldr r2, _0800347C
	ldr r1, _08003480
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	str r0, [r3]
	str r0, [r4]
	bl MidiPortInit
	ldr r2, _08003484
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0800343C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800344C: .4byte pbymidi_swi
_08003450: .4byte m4a_sound
_08003454: .4byte midi_ma
_08003458: .4byte midi_ta
_0800345C: .4byte app_vgrp_table
_08003460: .4byte pbymidi_vg
_08003464: .4byte pbymidi_pr
_08003468: .4byte pbymidi_tm
_0800346C: .4byte 0x68736D53
_08003470: .4byte pbymidi_mv
_08003474: .4byte w_midibuf
_08003478: .4byte r_midibuf
_0800347C: .4byte runst
_08003480: .4byte sysex
_08003484: .4byte 0x04000200

	THUMB_FUNC_START MidiPortInit
MidiPortInit: @ 0x08003488
	ldr r1, _080034B8
	movs r0, #0
	strb r0, [r1]
	push {r0, r1, r2, r3, r4, r5, r6, r7}
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	strb r0, [r1]
	push {r0, r1, r2, r3, r4, r5, r6, r7}
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	strb r0, [r1]
	push {r0, r1, r2, r3, r4, r5, r6, r7}
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	movs r0, #0x40
	strb r0, [r1]
	push {r0, r1, r2, r3, r4, r5, r6, r7}
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	movs r0, #0x4e
	strb r0, [r1]
	push {r0, r1, r2, r3, r4, r5, r6, r7}
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	movs r0, #0x34
	strb r0, [r1]
	push {r0, r1, r2, r3, r4, r5, r6, r7}
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	bx lr
	.align 2, 0
_080034B8: .4byte 0x0E000001

	THUMB_FUNC_START MidiInIntr
MidiInIntr: @ 0x080034BC
	push {r4, lr}
	ldr r0, _08003508
	cmp r0, #0
	beq _08003502
	ldr r0, _0800350C
	ldrb r0, [r0]
	adds r1, r0, #0
	movs r0, #0x38
	ands r0, r1
	cmp r0, #0
	bne _08003502
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08003502
	movs r0, #0xe0
	lsls r0, r0, #0x14
	ldrb r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xf7
	bhi _08003502
	ldr r4, _08003510
	ldr r1, [r4]
	movs r2, #0
	cmp r1, #0xfe
	bgt _080034F2
	adds r2, r1, #1
_080034F2:
	ldr r0, _08003514
	ldr r0, [r0]
	cmp r2, r0
	beq _08003502
	ldr r0, _08003518
	adds r0, r1, r0
	strb r3, [r0]
	str r2, [r4]
_08003502:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003508: .4byte pbymidi_swi
_0800350C: .4byte 0x0E000001
_08003510: .4byte w_midibuf
_08003514: .4byte r_midibuf
_08003518: .4byte midibuf

	THUMB_FUNC_START ReadMidi
ReadMidi: @ 0x0800351C
	ldr r0, _08003530
	ldr r2, _08003534
	ldr r0, [r0]
	ldr r1, [r2]
	cmp r0, r1
	bne _08003538
	movs r0, #1
	rsbs r0, r0, #0
	b _08003552
	.align 2, 0
_08003530: .4byte w_midibuf
_08003534: .4byte r_midibuf
_08003538:
	ldr r0, _08003548
	adds r0, r1, r0
	ldrb r3, [r0]
	cmp r1, #0xfe
	bgt _0800354C
	adds r0, r1, #1
	b _0800354E
	.align 2, 0
_08003548: .4byte midibuf
_0800354C:
	movs r0, #0
_0800354E:
	str r0, [r2]
	adds r0, r3, #0
_08003552:
	bx lr

	THUMB_FUNC_START unReadMidi
unReadMidi: @ 0x08003554
	ldr r1, _08003560
	ldr r0, [r1]
	cmp r0, #0
	beq _08003564
	subs r0, #1
	b _08003566
	.align 2, 0
_08003560: .4byte r_midibuf
_08003564:
	movs r0, #0xff
_08003566:
	str r0, [r1]
	bx lr
	.align 2, 0

	THUMB_FUNC_START MidiInputMain
MidiInputMain: @ 0x0800356C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08003594
	cmp r0, #0
	bne _08003580
	b _08003B7C
_08003580:
	ldr r2, _08003598
	ldr r1, [r2, #0x34]
	ldr r0, _0800359C
	cmp r1, r0
	beq _0800358C
	b _08003B7C
_0800358C:
	adds r0, r1, #1
	str r0, [r2, #0x34]
	b _080039E8
	.align 2, 0
_08003594: .4byte pbymidi_swi
_08003598: .4byte midi_ma
_0800359C: .4byte 0x68736D53
_080035A0:
	ldr r1, _080035B4
	ldr r0, [r1]
	cmp r0, #0
	beq _080035B8
	cmp r5, #0xf7
	beq _080035AE
	b _080039E8
_080035AE:
	movs r0, #0
	str r0, [r1]
	b _080039E8
	.align 2, 0
_080035B4: .4byte sysex
_080035B8:
	cmp r5, #0x7f
	bgt _080035C8
	adds r4, r5, #0
	ldr r0, _080035C4
	ldr r5, [r0]
	b _080035FC
	.align 2, 0
_080035C4: .4byte runst
_080035C8:
	cmp r5, #0xef
	ble _080035E0
	cmp r5, #0xf0
	beq _080035D2
	b _080039E8
_080035D2:
	ldr r1, _080035DC
	movs r0, #1
	str r0, [r1]
	b _080039E8
	.align 2, 0
_080035DC: .4byte sysex
_080035E0:
	ldr r0, _080035F8
	str r5, [r0]
	bl ReadMidi
	adds r4, r0, #0
	cmp r4, #0
	bge _080035F0
	b _080039F4
_080035F0:
	cmp r4, #0x7f
	ble _080035FC
	adds r5, r4, #0
	b _080035C8
	.align 2, 0
_080035F8: .4byte runst
_080035FC:
	movs r0, #0xf
	adds r7, r5, #0
	ands r7, r0
	movs r0, #0xf0
	ands r5, r0
	cmp r5, #0xc0
	beq _08003628
	cmp r5, #0xd0
	beq _08003628
	bl ReadMidi
	mov r8, r0
	cmp r0, #0
	bge _0800361E
	bl unReadMidi
	b _080039F4
_0800361E:
	mov r0, r8
	cmp r0, #0x7f
	ble _08003628
	mov r5, r8
	b _080035C8
_08003628:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #4
	ldr r1, _08003648
	adds r6, r0, r1
	mov r1, sp
	str r1, [r6, #0x40]
	cmp r5, #0xb0
	beq _0800369C
	cmp r5, #0xb0
	bgt _0800364C
	cmp r5, #0x80
	beq _0800365A
	cmp r5, #0x90
	beq _08003670
	b _080039E8
	.align 2, 0
_08003648: .4byte midi_ta
_0800364C:
	cmp r5, #0xc0
	bne _08003652
	b _080039B8
_08003652:
	cmp r5, #0xe0
	bne _08003658
	b _080039D4
_08003658:
	b _080039E8
_0800365A:
	mov r0, sp
	strb r4, [r0]
	ldr r0, _08003668
	ldr r1, [r0, #0x34]
	ldr r0, _0800366C
	ldr r2, [r1, #0x74]
	b _080039C4
	.align 2, 0
_08003668: .4byte m4a_sound
_0800366C: .4byte midi_ma
_08003670:
	mov r2, r8
	cmp r2, #0
	beq _0800365A
	mov r0, sp
	strb r4, [r0]
	strb r2, [r0, #1]
	mov r1, sp
	movs r0, #0x80
	strb r0, [r1, #2]
	ldr r0, _08003694
	ldr r1, _08003698
	ldr r3, [r0, #0x38]
	movs r0, #0
	adds r2, r6, #0
	bl _call_via_r3
	b _080039E8
	.align 2, 0
_08003694: .4byte m4a_sound
_08003698: .4byte midi_ma
_0800369C:
	subs r0, r4, #1
	cmp r0, #0x7e
	bls _080036A4
	b _080039E8
_080036A4:
	lsls r0, r0, #2
	ldr r1, _080036B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080036B0: .4byte _080036B4
_080036B4: @ jump table
	.4byte _080038B0 @ case 0
	.4byte _080039E8 @ case 1
	.4byte _080039E8 @ case 2
	.4byte _080039E8 @ case 3
	.4byte _080039E8 @ case 4
	.4byte _080039E8 @ case 5
	.4byte _080038C8 @ case 6
	.4byte _080039E8 @ case 7
	.4byte _080039E8 @ case 8
	.4byte _080038E0 @ case 9
	.4byte _080039E8 @ case 10
	.4byte _080039E8 @ case 11
	.4byte _080039E8 @ case 12
	.4byte _080039E8 @ case 13
	.4byte _080039E8 @ case 14
	.4byte _080039E8 @ case 15
	.4byte _080039E8 @ case 16
	.4byte _080039E8 @ case 17
	.4byte _080039E8 @ case 18
	.4byte _080038F8 @ case 19
	.4byte _08003910 @ case 20
	.4byte _08003928 @ case 21
	.4byte _080039E8 @ case 22
	.4byte _08003940 @ case 23
	.4byte _080039E8 @ case 24
	.4byte _08003958 @ case 25
	.4byte _080039E8 @ case 26
	.4byte _080039E8 @ case 27
	.4byte _08003994 @ case 28
	.4byte _08003988 @ case 29
	.4byte _08003994 @ case 30
	.4byte _080039E8 @ case 31
	.4byte _080039E8 @ case 32
	.4byte _080039E8 @ case 33
	.4byte _080039E8 @ case 34
	.4byte _080039E8 @ case 35
	.4byte _080039E8 @ case 36
	.4byte _080039E8 @ case 37
	.4byte _08003970 @ case 38
	.4byte _080039E8 @ case 39
	.4byte _080039E8 @ case 40
	.4byte _080039E8 @ case 41
	.4byte _080039E8 @ case 42
	.4byte _080039E8 @ case 43
	.4byte _080039E8 @ case 44
	.4byte _080039E8 @ case 45
	.4byte _080039E8 @ case 46
	.4byte _080039E8 @ case 47
	.4byte _080039E8 @ case 48
	.4byte _080039E8 @ case 49
	.4byte _080039E8 @ case 50
	.4byte _080039E8 @ case 51
	.4byte _080039E8 @ case 52
	.4byte _080039E8 @ case 53
	.4byte _080039E8 @ case 54
	.4byte _080039E8 @ case 55
	.4byte _080039E8 @ case 56
	.4byte _080039E8 @ case 57
	.4byte _080039E8 @ case 58
	.4byte _080039E8 @ case 59
	.4byte _080039E8 @ case 60
	.4byte _080039E8 @ case 61
	.4byte _080039E8 @ case 62
	.4byte _080039E8 @ case 63
	.4byte _080039E8 @ case 64
	.4byte _080039E8 @ case 65
	.4byte _080039E8 @ case 66
	.4byte _080039E8 @ case 67
	.4byte _080039E8 @ case 68
	.4byte _080039E8 @ case 69
	.4byte _080039E8 @ case 70
	.4byte _080039E8 @ case 71
	.4byte _080039E8 @ case 72
	.4byte _080039E8 @ case 73
	.4byte _080039E8 @ case 74
	.4byte _080039E8 @ case 75
	.4byte _080039E8 @ case 76
	.4byte _080039E8 @ case 77
	.4byte _080039E8 @ case 78
	.4byte _080039E8 @ case 79
	.4byte _080039E8 @ case 80
	.4byte _080039E8 @ case 81
	.4byte _080039E8 @ case 82
	.4byte _080039E8 @ case 83
	.4byte _080039E8 @ case 84
	.4byte _080039E8 @ case 85
	.4byte _080039E8 @ case 86
	.4byte _080039E8 @ case 87
	.4byte _080039E8 @ case 88
	.4byte _080039E8 @ case 89
	.4byte _080039E8 @ case 90
	.4byte _080039E8 @ case 91
	.4byte _080039E8 @ case 92
	.4byte _080039E8 @ case 93
	.4byte _080039E8 @ case 94
	.4byte _080039E8 @ case 95
	.4byte _080039E8 @ case 96
	.4byte _080039E8 @ case 97
	.4byte _080039E8 @ case 98
	.4byte _080039E8 @ case 99
	.4byte _080039E8 @ case 100
	.4byte _080039E8 @ case 101
	.4byte _080039E8 @ case 102
	.4byte _080039E8 @ case 103
	.4byte _080039E8 @ case 104
	.4byte _080039E8 @ case 105
	.4byte _080039E8 @ case 106
	.4byte _080038F8 @ case 107
	.4byte _08003910 @ case 108
	.4byte _08003928 @ case 109
	.4byte _080039E8 @ case 110
	.4byte _08003940 @ case 111
	.4byte _080039E8 @ case 112
	.4byte _08003958 @ case 113
	.4byte _080039E8 @ case 114
	.4byte _080039E8 @ case 115
	.4byte _08003994 @ case 116
	.4byte _08003988 @ case 117
	.4byte _08003994 @ case 118
	.4byte _080039E8 @ case 119
	.4byte _080039E8 @ case 120
	.4byte _080039E8 @ case 121
	.4byte _080039E8 @ case 122
	.4byte _080039E8 @ case 123
	.4byte _080039E8 @ case 124
	.4byte _080039E8 @ case 125
	.4byte _08003970 @ case 126
_080038B0:
	mov r0, sp
	mov r3, r8
	strb r3, [r0]
	ldr r0, _080038C0
	ldr r1, [r0, #0x34]
	ldr r0, _080038C4
	ldr r2, [r1, #0x4c]
	b _080039C4
	.align 2, 0
_080038C0: .4byte m4a_sound
_080038C4: .4byte midi_ma
_080038C8:
	mov r0, sp
	mov r4, r8
	strb r4, [r0]
	ldr r0, _080038D8
	ldr r1, [r0, #0x34]
	ldr r0, _080038DC
	ldr r2, [r1, #0x34]
	b _080039C4
	.align 2, 0
_080038D8: .4byte m4a_sound
_080038DC: .4byte midi_ma
_080038E0:
	mov r0, sp
	mov r7, r8
	strb r7, [r0]
	ldr r0, _080038F0
	ldr r1, [r0, #0x34]
	ldr r0, _080038F4
	ldr r2, [r1, #0x38]
	b _080039C4
	.align 2, 0
_080038F0: .4byte m4a_sound
_080038F4: .4byte midi_ma
_080038F8:
	mov r0, sp
	mov r1, r8
	strb r1, [r0]
	ldr r0, _08003908
	ldr r1, [r0, #0x34]
	ldr r0, _0800390C
	ldr r2, [r1, #0x40]
	b _080039C4
	.align 2, 0
_08003908: .4byte m4a_sound
_0800390C: .4byte midi_ma
_08003910:
	mov r0, sp
	mov r2, r8
	strb r2, [r0]
	ldr r0, _08003920
	ldr r1, [r0, #0x34]
	ldr r0, _08003924
	ldr r2, [r1, #0x44]
	b _080039C4
	.align 2, 0
_08003920: .4byte m4a_sound
_08003924: .4byte midi_ma
_08003928:
	mov r0, sp
	mov r3, r8
	strb r3, [r0]
	ldr r0, _08003938
	ldr r1, [r0, #0x34]
	ldr r0, _0800393C
	ldr r2, [r1, #0x50]
	b _080039C4
	.align 2, 0
_08003938: .4byte m4a_sound
_0800393C: .4byte midi_ma
_08003940:
	mov r0, sp
	mov r4, r8
	strb r4, [r0]
	ldr r0, _08003950
	ldr r1, [r0, #0x34]
	ldr r0, _08003954
	ldr r2, [r1, #0x5c]
	b _080039C4
	.align 2, 0
_08003950: .4byte m4a_sound
_08003954: .4byte midi_ma
_08003958:
	mov r0, sp
	mov r7, r8
	strb r7, [r0]
	ldr r0, _08003968
	ldr r1, [r0, #0x34]
	ldr r0, _0800396C
	ldr r2, [r1, #0x48]
	b _080039C4
	.align 2, 0
_08003968: .4byte m4a_sound
_0800396C: .4byte midi_ma
_08003970:
	mov r0, sp
	mov r1, r8
	strb r1, [r0]
	ldr r0, _08003980
	ldr r1, [r0, #0x34]
	ldr r0, _08003984
	ldr r2, [r1, #0x24]
	b _080039C4
	.align 2, 0
_08003980: .4byte m4a_sound
_08003984: .4byte midi_ma
_08003988:
	ldr r0, _08003990
	mov r2, r8
	str r2, [r0]
	b _080039E8
	.align 2, 0
_08003990: .4byte xcmdn
_08003994:
	mov r1, sp
	ldr r0, _080039AC
	ldr r0, [r0]
	strb r0, [r1]
	mov r0, sp
	mov r3, r8
	strb r3, [r0, #1]
	ldr r0, _080039B0
	ldr r1, [r0, #0x34]
	ldr r0, _080039B4
	ldr r2, [r1, #0x70]
	b _080039C4
	.align 2, 0
_080039AC: .4byte xcmdn
_080039B0: .4byte m4a_sound
_080039B4: .4byte midi_ma
_080039B8:
	mov r0, sp
	strb r4, [r0]
	ldr r0, _080039CC
	ldr r1, [r0, #0x34]
	ldr r0, _080039D0
	ldr r2, [r1, #0x30]
_080039C4:
	adds r1, r6, #0
	bl _call_via_r2
	b _080039E8
	.align 2, 0
_080039CC: .4byte m4a_sound
_080039D0: .4byte midi_ma
_080039D4:
	mov r0, sp
	mov r4, r8
	strb r4, [r0]
	ldr r0, _08003A2C
	ldr r1, [r0, #0x34]
	ldr r0, _08003A30
	ldr r2, [r1, #0x3c]
	adds r1, r6, #0
	bl _call_via_r2
_080039E8:
	bl ReadMidi
	adds r5, r0, #0
	cmp r5, #0
	blt _080039F4
	b _080035A0
_080039F4:
	ldr r1, _08003A30
	ldrh r7, [r1, #0x22]
	ldrh r2, [r1, #0x20]
	adds r0, r7, r2
	strh r0, [r1, #0x22]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0x95
	bls _08003A90
	adds r2, r3, #0
_08003A0A:
	ldrb r5, [r2, #8]
	ldr r6, [r2, #0x2c]
	cmp r5, #0
	ble _08003A82
_08003A12:
	ldrb r1, [r6, #0x19]
	cmp r1, #0
	beq _08003A7A
	ldrb r0, [r6, #0x17]
	cmp r0, #0
	beq _08003A7A
	ldrb r0, [r6, #0x1c]
	cmp r0, #0
	beq _08003A34
	subs r0, #1
	strb r0, [r6, #0x1c]
	b _08003A7A
	.align 2, 0
_08003A2C: .4byte m4a_sound
_08003A30: .4byte midi_ma
_08003A34:
	ldrb r4, [r6, #0x1a]
	adds r0, r1, r4
	strb r0, [r6, #0x1a]
	subs r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08003A48
	movs r4, #0x1a
	ldrsb r4, [r6, r4]
	b _08003A4E
_08003A48:
	movs r0, #0x80
	ldrb r7, [r6, #0x1a]
	subs r4, r0, r7
_08003A4E:
	ldrb r1, [r6, #0x17]
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r4, r0, #6
	lsls r1, r4, #0x18
	ldrb r7, [r6, #0x16]
	lsls r0, r7, #0x18
	cmp r0, r1
	beq _08003A7A
	movs r1, #0
	strb r4, [r6, #0x16]
	ldrb r0, [r6, #0x18]
	cmp r0, #0
	bne _08003A72
	movs r0, #0xc
	ldrb r1, [r6]
	orrs r0, r1
	b _08003A78
_08003A72:
	movs r0, #3
	ldrb r4, [r6]
	orrs r0, r4
_08003A78:
	strb r0, [r6]
_08003A7A:
	subs r5, #1
	adds r6, #0x50
	cmp r5, #0
	bgt _08003A12
_08003A82:
	ldrh r0, [r2, #0x22]
	subs r0, #0x96
	strh r0, [r2, #0x22]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x95
	bhi _08003A0A
_08003A90:
	ldrb r5, [r3, #8]
	ldr r6, [r3, #0x2c]
	cmp r5, #0
	ble _08003B78
_08003A98:
	movs r0, #0xf
	ldrb r7, [r6]
	ands r0, r7
	subs r5, #1
	mov sl, r5
	movs r1, #0x50
	adds r1, r1, r6
	mov sb, r1
	cmp r0, #0
	beq _08003B70
	ldr r4, _08003AE0
	ldr r0, [r4, #0x34]
	adds r0, #0x84
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r6, #0
	bl _call_via_r2
	ldr r5, [r6, #0x20]
	cmp r5, #0
	beq _08003B66
	mov r8, r4
_08003AC4:
	movs r0, #0xc7
	ldrb r2, [r5]
	ands r0, r2
	cmp r0, #0
	bne _08003AE4
	mov r3, r8
	ldr r0, [r3, #0x34]
	adds r0, #0x88
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _08003B60
	.align 2, 0
_08003AE0: .4byte m4a_sound
_08003AE4:
	movs r7, #7
	ldrb r4, [r5, #1]
	ands r7, r4
	movs r0, #3
	ldrb r1, [r6]
	ands r0, r1
	cmp r0, #0
	beq _08003B1A
	ldrb r2, [r6, #0x10]
	ldrb r3, [r5, #0x12]
	adds r0, r2, #0
	muls r0, r3, r0
	asrs r0, r0, #7
	movs r1, #0
	strb r0, [r5, #2]
	ldrb r4, [r6, #0x11]
	adds r2, r3, #0
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #7
	strb r0, [r5, #3]
	cmp r7, #0
	beq _08003B1A
	movs r0, #1
	ldrb r3, [r5, #0x1d]
	orrs r0, r3
	strb r0, [r5, #0x1d]
_08003B1A:
	movs r0, #0xc
	ldrb r4, [r6]
	ands r0, r4
	cmp r0, #0
	beq _08003B60
	movs r0, #8
	ldrsb r0, [r6, r0]
	ldrb r1, [r5, #8]
	adds r4, r1, r0
	cmp r4, #0
	bge _08003B32
	movs r4, #0
_08003B32:
	cmp r7, #0
	beq _08003B52
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r6, #9]
	mov r4, r8
	ldr r3, [r4, #0x30]
	adds r0, r7, #0
	bl _call_via_r3
	str r0, [r5, #0x20]
	movs r0, #2
	ldrb r7, [r5, #0x1d]
	orrs r0, r7
	strb r0, [r5, #0x1d]
	b _08003B60
_08003B52:
	ldr r0, [r5, #0x24]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r6, #9]
	bl MidiKey2Freq
	str r0, [r5, #0x20]
_08003B60:
	ldr r5, [r5, #0x34]
	cmp r5, #0
	bne _08003AC4
_08003B66:
	movs r0, #0xf0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	ldr r3, _08003B8C
_08003B70:
	mov r5, sl
	mov r6, sb
	cmp r5, #0
	bgt _08003A98
_08003B78:
	ldr r0, _08003B90
	str r0, [r3, #0x34]
_08003B7C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B8C: .4byte midi_ma
_08003B90: .4byte 0x68736D53

	THUMB_FUNC_START MidiAllStop
MidiAllStop: @ 0x08003B94
	push {r4, r5, r6, lr}
	ldr r0, _08003BC4
	cmp r0, #0
	beq _08003BBC
	ldr r0, _08003BC8
	ldrb r4, [r0, #8]
	ldr r5, [r0, #0x2c]
	cmp r4, #0
	ble _08003BBC
	ldr r6, _08003BCC
_08003BA8:
	ldr r0, [r6, #0x34]
	ldr r2, [r0, #0x7c]
	ldr r0, _08003BC8
	adds r1, r5, #0
	bl _call_via_r2
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _08003BA8
_08003BBC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003BC4: .4byte pbymidi_swi
_08003BC8: .4byte midi_ma
_08003BCC: .4byte m4a_sound
