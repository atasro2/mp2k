	.comm	m4a_mplay000, 64
	.lcomm	m4a_track000, 80*10
	.comm	m4a_mplay001, 64
	.lcomm	m4a_track001, 80*3
	.comm	m4a_mplay002, 64
	.lcomm	m4a_track002, 80*9
	.comm	m4a_mplay003, 64
	.lcomm	m4a_track003, 80*1

	.global	__total_mplay_n
	.equ	__total_mplay_n, 4

	.align 2
	.global	mplay_table
mplay_table:
	music_player m4a_mplay000, m4a_track000, 10, 0
	music_player m4a_mplay001, m4a_track001,  3, 1
	music_player m4a_mplay002, m4a_track002,  9, 1
	music_player m4a_mplay003, m4a_track003,  1, 0
