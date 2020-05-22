	.equ	BGM_TRACK_CHANNELS, 10
	.equ	SE1_TRACK_CHANNELS, 3
	.equ	SE2_TRACK_CHANNELS, 9
	.equ	SE3_TRACK_CHANNELS, 1

	.comm	gMPlayTrack_BGM, 80*BGM_TRACK_CHANNELS
	.comm	gMPlayTrack_SE1, 80*SE1_TRACK_CHANNELS
	.comm	gMPlayTrack_SE2, 80*SE2_TRACK_CHANNELS
	.comm	gMPlayTrack_SE3, 80*SE3_TRACK_CHANNELS

	.global	__total_mplay_n
	.equ	__total_mplay_n, 4

	.align 2
	.global	gMPlayTable
gMPlayTable:
	music_player gMPlayInfo_BGM, gMPlayTrack_BGM, 10, 0
	music_player gMPlayInfo_SE1, gMPlayTrack_SE1,  3, 1
	music_player gMPlayInfo_SE2, gMPlayTrack_SE2,  9, 1
	music_player gMPlayInfo_SE3, gMPlayTrack_SE3,  1, 0
