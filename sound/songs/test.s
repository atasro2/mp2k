	.include "MPlayDef.s"

	.equ	test_grp, voicegroup041
	.equ	test_pri, 0
	.equ	test_rev, 0
	.equ	test_mvl, 127
	.equ	test_key, 0
	.equ	test_tbs, 1
	.equ	test_exg, 0
	.equ	test_cmp, 1

	.section .rodata
	.global	test
	.align	2

@**************** Track 1 (Midi-Chn.4) ****************@

test_1:
	.byte	KEYSH , test_key+0
@ 000   ----------------------------------------
	.byte		TEMPO , 140*test_tbs/2
	.byte		VOICE , 24
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		        127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte	W24
	.byte		N05   , Ds5 , v112
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		N11   , Fs5 
	.byte	W12
	.byte		        Bn5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Bn5 
	.byte	W06
	.byte		        Cs6 
	.byte	W06
	.byte		        Ds6 
	.byte	W06
@ 001   ----------------------------------------
	.byte		        Cs6 
	.byte	W06
	.byte		        As5 
	.byte	W06
	.byte		N11   , Bn5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		N11   , Fs5 
	.byte	W12
	.byte		        Bn5 
	.byte	W12
	.byte		N05   , Cs6 
	.byte	W06
	.byte		        As5 
	.byte	W06
	.byte		        Bn5 
	.byte	W06
	.byte		        Cs6 
	.byte	W06
@ 002   ----------------------------------------
	.byte		        En6 
	.byte	W06
	.byte		        Ds6 
	.byte	W06
	.byte		        En6 
	.byte	W06
	.byte		        Cs6 
	.byte	W06
loop_1:
	.byte		N11   , Fs5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		        Bn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W12
@ 003   ----------------------------------------
test_1_003:
	.byte		N11   , Bn4 , v112
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte	PEND
@ 004   ----------------------------------------
test_1_004:
	.byte		N05   , Ds5 , v112
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		N11   , Ds5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		N05   , Gs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
test_1_005:
	.byte		N05   , Dn5 , v112
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		N11   , Dn5 
	.byte	W12
	.byte		N05   , Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		N11   , Cs5 
	.byte	W12
	.byte	PEND
@ 006   ----------------------------------------
	.byte		        Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		        Bn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W12
@ 007   ----------------------------------------
	.byte	PATT
	 .word	test_1_003
@ 008   ----------------------------------------
	.byte	PATT
	 .word	test_1_004
@ 009   ----------------------------------------
	.byte	PATT
	 .word	test_1_005
@ 010   ----------------------------------------
	.byte		N11   , Bn4 , v112
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
@ 011   ----------------------------------------
test_1_011:
	.byte		N05   , En5 , v112
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte	PEND
@ 012   ----------------------------------------
test_1_012:
	.byte		N05   , Fs4 , v112
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte	PEND
@ 013   ----------------------------------------
test_1_013:
	.byte		N05   , Bn4 , v112
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte	PEND
@ 014   ----------------------------------------
	.byte		N11   , Bn4 
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
@ 015   ----------------------------------------
	.byte	PATT
	 .word	test_1_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	test_1_012
@ 017   ----------------------------------------
	.byte	PATT
	 .word	test_1_013
@ 018   ----------------------------------------
	.byte		N11   , Bn4 , v112
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte	GOTO
	 .word loop_1
@ 019   ----------------------------------------
	.byte		VOICE , 24
	.byte		        24
	.byte		        24
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte		        c_v+0
	.byte	FINE

@**************** Track 2 (Midi-Chn.5) ****************@

test_2:
	.byte	KEYSH , test_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 24
	.byte		PAN   , c_v+0
	.byte		VOL   , 57*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 57*test_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte	W40
	.byte	W01
	.byte		N05   , Ds5 , v112
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		N11   , Fs5 
	.byte	W12
	.byte		        Bn5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Bn5 
	.byte	W01
@ 001   ----------------------------------------
	.byte	W05
	.byte		        Cs6 
	.byte	W06
	.byte		        Ds6 
	.byte	W06
	.byte		        Cs6 
	.byte	W06
	.byte		        As5 
	.byte	W06
	.byte		N11   , Bn5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		N11   , Fs5 
	.byte	W12
	.byte		        Bn5 
	.byte	W12
	.byte		N05   , Cs6 
	.byte	W06
	.byte		        As5 
	.byte	W01
@ 002   ----------------------------------------
	.byte	W05
	.byte		        Bn5 
	.byte	W06
	.byte		        Cs6 
	.byte	W06
	.byte		        En6 
	.byte	W06
	.byte		        Ds6 
	.byte	W06
	.byte		        En6 
	.byte	W06
	.byte		        Cs6 
	.byte	W06
