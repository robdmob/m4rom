			; M4 Board cpc z80 rom
			; Written by Duke, 2016/2017/2018
			; www.spinpoint.org
			
cas_catalog					.equ 0xbc9b
cas_in_close					.equ 0xbc7a
cas_in_open					.equ 0xbc77
cas_out_close					.equ 0xbc8f
cas_out_open					.equ 0xbc8c
cas_in_char					.equ 0xbc80
cas_test_eof					.equ 0xbc89
cas_out_open					.equ 0xbc8c
cas_out_close					.equ 0xbc8f
cas_out_char					.equ 0xbc95
cas_out_direct					.equ 0xbc98
cas_in_abandon					.equ 0xbc7d
cas_out_abandon				.equ 0xbc92

txt_output					.equ	0xbb5a
txt_wr_char					.equ 0xbb5d
txt_rd_char					.equ 0xbb60
txt_get_window					.equ 0xbb69
txt_set_column					.equ 0xbb6f
txt_set_cursor					.equ	0xbb75
txt_get_cursor					.equ	0xbb78
txt_place_cursor				.equ	0xbb8a
txt_remove_cursor				.equ	0xbb8d

km_read_char					.equ 0xbb09

scr_get_mode					.equ	0xbc11
mc_boot_program				.equ 0xbd13
mc_start_program		   		.equ 0xbd16
mc_wait_flyback				.equ 0xbd19
kl_l_rom_enable				.equ	0xb906
kl_rom_restore 				.equ 0xb90c
kl_rom_select					.equ 0xb90f
kl_curr_selection 				.equ 0xb912
kl_ldir						.equ 0xb91b

mc_reset_printer			.equ 0xbd28
mc_print_char				.equ 0xbd2b
ind_mc_wait_printer			.equ 0xbdf1

