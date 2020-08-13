.include "asm/macros.inc"
.include "constants/m4a_constants.inc"

.syntax unified

.text

	thumb_func_start umul3232H32
umul3232H32:
	adr r2, __umul3232H32
	bx r2
	.arm
__umul3232H32:
	umull r2, r3, r0, r1
	add r0, r3, 0
	bx lr
	thumb_func_end umul3232H32

	THUMB_FUNC_START SoundMain
SoundMain: @ 0x080001E0
	ldr r0, _0800024C
	ldr r0, [r0]
	ldr r2, _08000250
	ldr r3, [r0]
	cmp r2, r3
	beq _080001EE
	bx lr
_080001EE:
	adds r3, #1
	str r3, [r0]
	push {r4, r5, r6, r7, lr}
	mov r1, r8
	mov r2, sb
	mov r3, sl
	mov r4, fp
	push {r0, r1, r2, r3, r4}
	sub sp, #0x18
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	beq _08000212
	ldr r2, _08000258
	ldrb r2, [r2]
	cmp r2, #0xa0
	bhs _08000210
	adds r2, #0xe4
_08000210:
	adds r1, r1, r2
_08000212:
	str r1, [sp, #0x14]
	ldr r3, [r0, #0x20]
	cmp r3, #0
	beq _08000222
	ldr r0, [r0, #0x24]
	bl .call_r3
	ldr r0, [sp, #0x18]
_08000222:
	ldr r3, [r0, #0x28]
	bl .call_r3
	ldr r0, [sp, #0x18]
	ldr r3, [r0, #0x10]
	mov r8, r3
	ldr r5, _0800025C
	adds r5, r5, r0
	ldrb r4, [r0, #4]
	subs r7, r4, #1
	bls _08000242
	ldrb r1, [r0, #0xb]
	subs r1, r1, r7
	mov r2, r8
	muls r2, r1, r2
	adds r5, r5, r2
_08000242:
	str r5, [sp, #8]
	ldr r6, _08000260
	ldr r3, _08000254
	bx r3
	.align 2, 0
_0800024C: .4byte 0x03007FF0
_08000250: .4byte 0x68736D53
_08000254: .4byte SoundMainRAM_Buffer+1
_08000258: .4byte 0x04000006
_0800025C: .4byte 0x00000350
_08000260: .4byte PCM_DMA_BUF_SIZE

	non_word_aligned_thumb_func_start .call_r3
.call_r3: @ 0x08000602
	bx r3
_08000604: .4byte 0x68736D53 

	THUMB_FUNC_START SoundMainBTM
SoundMainBTM: @ 0x08000608
	mov ip, r4
	movs r1, #0
	movs r2, #0
	movs r3, #0
	movs r4, #0
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	mov r4, ip
	bx lr
	.align 2, 0

	THUMB_FUNC_START RealClearChain
RealClearChain: @ 0x08000620
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0800063E
	ldr r1, [r0, #0x34]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _08000632
	str r1, [r2, #0x34]
	b _08000634
_08000632:
	str r1, [r3, #0x20]
_08000634:
	cmp r1, #0
	beq _0800063A
	str r2, [r1, #0x30]
_0800063A:
	movs r1, #0
	str r1, [r0, #0x2c]
_0800063E:
	bx lr

	THUMB_FUNC_START ply_fine
ply_fine:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08000664
_0800064A:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _08000658
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
_08000658:
	adds r0, r4, #0
	bl RealClearChain
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0800064A
_08000664:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	THUMB_FUNC_START MPlayJumpTableCopy
MPlayJumpTableCopy: @ 0x08000670
	mov ip, lr
	movs r1, #0x24
	ldr r2, _080006A0
_08000676:
	ldr r3, [r2]
	bl chk_adr_r2
	stm r0!, {r3}
	adds r2, #4
	subs r1, #1
	bgt _08000676
	bx ip
	.align 2, 0

	THUMB_FUNC_START ldrb_r3_r2
ldrb_r3_r2: @ 0x08000688
	ldrb r3, [r2]

	non_word_aligned_thumb_func_start chk_adr_r2
chk_adr_r2:
	push {r0}
	lsrs r0, r2, #0x19
	bne _0800069C
	ldr r0, _080006A0
	cmp r2, r0
	blo _0800069A
	lsrs r0, r2, #0xe
	beq _0800069C
_0800069A:
	movs r3, #0
_0800069C:
	pop {r0}
	bx lr
	.align 2, 0
_080006A0: .4byte gMPlayJumpTableTemplate

	THUMB_FUNC_START ld_r3_tp_adr_i
ld_r3_tp_adr_i: @ 0x080006A4
	ldr r2, [r1, #0x40]

	non_word_aligned_thumb_func_start ld_r3_r2_i_sub
ld_r3_r2_i_sub: @ 0x080006A6
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	b chk_adr_r2
	.align 2, 0

	THUMB_FUNC_START ply_goto
ply_goto:
	push {lr}
_080006B2:
	ldr r2, [r1, #0x40]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	ldrb r3, [r2, #2]
	orrs r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #1]
	orrs r0, r3
	lsls r0, r0, #8
	bl ldrb_r3_r2
	orrs r0, r3
	str r0, [r1, #0x40]
	pop {r0}
	bx r0

	THUMB_FUNC_START ply_patt
ply_patt: @ 0x080006D0
	ldrb r2, [r1, #2]
	cmp r2, #3
	bhs _080006E8
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r1, #0x40]
	adds r2, #4
	str r2, [r3, #0x44]
	ldrb r2, [r1, #2]
	adds r2, #1
	strb r2, [r1, #2]
	b ply_goto
_080006E8:
	b ply_fine
	.align 2, 0

	THUMB_FUNC_START ply_pend
ply_pend: @ 0x080006EC
	ldrb r2, [r1, #2]
	cmp r2, #0
	beq _080006FE
	subs r2, #1
	strb r2, [r1, #2]
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r3, #0x44]
	str r2, [r1, #0x40]
_080006FE:
	bx lr

	THUMB_FUNC_START ply_rept
ply_rept: @ 0x08000700
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0
	bne _08000710
	adds r2, #1
	str r2, [r1, #0x40]
	b _080006B2
_08000710:
	ldrb r3, [r1, #3]
	adds r3, #1
	strb r3, [r1, #3]
	mov ip, r3
	bl ld_r3_tp_adr_i
	cmp ip, r3
	bhs _08000722
	b _080006B2
_08000722:
	movs r3, #0
	strb r3, [r1, #3]
	adds r2, #5
	str r2, [r1, #0x40]
	pop {r0}
	bx r0
	.align 2, 0

	THUMB_FUNC_START ply_prio
ply_prio: @ 0x08000730
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x1d]
	bx ip
	.align 2, 0

	THUMB_FUNC_START ply_tempo
ply_tempo: @ 0x0800073C
	mov ip, lr
	bl ld_r3_tp_adr_i
	lsls r3, r3, #1
	strh r3, [r0, #0x1c]
	ldrh r2, [r0, #0x1e]
	muls r3, r2, r3
	lsrs r3, r3, #8
	strh r3, [r0, #0x20]
	bx ip

	THUMB_FUNC_START ply_keysh
ply_keysh: @ 0x08000750
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0xa]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	THUMB_FUNC_START ply_voice
ply_voice: @ 0x08000764
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, [r0, #0x30]
	adds r2, r2, r3
	ldr r3, [r2]
	bl chk_adr_r2
	str r3, [r1, #0x24]
	ldr r3, [r2, #4]
	bl chk_adr_r2
	str r3, [r1, #0x28]
	ldr r3, [r2, #8]
	bl chk_adr_r2
	str r3, [r1, #0x2c]
	bx ip
	.align 2, 0

	THUMB_FUNC_START ply_vol
ply_vol: @ 0x08000794
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x12]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	THUMB_FUNC_START ply_pan
ply_pan: @ 0x080007A8
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0x14]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip

	THUMB_FUNC_START ply_bend
ply_bend: @ 0x080007BC
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0xe]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	THUMB_FUNC_START ply_bendr
ply_bendr: @ 0x080007D0
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0xf]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	THUMB_FUNC_START ply_lfodl
ply_lfodl: @ 0x080007E4
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x1b]
	bx ip
	.align 2, 0

	THUMB_FUNC_START ply_modt
ply_modt: @ 0x080007F0
	mov ip, lr
	bl ld_r3_tp_adr_i
	ldrb r0, [r1, #0x18]
	cmp r0, r3
	beq _08000806
	strb r3, [r1, #0x18]
	ldrb r3, [r1]
	movs r2, #0xf
	orrs r3, r2
	strb r3, [r1]
_08000806:
	bx ip

	THUMB_FUNC_START ply_tune
ply_tune: @ 0x08000808
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0xc]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	THUMB_FUNC_START ply_port
ply_port: @ 0x0800081C
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	ldr r0, _08000830
	adds r0, r0, r3
	bl ld_r3_r2_i_sub
	strb r3, [r0]
	bx ip
	.align 2, 0
_08000830: .4byte 0x04000060

	THUMB_FUNC_START SoundVSync
SoundVSync: @ 0x08000834
	ldr r0, _08000AE0
	ldr r0, [r0]
	ldr r2, _08000AE4
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _08000874
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _08000874
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _08000878
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _0800085A
	ldr r1, _0800087C
	str r1, [r2, #8]
_0800085A:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _08000864
	ldr r1, _0800087C
	str r1, [r2, #0x14]
_08000864:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_08000874:
	bx lr
	.align 2, 0
_08000878: .4byte 0x040000BC
_0800087C: .4byte 0x84400004

	THUMB_FUNC_START MPlayMain
MPlayMain: @ 0x08000880
	ldr r2, _08000AE4
	ldr r3, [r0, #0x34]
	cmp r2, r3
	beq _0800088A
	bx lr
_0800088A:
	adds r3, #1
	str r3, [r0, #0x34]
	push {r0, lr}
	ldr r3, [r0, #0x38]
	cmp r3, #0
	beq _0800089C
	ldr r0, [r0, #0x3c]
	bl .call_r3_rev
_0800089C:
	pop {r0}
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080008B4
	b _08000AC8
_080008B4:
	ldr r0, _08000AE0
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	bl FadeOutBody
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080008C8
	b _08000AC8
_080008C8:
	ldrh r0, [r7, #0x22]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	b _08000A18
_080008D0:
	ldrb r6, [r7, #8]
	ldr r5, [r7, #0x2c]
	movs r3, #1
	movs r4, #0
_080008D8:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	bne _080008E2
	b _080009F4
_080008E2:
	mov sl, r3
	orrs r4, r3
	mov fp, r4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08000916
_080008EE:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0800090A
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _08000910
	subs r0, #1
	strb r0, [r4, #0x10]
	bne _08000910
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
	b _08000910
_0800090A:
	adds r0, r4, #0
	bl ClearChain
_08000910:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _080008EE
_08000916:
	ldrb r3, [r5]
	movs r0, #0x40
	tst r0, r3
	beq _08000994
	adds r0, r5, #0
	bl Clear64byte
	movs r0, #0x80
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #0xf]
	movs r0, #0x40
	strb r0, [r5, #0x13]
	movs r0, #0x16
	strb r0, [r5, #0x19]
	movs r0, #1
	adds r1, r5, #6
	strb r0, [r1, #0x1e]
	b _08000994
_0800093C:
	ldr r2, [r5, #0x40]
	ldrb r1, [r2]
	cmp r1, #0x80
	bhs _08000948
	ldrb r1, [r5, #7]
	b _08000952
_08000948:
	adds r2, #1
	str r2, [r5, #0x40]
	cmp r1, #0xbd
	blo _08000952
	strb r1, [r5, #7]
_08000952:
	cmp r1, #0xcf
	blo _08000968
	mov r0, r8
	ldr r3, [r0, #0x38]
	adds r0, r1, #0
	subs r0, #0xcf
	adds r1, r7, #0
	adds r2, r5, #0
	bl .call_r3_rev
	b _08000994
_08000968:
	cmp r1, #0xb0
	bls _0800098A
	adds r0, r1, #0
	subs r0, #0xb1
	strb r0, [r7, #0xa]
	mov r3, r8
	ldr r3, [r3, #0x34]
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl .call_r3_rev
	ldrb r0, [r5]
	cmp r0, #0
	beq _080009F0
	b _08000994
_0800098A:
	ldr r0, _08000ADC
	subs r1, #0x80
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5, #1]
_08000994:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0800093C
	subs r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	beq _080009F0
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _080009F0
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _080009B6
	subs r0, #1
	strb r0, [r5, #0x1c]
	b _080009F0
_080009B6:
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	adds r1, r0, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	bpl _080009CA
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	b _080009CE
_080009CA:
	movs r0, #0x80
	subs r2, r0, r1
_080009CE:
	ldrb r0, [r5, #0x17]
	muls r0, r2, r0
	asrs r2, r0, #6
	ldrb r0, [r5, #0x16]
	eors r0, r2
	lsls r0, r0, #0x18
	beq _080009F0
	strb r2, [r5, #0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, #0x18]
	cmp r1, #0
	bne _080009EA
	movs r1, #0xc
	b _080009EC
_080009EA:
	movs r1, #3
_080009EC:
	orrs r0, r1
	strb r0, [r5]
_080009F0:
	mov r3, sl
	mov r4, fp
_080009F4:
	subs r6, #1
	ble _08000A00
	movs r0, #0x50
	adds r5, r5, r0
	lsls r3, r3, #1
	b _080008D8
_08000A00:
	ldr r0, [r7, #0xc]
	adds r0, #1
	str r0, [r7, #0xc]
	cmp r4, #0
	bne _08000A12
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	b _08000AC8
_08000A12:
	str r4, [r7, #4]
	ldrh r0, [r7, #0x22]
	subs r0, #0x96
_08000A18:
	strh r0, [r7, #0x22]
	cmp r0, #0x96
	blo _08000A20
	b _080008D0
_08000A20:
	ldrb r2, [r7, #8]
	ldr r5, [r7, #0x2c]
_08000A24:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	beq _08000ABE
	movs r1, #0xf
	tst r1, r0
	beq _08000ABE
	mov sb, r2
	adds r0, r7, #0
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08000AB4
_08000A42:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	bne _08000A52
	adds r0, r4, #0
	bl ClearChain
	b _08000AAE
_08000A52:
	ldrb r0, [r4, #1]
	movs r6, #7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, #3
	tst r0, r3
	beq _08000A70
	bl ChnVolSetAsm
	cmp r6, #0
	beq _08000A70
	ldrb r0, [r4, #0x1d]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x1d]
_08000A70:
	ldrb r3, [r5]
	movs r0, #0xc
	tst r0, r3
	beq _08000AAE
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _08000A84
	movs r2, #0
_08000A84:
	cmp r6, #0
	beq _08000AA2
	mov r0, r8
	ldr r3, [r0, #0x30]
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	adds r0, r6, #0
	bl .call_r3_rev
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x1d]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	b _08000AAE
_08000AA2:
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	ldr r0, [r4, #0x24]
	bl MidiKeyToFreq
	str r0, [r4, #0x20]
_08000AAE:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _08000A42
_08000AB4:
	ldrb r0, [r5]
	movs r1, #0xf0
	ands r0, r1
	strb r0, [r5]
	mov r2, sb
_08000ABE:
	subs r2, #1
	ble _08000AC8
	movs r0, #0x50
	adds r5, r5, r0
	bgt _08000A24
_08000AC8:
	ldr r0, _08000AE4
	str r0, [r7, #0x34]
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	non_word_aligned_thumb_func_start .call_r3_rev
.call_r3_rev: @ 0x08000AD8
	bx r3
	.align 2, 0
_08000ADC: .4byte gClockTable
_08000AE0: .4byte 0x03007FF0
_08000AE4: .4byte 0x68736D53

	THUMB_FUNC_START TrackStop
TrackStop: @ 0x08000AE8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _08000B20
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08000B1E
	movs r6, #0
_08000AFC:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08000B16
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _08000B14
	ldr r3, _08000B28
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl .call_r3_rev
_08000B14:
	strb r6, [r4]
_08000B16:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _08000AFC
_08000B1E:
	str r4, [r5, #0x20]
_08000B20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08000B28: .4byte 0x03007FF0

	THUMB_FUNC_START ChnVolSetAsm
ChnVolSetAsm: @ 0x08000B2C
	ldrb r1, [r4, #0x12]
	movs r0, #0x14
	ldrsb r2, [r4, r0]
	movs r3, #0x80
	adds r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x10]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _08000B44
	movs r0, #0xff
_08000B44:
	strb r0, [r4, #2]
	movs r3, #0x7f
	subs r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x11]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _08000B58
	movs r0, #0xff
_08000B58:
	strb r0, [r4, #3]
	bx lr

	THUMB_FUNC_START ply_note
ply_note: @ 0x08000B5C
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _08000D54
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _08000D58
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08000BA2
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08000BA0
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08000BA0
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_08000BA0:
	str r3, [r5, #0x40]
_08000BA2:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _08000BF4
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _08000BC2
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _08000BC4
_08000BC2:
	adds r0, r3, #0
_08000BC4:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x28]
	adds r1, r1, r0
	mov sb, r1
	mov r6, sb
	ldrb r1, [r6]
	movs r0, #0xc0
	tst r0, r1
	beq _08000BDC
	b _08000D42
_08000BDC:
	movs r0, #0x80
	tst r0, r2
	beq _08000BF8
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _08000BF0
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_08000BF0:
	ldrb r3, [r6, #1]
	b _08000BF8
_08000BF4:
	mov sb, r4
	ldrb r3, [r5, #5]
_08000BF8:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _08000C08
	movs r0, #0xff
_08000C08:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _08000C48
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _08000C20
	b _08000D42
_08000C20:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _08000C9C
	movs r0, #0x40
	tst r0, r1
	bne _08000C9C
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _08000C9C
	beq _08000C40
	b _08000D42
_08000C40:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _08000C9C
	b _08000D42
_08000C48:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_08000C56:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _08000C9C
	movs r0, #0x40
	tst r0, r1
	beq _08000C70
	cmp r2, #0
	bne _08000C74
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _08000C8E
_08000C70:
	cmp r2, #0
	bne _08000C90
_08000C74:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _08000C80
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _08000C8E
_08000C80:
	bhi _08000C90
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _08000C8C
	adds r7, r0, #0
	b _08000C8E
_08000C8C:
	blo _08000C90
_08000C8E:
	mov r8, r4
_08000C90:
	adds r4, #0x40
	subs r3, #1
	bgt _08000C56
	mov r4, r8
	cmp r4, #0
	beq _08000D42
_08000C9C:
	adds r0, r4, #0
	bl ClearChain
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _08000CB0
	str r4, [r3, #0x30]
_08000CB0:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _08000CC2
	adds r1, r5, #0
	bl clear_modM
_08000CC2:
	ldr r0, [sp]
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r0, [r5, #4]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x10]
	strb r0, [r4, #0x13]
	ldr r0, [sp, #8]
	strb r0, [r4, #8]
	ldr r0, [sp, #0x14]
	strb r0, [r4, #0x14]
	mov r6, sb
	ldrb r0, [r6]
	strb r0, [r4, #1]
	ldr r7, [r6, #4]
	str r7, [r4, #0x24]
	ldr r0, [r6, #8]
	str r0, [r4, #4]
	ldrh r0, [r5, #0x1e]
	strh r0, [r4, #0xc]
	bl ChnVolSetAsm
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _08000CFC
	movs r3, #0
_08000CFC:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _08000D2A
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _08000D16
	movs r0, #0x70
	tst r0, r1
	bne _08000D18
_08000D16:
	movs r1, #8
_08000D18:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl .call_r3_rev
	b _08000D34
_08000D2A:
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl MidiKeyToFreq
_08000D34:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_08000D42:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_08000D54: .4byte 0x03007FF0
_08000D58: .4byte gClockTable

	THUMB_FUNC_START ply_endtie
ply_endtie: @ 0x08000D5C
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _08000D6E
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _08000D70
_08000D6E:
	ldrb r3, [r1, #5]
_08000D70:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _08000D98
	movs r4, #0x83
	movs r5, #0x40
_08000D7A:
	ldrb r2, [r1]
	tst r2, r4
	beq _08000D92
	tst r2, r5
	bne _08000D92
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _08000D92
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _08000D98
_08000D92:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _08000D7A
_08000D98:
	pop {r4, r5}
	bx lr

	THUMB_FUNC_START clear_modM
clear_modM: @ 0x08000D9C
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _08000DAC
	movs r2, #0xc
	b _08000DAE
_08000DAC:
	movs r2, #3
_08000DAE:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.align 2, 0

	THUMB_FUNC_START ld_r3_tp_adr_i_rev
ld_r3_tp_adr_i_rev: @ 0x08000DB8
	ldr r2, [r1, #0x40]

	non_word_aligned_thumb_func_start ld_r3_r2_i_sub_rev
ld_r3_r2_i_sub_rev: @ 0x08000DBA
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.align 2, 0

	THUMB_FUNC_START ply_lfos
ply_lfos: @ 0x08000DC4
	mov ip, lr
	bl ld_r3_tp_adr_i_rev
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _08000DD4
	bl clear_modM
_08000DD4:
	bx ip
	.align 2, 0

	THUMB_FUNC_START ply_mod
ply_mod: @ 0x08000DD8
	mov ip, lr
	bl ld_r3_tp_adr_i_rev
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _08000DE8
	bl clear_modM
_08000DE8:
	bx ip
	.align 2, 0
