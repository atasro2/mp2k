	.include "asm/macros.inc"
	.section .rodata

	.include "sound/voice_groups.inc"
	.include "sound/keysplit_tables.inc"
	.include "sound/programmable_wave_data.inc"
	.include "sound/music_player_table.inc"
	.include "sound/song_table.inc"
	.include "sound/direct_sound_data.inc"
	.align 2
	
	.global	__total_song_n
	.equ	__total_song_n, (dummy_song_header - song_table) / 8
	
	.comm	m4a_memacc_area, 16

	.end