loop_2:
	.byte		N11   , Fs5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		        Bn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W01
@ 003   ----------------------------------------
test_2_003:
	.byte	W05
	.byte		N05   , Bn4 , v112
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W01
	.byte	PEND
@ 004   ----------------------------------------
test_2_004:
	.byte	W05
	.byte		N05   , Fs5 , v112
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		N11   , Ds5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		N05   , Gs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Bn4 
	.byte	W01
	.byte	PEND
@ 005   ----------------------------------------
test_2_005:
	.byte	W05
	.byte		N05   , Dn5 , v112
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		N11   , Dn5 
	.byte	W12
	.byte		N05   , Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W01
	.byte	PEND
@ 006   ----------------------------------------
	.byte	W05
	.byte		N11   , Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Fs5 
	.byte	W12
	.byte		        Gs5 
	.byte	W12
	.byte		N05   , Ds5 
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		        Bn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W01
@ 007   ----------------------------------------
	.byte	PATT
	 .word	test_2_003
@ 008   ----------------------------------------
	.byte	PATT
	 .word	test_2_004
@ 009   ----------------------------------------
	.byte	PATT
	 .word	test_2_005
@ 010   ----------------------------------------
	.byte	W05
	.byte		N11   , Cs5 , v112
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W01
@ 011   ----------------------------------------
test_2_011:
	.byte	W05
	.byte		N05   , Ds5 , v112
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Ds5 
	.byte	W01
	.byte	PEND
@ 012   ----------------------------------------
test_2_012:
	.byte	W05
	.byte		N05   , Cs5 , v112
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		N05   
	.byte	W01
	.byte	PEND
@ 013   ----------------------------------------
test_2_013:
	.byte	W05
	.byte		N05   , Cs5 , v112
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Ds5 
	.byte	W01
	.byte	PEND
@ 014   ----------------------------------------
	.byte	W05
	.byte		        En5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W01
@ 015   ----------------------------------------
	.byte	PATT
	 .word	test_2_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	test_2_012
@ 017   ----------------------------------------
	.byte	PATT
	 .word	test_2_013
@ 018   ----------------------------------------
	.byte	W05
	.byte		N05   , En5 , v112
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		N11   , Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte	GOTO
	 .word loop_2
@ 019   ----------------------------------------
	.byte		VOICE , 24
	.byte		        24
	.byte		        24
	.byte		PAN   , c_v+0
	.byte		VOL   , 57*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 57*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 57*test_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte		        c_v+0
	.byte	FINE

@**************** Track 3 (Midi-Chn.1) ****************@

test_3:
	.byte	KEYSH , test_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 36
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		        127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W24
loop_3:
	.byte		N11   , En1 , v112
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
@ 003   ----------------------------------------
test_3_003:
	.byte		N11   , Gs1 , v112
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Cs1 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte	PEND
@ 004   ----------------------------------------
test_3_004:
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	test_3_003
@ 006   ----------------------------------------
	.byte	PATT
	 .word	test_3_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	test_3_003
@ 008   ----------------------------------------
	.byte	PATT
	 .word	test_3_004
@ 009   ----------------------------------------
	.byte	PATT
	 .word	test_3_003
@ 010   ----------------------------------------
	.byte		N11   , Bn0 , v112
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
@ 011   ----------------------------------------
test_3_011:
	.byte		N11   , Bn2 , v112
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte	PEND
@ 012   ----------------------------------------
test_3_012:
	.byte		N11   , Fs2 , v112
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte	PEND
@ 013   ----------------------------------------
	.byte	PATT
	 .word	test_3_011
@ 014   ----------------------------------------
	.byte	PATT
	 .word	test_3_012
@ 015   ----------------------------------------
	.byte	PATT
	 .word	test_3_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	test_3_012
@ 017   ----------------------------------------
	.byte	PATT
	 .word	test_3_011
@ 018   ----------------------------------------
	.byte		N11   , Fs2 , v112
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte	GOTO
	 .word loop_3
@ 019   ----------------------------------------
	.byte		VOICE , 35
	.byte		        35
	.byte		        35
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*test_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte		        c_v+0
	.byte	FINE

@**************** Track 4 (Midi-Chn.2) ****************@

test_4:
	.byte	KEYSH , test_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 25
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*test_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte		N12   , Cn3 , v100
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte		VOICE , 25
	.byte		        25
	.byte		        25
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*test_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*test_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		        c_v+0
	.byte		        c_v+0
	.byte	FINE

@******************************************************@
	.align	2

test:
	.byte	4	@ NumTrks
	.byte	0	@ NumBlks
	.byte	test_pri	@ Priority
	.byte	test_rev	@ Reverb.

	.word	test_grp

	.word	test_1
	.word	test_2
	.word	test_3
	.word	test_4

	.end
