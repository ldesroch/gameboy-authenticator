;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module gb_dtmf
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _move_cursor
	.globl _init_cursor
	.globl _init_background
	.globl _init_key
	.globl _break_button
	.globl _press_button
	.globl _disp
	.globl _clr_disp
	.globl _disp_lcd
	.globl _dialtone
	.globl _init_dial
	.globl _strcpy
	.globl _sprintf
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _vsync
	.globl _joypad
	.globl _delay
	.globl _disp_tile
	.globl _pad
	.globl _init_disp
	.globl _dialing_press
	.globl _press_tile
	.globl _dialing_break
	.globl _break_tile
	.globl _dtmf_tile
	.globl _col
	.globl _row
	.globl _cursor_data
	.globl _key_num
	.globl _dtmf_lcd
	.globl _press_btn
	.globl _break_btn
	.globl _frame_lcd
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_disp_tile::
	.ds 60
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;gb-dtmf.c:170: void init_dial(void)
;	---------------------------------
; Function init_dial
; ---------------------------------
_init_dial::
;gb-dtmf.c:173: NR52_REG = 0x83U;
	ld	a, #0x83
	ldh	(_NR52_REG + 0), a
;gb-dtmf.c:174: NR51_REG = 0x00U;
	xor	a, a
	ldh	(_NR51_REG + 0), a
;gb-dtmf.c:175: NR50_REG = 0x77U;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;gb-dtmf.c:177: NR24_REG = 0x87U;
	ld	a, #0x87
	ldh	(_NR24_REG + 0), a
;gb-dtmf.c:178: NR22_REG = 0xffU;
	ld	a, #0xff
	ldh	(_NR22_REG + 0), a
;gb-dtmf.c:179: NR21_REG = 0xbfU;
	ld	a, #0xbf
	ldh	(_NR21_REG + 0), a
;gb-dtmf.c:181: NR14_REG = 0x87U;
	ld	a, #0x87
	ldh	(_NR14_REG + 0), a
;gb-dtmf.c:182: NR12_REG = 0xffU;
	ld	a, #0xff
	ldh	(_NR12_REG + 0), a
;gb-dtmf.c:183: NR11_REG = 0xbfU;
	ld	a, #0xbf
	ldh	(_NR11_REG + 0), a
;gb-dtmf.c:184: NR10_REG = 0x04U;
	ld	a, #0x04
	ldh	(_NR10_REG + 0), a
;gb-dtmf.c:185: }
	ret
_frame_lcd:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_break_btn:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
_press_btn:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_dtmf_lcd:
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x02	; 2
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x02	; 2
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x02	; 2
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x20	; 32
	.db #0x3e	; 62
	.db #0x20	; 32
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x20	; 32
_key_num:
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x6c	; 108	'l'
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf2	; 242
	.db #0xf2	; 242
	.db #0xf2	; 242
	.db #0xf2	; 242
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x12	; 18
	.db #0x12	; 18
_cursor_data:
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x69	; 105	'i'
	.db #0x6f	; 111	'o'
	.db #0x19	; 25
	.db #0x3f	; 63
	.db #0x59	; 89	'Y'
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x69	; 105	'i'
	.db #0x6f	; 111	'o'
	.db #0x19	; 25
	.db #0x3f	; 63
	.db #0x59	; 89	'Y'
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
_row:
	.db #0x44	; 68	'D'
	.db #0x56	; 86	'V'
	.db #0x66	; 102	'f'
	.db #0x75	; 117	'u'
_col:
	.db #0x94	; 148
	.db #0x9e	; 158
	.db #0xa7	; 167
	.db #0xb0	; 176
_dtmf_tile:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
_break_tile:
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
_dialing_break:
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x11	; 17
_press_tile:
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
_dialing_press:
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x16	; 22
	.db #0x16	; 22
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x1a	; 26
_init_disp:
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
_pad:
	.db #0x31	;  49	'1'
	.db #0x32	;  50	'2'
	.db #0x33	;  51	'3'
	.db #0x41	;  65	'A'
	.db #0x25	;  37
	.db #0x50	;  80	'P'
	.db #0x34	;  52	'4'
	.db #0x35	;  53	'5'
	.db #0x36	;  54	'6'
	.db #0x42	;  66	'B'
	.db #0x2d	;  45
	.db #0x46	;  70	'F'
	.db #0x37	;  55	'7'
	.db #0x38	;  56	'8'
	.db #0x39	;  57	'9'
	.db #0x43	;  67	'C'
	.db #0x2c	;  44
	.db #0x3f	;  63
	.db #0x2a	;  42
	.db #0x30	;  48	'0'
	.db #0x23	;  35
	.db #0x44	;  68	'D'
	.db #0x73	;  115	's'
	.db #0x73	;  115	's'
;gb-dtmf.c:188: void dialtone(uint16_t dtmf_on, uint16_t dtmf_off, char str[20])
;	---------------------------------
; Function dialtone
; ---------------------------------
_dialtone::
	add	sp, #-1
	push	de
;gb-dtmf.c:192: while(str[i]){
	ldhl	sp,	#2
	ld	(hl), #0x00
00125$:
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	or	a, a
	jp	Z, 00128$
;gb-dtmf.c:193: switch(str[i]){
	cp	a, #0x23
	jp	Z,00118$
	cp	a, #0x2a
	jp	Z,00116$
	cp	a, #0x2c
	jp	Z,00121$
	cp	a, #0x30
	jp	Z,00117$
	cp	a, #0x31
	jr	Z, 00101$
	cp	a, #0x32
	jr	Z, 00102$
	cp	a, #0x33
	jr	Z, 00103$
	cp	a, #0x34
	jr	Z, 00106$
	cp	a, #0x35
	jr	Z, 00107$
	cp	a, #0x36
	jr	Z, 00108$
	cp	a, #0x37
	jp	Z,00111$
	cp	a, #0x38
	jp	Z,00112$
	cp	a, #0x39
	jp	Z,00113$
	cp	a, #0x41
	jr	Z, 00105$
	cp	a, #0x42
	jr	Z, 00110$
	cp	a, #0x43
	jp	Z,00115$
	cp	a, #0x44
	jp	Z,00120$
	cp	a, #0x61
	jr	Z, 00105$
	cp	a, #0x62
	jr	Z, 00110$
	cp	a, #0x63
	jr	Z, 00115$
	sub	a, #0x64
	jp	Z,00120$
	jp	00122$
;gb-dtmf.c:194: case '1':
00101$:
;gb-dtmf.c:195: NR13_REG = R1;
	ld	a, #0x44
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:196: NR23_REG = C1;
	ld	a, #0x94
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:197: break;
	jp	00123$
;gb-dtmf.c:198: case '2':
00102$:
;gb-dtmf.c:199: NR13_REG = R1;
	ld	a, #0x44
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:200: NR23_REG = C2;
	ld	a, #0x9e
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:201: break;
	jp	00123$
;gb-dtmf.c:202: case '3':
00103$:
;gb-dtmf.c:203: NR13_REG = R1;
	ld	a, #0x44
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:204: NR23_REG = C3;
	ld	a, #0xa7
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:205: break;
	jp	00123$
;gb-dtmf.c:207: case 'a':
00105$:
;gb-dtmf.c:208: NR13_REG = R1;
	ld	a, #0x44
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:209: NR23_REG = C4;
	ld	a, #0xb0
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:210: break;
	jp	00123$
;gb-dtmf.c:211: case '4':
00106$:
;gb-dtmf.c:212: NR13_REG = R2;
	ld	a, #0x56
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:213: NR23_REG = C1;
	ld	a, #0x94
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:214: break;
	jp	00123$
;gb-dtmf.c:215: case '5':
00107$:
;gb-dtmf.c:216: NR13_REG = R2;
	ld	a, #0x56
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:217: NR23_REG = C2;
	ld	a, #0x9e
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:218: break;
	jr	00123$
;gb-dtmf.c:219: case '6':
00108$:
;gb-dtmf.c:220: NR13_REG = R2;
	ld	a, #0x56
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:221: NR23_REG = C3;
	ld	a, #0xa7
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:222: break;
	jr	00123$
;gb-dtmf.c:224: case 'b':
00110$:
;gb-dtmf.c:225: NR13_REG = R2;
	ld	a, #0x56
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:226: NR23_REG = C4;
	ld	a, #0xb0
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:227: break;
	jr	00123$
;gb-dtmf.c:228: case '7':
00111$:
;gb-dtmf.c:229: NR13_REG = R3;
	ld	a, #0x66
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:230: NR23_REG = C1;
	ld	a, #0x94
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:231: break;
	jr	00123$
;gb-dtmf.c:232: case '8':
00112$:
;gb-dtmf.c:233: NR13_REG = R3;
	ld	a, #0x66
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:234: NR23_REG = C2;
	ld	a, #0x9e
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:235: break;
	jr	00123$
;gb-dtmf.c:236: case '9':
00113$:
;gb-dtmf.c:237: NR13_REG = R3;
	ld	a, #0x66
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:238: NR23_REG = C3;
	ld	a, #0xa7
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:239: break;
	jr	00123$
;gb-dtmf.c:241: case 'c':
00115$:
;gb-dtmf.c:242: NR13_REG = R3;
	ld	a, #0x66
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:243: NR23_REG = C4;
	ld	a, #0xb0
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:244: break;
	jr	00123$
;gb-dtmf.c:245: case '*':
00116$:
;gb-dtmf.c:246: NR13_REG = R4;
	ld	a, #0x75
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:247: NR23_REG = C1;
	ld	a, #0x94
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:248: break;
	jr	00123$
;gb-dtmf.c:249: case '0':
00117$:
;gb-dtmf.c:250: NR13_REG = R4;
	ld	a, #0x75
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:251: NR23_REG = C2;
	ld	a, #0x9e
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:252: break;
	jr	00123$
;gb-dtmf.c:253: case '#':
00118$:
;gb-dtmf.c:254: NR13_REG = R4;
	ld	a, #0x75
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:255: NR23_REG = C3;
	ld	a, #0xa7
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:256: break;
	jr	00123$
;gb-dtmf.c:258: case 'd':
00120$:
;gb-dtmf.c:259: NR13_REG = R4;
	ld	a, #0x75
	ldh	(_NR13_REG + 0), a
;gb-dtmf.c:260: NR23_REG = C4;
	ld	a, #0xb0
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:261: break;
	jr	00123$
;gb-dtmf.c:262: case ',':
00121$:
;gb-dtmf.c:263: delay(dtmf_on);	/* keep on */
	push	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_delay
	pop	bc
;gb-dtmf.c:264: delay(dtmf_off);	/* keep off */
	push	bc
	ld	e, c
	ld	d, b
	call	_delay
	pop	bc
;gb-dtmf.c:266: default:
00122$:
;gb-dtmf.c:267: NR51_REG = 0x00U;	/* sound off */
	xor	a, a
	ldh	(_NR51_REG + 0), a
;gb-dtmf.c:268: goto skip;
	jr	00124$
;gb-dtmf.c:270: }
00123$:
;gb-dtmf.c:271: NR24_REG = 0x87U;	/* ch2 tips */
	ld	a, #0x87
	ldh	(_NR24_REG + 0), a
;gb-dtmf.c:272: NR51_REG = 0x33U;	/* sound on */
	ld	a, #0x33
	ldh	(_NR51_REG + 0), a
;gb-dtmf.c:273: delay(dtmf_on);		/* keep on */
	push	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_delay
	pop	bc
;gb-dtmf.c:275: NR51_REG = 0x00U;	/* sound off */
	xor	a, a
	ldh	(_NR51_REG + 0), a
;gb-dtmf.c:276: delay(dtmf_off);	/* keep off */
	push	bc
	ld	e, c
	ld	d, b
	call	_delay
	pop	bc
;gb-dtmf.c:278: skip:
00124$:
;gb-dtmf.c:279: i++;
	ldhl	sp,	#2
	inc	(hl)
	jp	00125$
00128$:
;gb-dtmf.c:281: }
	add	sp, #3
	pop	hl
	pop	af
	jp	(hl)
;gb-dtmf.c:285: void disp_lcd(uint8_t len, char str[MAX_DTMF])
;	---------------------------------
; Function disp_lcd
; ---------------------------------
_disp_lcd::
	add	sp, #-6
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
	ld	(hl), d
;gb-dtmf.c:289: j = len;
	ldhl	sp,	#0
	ld	(hl), a
;gb-dtmf.c:292: while(str[i]){
	ldhl	sp,	#5
	ld	(hl), #0x00
00121$:
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
;gb-dtmf.c:293: if(str[i] >= '0'||'9' <= str[i]){
	or	a,a
	jp	Z,00124$
	xor	a, #0x80
	sub	a, #0xb0
	jr	C, 00102$
;gb-dtmf.c:294: disp_tile[i] = OFFSET + (str[i] - '0') * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0xd0
	add	a, a
	add	a, #0x1b
	ld	(bc), a
;gb-dtmf.c:295: disp_tile[i+j] = OFFSET + (str[i] - '0') * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	a, (de)
	add	a, #0xd0
	add	a, a
	add	a, #0x1c
	ld	(hl), a
00102$:
;gb-dtmf.c:297: switch(str[i]){
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	cp	a, #0x20
	jp	Z,00110$
	cp	a, #0x23
	jp	Z,00108$
	cp	a, #0x2a
	jp	Z,00109$
	cp	a, #0x2c
	jp	Z,00117$
	cp	a, #0x2d
	jp	Z,00115$
	cp	a, #0x41
	jr	Z, 00104$
	cp	a, #0x42
	jr	Z, 00105$
	cp	a, #0x43
	jr	Z, 00106$
	cp	a, #0x44
	jp	Z,00107$
	cp	a, #0x46
	jp	Z,00118$
	cp	a, #0x47
	jp	Z,00114$
	cp	a, #0x4d
	jp	Z,00112$
	cp	a, #0x53
	jp	Z,00119$
	cp	a, #0x54
	jp	Z,00116$
	cp	a, #0x55
	jp	Z,00113$
	sub	a, #0x59
	jp	Z,00111$
	jp	00120$
;gb-dtmf.c:298: case 'A':
00104$:
;gb-dtmf.c:299: disp_tile[i] = OFFSET + 10 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x2f
;gb-dtmf.c:300: disp_tile[i+j] = OFFSET + 10 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x30
;gb-dtmf.c:301: break;
	jp	00120$
;gb-dtmf.c:302: case 'B':
00105$:
;gb-dtmf.c:303: disp_tile[i] = OFFSET + 11 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x31
;gb-dtmf.c:304: disp_tile[i+j] = OFFSET + 11 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x32
;gb-dtmf.c:305: break;
	jp	00120$
;gb-dtmf.c:306: case 'C':
00106$:
;gb-dtmf.c:307: disp_tile[i] = OFFSET + 12 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x33
;gb-dtmf.c:308: disp_tile[i+j] = OFFSET + 12 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x34
;gb-dtmf.c:309: break;
	jp	00120$
;gb-dtmf.c:310: case 'D':
00107$:
;gb-dtmf.c:311: disp_tile[i] = OFFSET + 13 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x35
;gb-dtmf.c:312: disp_tile[i+j] = OFFSET + 13 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x36
;gb-dtmf.c:313: break;
	jp	00120$
;gb-dtmf.c:314: case '#':
00108$:
;gb-dtmf.c:315: disp_tile[i] = OFFSET + 14 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x37
;gb-dtmf.c:316: disp_tile[i+j] = OFFSET + 14 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x38
;gb-dtmf.c:317: break;
	jp	00120$
;gb-dtmf.c:318: case '*':
00109$:
;gb-dtmf.c:319: disp_tile[i] = OFFSET + 15 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x39
;gb-dtmf.c:320: disp_tile[i+j] = OFFSET + 15 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x3a
;gb-dtmf.c:321: break;
	jp	00120$
;gb-dtmf.c:322: case ' ':
00110$:
;gb-dtmf.c:323: disp_tile[i] = OFFSET + 16 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x3b
;gb-dtmf.c:324: disp_tile[i+j] = OFFSET + 16 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x3c
;gb-dtmf.c:325: break;
	jp	00120$
;gb-dtmf.c:326: case 'Y':
00111$:
;gb-dtmf.c:327: disp_tile[i] = OFFSET + 17 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x3d
;gb-dtmf.c:328: disp_tile[i+j] = OFFSET + 17 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x3e
;gb-dtmf.c:329: break;
	jp	00120$
;gb-dtmf.c:330: case 'M':
00112$:
;gb-dtmf.c:331: disp_tile[i] = OFFSET + 18 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x3f
;gb-dtmf.c:332: disp_tile[i+j] = OFFSET + 18 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x40
;gb-dtmf.c:333: break;
	jp	00120$
;gb-dtmf.c:334: case 'U':
00113$:
;gb-dtmf.c:335: disp_tile[i] = OFFSET + 19 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x41
;gb-dtmf.c:336: disp_tile[i+j] = OFFSET + 19 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x42
;gb-dtmf.c:337: break;
	jp	00120$
;gb-dtmf.c:338: case 'G':
00114$:
;gb-dtmf.c:339: disp_tile[i] = OFFSET + 20 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x43
;gb-dtmf.c:340: disp_tile[i+j] = OFFSET + 20 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x44
;gb-dtmf.c:341: break;
	jp	00120$
;gb-dtmf.c:342: case '-':
00115$:
;gb-dtmf.c:343: disp_tile[i] = OFFSET + 21 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x45
;gb-dtmf.c:344: disp_tile[i+j] = OFFSET + 21 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x46
;gb-dtmf.c:345: break;
	jr	00120$
;gb-dtmf.c:346: case 'T':
00116$:
;gb-dtmf.c:347: disp_tile[i] = OFFSET + 22 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x47
;gb-dtmf.c:348: disp_tile[i+j] = OFFSET + 22 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x48
;gb-dtmf.c:349: break;
	jr	00120$
;gb-dtmf.c:350: case ',':
00117$:
;gb-dtmf.c:351: disp_tile[i] = OFFSET + 23 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x49
;gb-dtmf.c:352: disp_tile[i+j] = OFFSET + 23 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x4a
;gb-dtmf.c:353: break;
	jr	00120$
;gb-dtmf.c:354: case 'F':
00118$:
;gb-dtmf.c:355: disp_tile[i] = OFFSET + 24 * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	b, h
	ld	(hl), #0x4b
;gb-dtmf.c:356: disp_tile[i+j] = OFFSET + 24 * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x4c
;gb-dtmf.c:357: break;
	jr	00120$
;gb-dtmf.c:358: case 'S':
00119$:
;gb-dtmf.c:359: disp_tile[i] = OFFSET + ('5' - '0') * 2;
	ld	de, #_disp_tile
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x25
;gb-dtmf.c:360: disp_tile[i+j] = OFFSET + ('5' - '0') * 2 + 1;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	c, a
	ld	hl, #_disp_tile
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x26
;gb-dtmf.c:362: }
00120$:
;gb-dtmf.c:363: i++;
	ldhl	sp,	#5
	inc	(hl)
	jp	00121$
00124$:
;gb-dtmf.c:365: }
	add	sp, #6
	ret
;gb-dtmf.c:368: void clr_disp(void)
;	---------------------------------
; Function clr_disp
; ---------------------------------
_clr_disp::
;gb-dtmf.c:370: set_bkg_data(OFFSET, 50, dtmf_lcd);
	ld	de, #_dtmf_lcd
	push	de
	ld	hl, #0x321b
	push	hl
	call	_set_bkg_data
	add	sp, #4
;gb-dtmf.c:371: set_bkg_tiles(LCD_X, LCD_Y, LCD_WIDTH, LCD_HIGHT, init_disp);
	ld	de, #_init_disp
	push	de
	ld	hl, #0x212
	push	hl
	ld	hl, #0x201
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;gb-dtmf.c:372: }
	ret
;gb-dtmf.c:377: void disp(const char *str)
;	---------------------------------
; Function disp
; ---------------------------------
_disp::
	add	sp, #-36
	ldhl	sp,	#34
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;gb-dtmf.c:383: clr_disp();
	call	_clr_disp
;gb-dtmf.c:386: while(str[no]){
	ld	e, #0x00
00101$:
	push	de
	ld	d, #0x00
	ldhl	sp,	#36
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00103$
;gb-dtmf.c:387: no++;
	inc	e
	jr	00101$
00103$:
;gb-dtmf.c:390: if(no >= LCD_WIDTH){
;gb-dtmf.c:391: start_ch = no - LCD_WIDTH;
	ld	a,e
	cp	a,#0x12
	jr	C, 00105$
	add	a, #0xee
	ld	c, a
;gb-dtmf.c:392: end_ch = LCD_WIDTH;
	ldhl	sp,	#32
	ld	(hl), #0x12
	jr	00117$
00105$:
;gb-dtmf.c:395: start_ch = 0;
	ld	c, #0x00
;gb-dtmf.c:396: end_ch = no;
	ldhl	sp,	#32
	ld	(hl), e
;gb-dtmf.c:398: for(i = 0;i < end_ch;i++){
00117$:
	ld	b, #0x00
00109$:
	ld	a, b
	ldhl	sp,	#32
	sub	a, (hl)
	jr	NC, 00107$
;gb-dtmf.c:399: work[i] = str[i+start_ch];
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ld	l, b
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	e, b
	ld	d, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#34
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	pop	hl
	push	hl
	ld	(hl), a
;gb-dtmf.c:398: for(i = 0;i < end_ch;i++){
	inc	b
	jr	00109$
00107$:
;gb-dtmf.c:401: work[end_ch] = 0x00;
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#32
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;gb-dtmf.c:403: disp_lcd(end_ch, work);
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	ldhl	sp,	#32
	ld	a, (hl)
	call	_disp_lcd
;gb-dtmf.c:405: left_pos = 19 - end_ch;
	ldhl	sp,	#32
	ld	a, (hl+)
	ld	c, a
	ld	a, #0x13
	sub	a, c
;gb-dtmf.c:406: set_bkg_tiles(left_pos, 2, end_ch, LCD_HIGHT, disp_tile);
	ld	(hl-), a
	ld	de, #_disp_tile
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	a, (hl+)
	ld	d, a
	ld	e, #0x02
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
;gb-dtmf.c:407: }
	add	sp, #42
	ret
;gb-dtmf.c:409: void press_button(uint8_t x, uint8_t y)
;	---------------------------------
; Function press_button
; ---------------------------------
_press_button::
	dec	sp
	dec	sp
	ld	b, a
	ld	c, e
;gb-dtmf.c:412: set_bkg_tiles(x * 3 + 1, y * 3 + 5, 3, 3, press_tile);
	ld	a, c
	ldhl	sp,	#1
	ld	(hl), b
	dec	hl
	ld	e, a
	add	a, a
	add	a, e
	ld	(hl+), a
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x05
	ld	d, a
;gb-dtmf.c:411: if(x <= 3 && y <= 3){
	ld	a,#0x03
	cp	a,b
	jr	C, 00102$
	sub	a, c
	jr	C, 00102$
;gb-dtmf.c:412: set_bkg_tiles(x * 3 + 1, y * 3 + 5, 3, 3, press_tile);
	inc	hl
	ld	a, (hl)
	inc	a
	push	de
	ld	hl, #_press_tile
	push	hl
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00102$:
;gb-dtmf.c:414: if((x == 4 || x == 5) && (y <= 2)){
	ld	a, b
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00157$
	xor	a, a
00157$:
	ld	e, a
	ld	a, b
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00159$
	xor	a, a
00159$:
	ld	b, a
	ld	a, e
	or	a,a
	jr	NZ, 00107$
	or	a,b
	jr	Z, 00105$
00107$:
	ld	a, #0x02
	sub	a, c
	jr	C, 00105$
;gb-dtmf.c:415: set_bkg_tiles(x * 3 + 2, y * 3 + 5, 3, 3, press_tile);
	ldhl	sp,	#1
	ld	a, (hl)
	inc	a
	inc	a
	push	de
	ld	hl, #_press_tile
	push	hl
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00105$:
;gb-dtmf.c:417: if((x == 4 || x == 5) && (y == 3)){
	ld	a, e
	or	a,a
	jr	NZ, 00111$
	or	a,b
	jr	Z, 00112$
00111$:
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00112$
;gb-dtmf.c:418: set_bkg_tiles(14, 14, 6, 3, dialing_press);
	ld	de, #_dialing_press
	push	de
	ld	hl, #0x306
	push	hl
	ld	hl, #0xe0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00112$:
;gb-dtmf.c:420: }
	inc	sp
	inc	sp
	ret
;gb-dtmf.c:422: void break_button(uint8_t x, uint8_t y)
;	---------------------------------
; Function break_button
; ---------------------------------
_break_button::
	dec	sp
	dec	sp
	ld	b, a
	ld	c, e
;gb-dtmf.c:425: set_bkg_tiles(x * 3 + 1, y * 3 + 5, 3, 3, break_tile);
	ld	a, c
	ldhl	sp,	#1
	ld	(hl), b
	dec	hl
	ld	e, a
	add	a, a
	add	a, e
	ld	(hl+), a
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x05
	ld	d, a
;gb-dtmf.c:424: if(x <= 3 && y <= 3){
	ld	a,#0x03
	cp	a,b
	jr	C, 00102$
	sub	a, c
	jr	C, 00102$
;gb-dtmf.c:425: set_bkg_tiles(x * 3 + 1, y * 3 + 5, 3, 3, break_tile);
	inc	hl
	ld	a, (hl)
	inc	a
	push	de
	ld	hl, #_break_tile
	push	hl
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00102$:
;gb-dtmf.c:427: if((x == 4 || x == 5) && (y <= 2)){
	ld	a, b
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00157$
	xor	a, a
00157$:
	ld	e, a
	ld	a, b
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00159$
	xor	a, a
00159$:
	ld	b, a
	ld	a, e
	or	a,a
	jr	NZ, 00107$
	or	a,b
	jr	Z, 00105$
00107$:
	ld	a, #0x02
	sub	a, c
	jr	C, 00105$
;gb-dtmf.c:428: set_bkg_tiles(x * 3 + 2, y * 3 + 5, 3, 3, break_tile);
	ldhl	sp,	#1
	ld	a, (hl)
	inc	a
	inc	a
	push	de
	ld	hl, #_break_tile
	push	hl
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00105$:
;gb-dtmf.c:430: if((x == 4 || x == 5) && (y == 3)){
	ld	a, e
	or	a,a
	jr	NZ, 00111$
	or	a,b
	jr	Z, 00112$
00111$:
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00112$
;gb-dtmf.c:431: set_bkg_tiles(14, 14, 6, 3, dialing_break);
	ld	de, #_dialing_break
	push	de
	ld	hl, #0x306
	push	hl
	ld	hl, #0xe0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00112$:
;gb-dtmf.c:433: }
	inc	sp
	inc	sp
	ret
;gb-dtmf.c:436: void init_key(void)
;	---------------------------------
; Function init_key
; ---------------------------------
_init_key::
	add	sp, #-3
;gb-dtmf.c:441: set_sprite_data(0, 24, key_num);
	ld	de, #_key_num
	push	de
	ld	hl, #0x1800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;gb-dtmf.c:445: for(i = 1;i <= 3;i++){
	ld	c, #0x01
00127$:
;gb-dtmf.c:446: key_x = i * KEY_STEP;
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), c
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), b
;gb-dtmf.c:445: for(i = 1;i <= 3;i++){
	inc	c
	ld	a, #0x03
	sub	a, c
	jr	NC, 00127$
;gb-dtmf.c:453: for(i = 4;i <= 6;i++){
	ld	c, #0x04
00129$:
;gb-dtmf.c:454: key_x = (i - 3) * KEY_STEP;
	ld	a, c
	add	a, #0xfd
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), c
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), b
;gb-dtmf.c:453: for(i = 4;i <= 6;i++){
	inc	c
	ld	a, #0x06
	sub	a, c
	jr	NC, 00129$
;gb-dtmf.c:461: for(i = 7;i <= 9;i++){
	ld	c, #0x07
00131$:
;gb-dtmf.c:462: key_x = (i - 6) * KEY_STEP;
	ld	a, c
	add	a, #0xfa
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), c
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x70
	ld	(hl+), a
	ld	(hl), b
;gb-dtmf.c:461: for(i = 7;i <= 9;i++){
	inc	c
	ld	a, #0x09
	sub	a, c
	jr	NC, 00131$
;gb-dtmf.c:469: for(i = 0;i <= 3;i++){
	ldhl	sp,	#2
	ld	(hl), #0x00
00133$:
;gb-dtmf.c:470: key_y = (i+1) * KEY_STEP + 40;
	ldhl	sp,	#2
	ld	a, (hl-)
	dec	hl
	ld	c, a
	inc	a
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x28
;gb-dtmf.c:471: set_sprite_tile(i+10, i+10);
	ld	(hl+), a
	ld	a, c
	add	a, #0x0a
	ld	e, a
	ld	(hl), e
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
;gb-dtmf.c:472: move_sprite(i+10, key_x, key_y);
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
;gb-dtmf.c:469: for(i = 0;i <= 3;i++){
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
	ld	a, #0x60
	ld	(bc), a
	inc	(hl)
	ld	a, #0x03
	sub	a, (hl)
	jr	NC, 00133$
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x0f
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x88
	ld	(hl+), a
	ld	(hl), #0x18
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x88
	ld	(hl+), a
	ld	(hl), #0x30
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x0e
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x88
	ld	(hl+), a
	ld	(hl), #0x48
;gb-dtmf.c:485: for(i = 0;i <= 2;i++){
	ldhl	sp,	#2
	ld	(hl), #0x00
00135$:
;gb-dtmf.c:486: key_y = (i+1) * KEY_STEP + 40;
	ldhl	sp,	#2
	ld	a, (hl-)
	dec	hl
	ld	c, a
	inc	a
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x28
;gb-dtmf.c:487: set_sprite_tile(i+16, i+16);
	ld	(hl+), a
	ld	a, c
	add	a, #0x10
	ld	e, a
	ld	(hl), e
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
;gb-dtmf.c:488: move_sprite(i+16, key_x, key_y);
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
;gb-dtmf.c:485: for(i = 0;i <= 2;i++){
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
	ld	a, #0x80
	ld	(bc), a
	inc	(hl)
	ld	a, #0x02
	sub	a, (hl)
	jr	NC, 00135$
;gb-dtmf.c:493: for(i = 0;i <= 2;i++){
	ld	(hl), #0x00
00137$:
;gb-dtmf.c:494: key_y = (i+1) * KEY_STEP + 40;
	ldhl	sp,	#2
	ld	a, (hl-)
	dec	hl
	ld	c, a
	inc	a
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x28
;gb-dtmf.c:495: set_sprite_tile(i+19, i+19);
	ld	(hl+), a
	ld	a, c
	add	a, #0x13
	ld	e, a
	ld	(hl), e
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
;gb-dtmf.c:496: move_sprite(i+19, key_x, key_y);
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
;gb-dtmf.c:493: for(i = 0;i <= 2;i++){
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
	ld	a, #0x98
	ld	(bc), a
	inc	(hl)
	ld	a, #0x02
	sub	a, (hl)
	jr	NC, 00137$
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
	ld	(hl), #0x16
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 88)
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x88
	ld	(hl+), a
	ld	(hl), #0x8c
;gb-dtmf.c:503: move_sprite(22, key_x, key_y);
;gb-dtmf.c:504: }
	add	sp, #3
	ret
;gb-dtmf.c:506: void init_background(void)
;	---------------------------------
; Function init_background
; ---------------------------------
_init_background::
;gb-dtmf.c:509: set_bkg_data( 0, 9, frame_lcd);
	ld	de, #_frame_lcd
	push	de
	ld	hl, #0x900
	push	hl
	call	_set_bkg_data
	add	sp, #4
;gb-dtmf.c:510: set_bkg_data( 9, 9, break_btn);
	ld	de, #_break_btn
	push	de
	ld	hl, #0x909
	push	hl
	call	_set_bkg_data
	add	sp, #4
;gb-dtmf.c:511: set_bkg_data(18, 9, press_btn);
	ld	de, #_press_btn
	push	de
	ld	hl, #0x912
	push	hl
	call	_set_bkg_data
	add	sp, #4
;gb-dtmf.c:513: set_bkg_tiles(0, 0, 20, 18, dtmf_tile);
	ld	de, #_dtmf_tile
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;gb-dtmf.c:514: }
	ret
;gb-dtmf.c:516: void init_cursor(void)
;	---------------------------------
; Function init_cursor
; ---------------------------------
_init_cursor::
;gb-dtmf.c:521: set_sprite_data(23, 8, cursor_data);
	ld	de, #_cursor_data
	push	de
	ld	hl, #0x817
	push	hl
	call	_set_sprite_data
	add	sp, #4
;gb-dtmf.c:523: for(i = 23;i <= 30;i++){
	ld	c, #0x17
00103$:
;../../../include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;gb-dtmf.c:523: for(i = 23;i <= 30;i++){
	inc	c
	ld	a, #0x1e
	sub	a, c
	jr	NC, 00103$
;gb-dtmf.c:526: }
	ret
;gb-dtmf.c:528: void move_cursor(uint8_t x, uint8_t y)
;	---------------------------------
; Function move_cursor
; ---------------------------------
_move_cursor::
	dec	sp
	ld	c, a
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 92)
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;gb-dtmf.c:531: move_sprite(24, x, y+8);
	ld	a, e
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 96)
	ld	(hl+), a
	ld	(hl), c
;gb-dtmf.c:532: move_sprite(25, x+8, y);
	ld	a, c
	add	a, #0x08
	ld	c, a
	ld	b, c
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), b
;../../../include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+104
;../../../include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;gb-dtmf.c:533: move_sprite(26, x+8, y+8);
;gb-dtmf.c:534: }
	inc	sp
	ret
;gb-dtmf.c:536: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-59
;gb-dtmf.c:539: uint8_t non_flick = OFF;
	ldhl	sp,	#40
;gb-dtmf.c:546: key2 = 0;
	xor	a, a
	ld	(hl+), a
;gb-dtmf.c:549: on_time = DTMF_ON;
	xor	a, a
	ld	(hl+), a
	ld	a, #0x64
	ld	(hl+), a
	xor	a, a
;gb-dtmf.c:550: off_time = DTMF_OFF;
	ld	(hl+), a
	ld	a, #0x64
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;../../../include/gb/gb.h:754: __asm__("di");
	di
;gb-dtmf.c:554: SPRITES_8x8;   /* sprites are 8x8 */
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;gb-dtmf.c:556: init_dial();
	call	_init_dial
;gb-dtmf.c:558: init_background();
	call	_init_background
;gb-dtmf.c:560: init_key();
	call	_init_key
;gb-dtmf.c:562: init_cursor();
	call	_init_cursor
;gb-dtmf.c:564: disp(TITLE);
	ld	de, #___str_0
	call	_disp
;gb-dtmf.c:566: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;gb-dtmf.c:567: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;gb-dtmf.c:568: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;../../../include/gb/gb.h:738: __asm__("ei");
	ei
;gb-dtmf.c:572: i = j = 0;
	ldhl	sp,	#56
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;gb-dtmf.c:574: ch_pos = 0;
	inc	hl
	ld	(hl), #0x00
;gb-dtmf.c:576: while(1) {
00187$:
;gb-dtmf.c:577: vsync();
	call	_vsync
;gb-dtmf.c:578: key1 = joypad();
	call	_joypad
	ldhl	sp,	#46
	ld	(hl), a
;gb-dtmf.c:580: if(key1 != key2){
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#46
	sub	a, (hl)
	jr	Z, 00102$
;gb-dtmf.c:581: pos_x = i * KEY_STEP + START_CURSOR_X;
	ldhl	sp,	#57
	ld	a, (hl-)
	dec	hl
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
;gb-dtmf.c:582: pos_y = j * KEY_STEP + START_CURSOR_Y;
	ld	a, (hl+)
	add	a, #0x18
	ld	c, a
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x48
	ld	e, a
;gb-dtmf.c:583: move_cursor(pos_x, pos_y);
	ld	a, c
	call	_move_cursor
00102$:
;gb-dtmf.c:587: if(key1 & J_A){
	ldhl	sp,	#46
	ld	a, (hl+)
	and	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;gb-dtmf.c:589: if(i <= 3 && j <= 3){
	ld	a, #0x03
	ldhl	sp,	#57
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#49
	ld	(hl), a
	ld	a, #0x03
	ldhl	sp,	#56
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#50
	ld	(hl), a
;gb-dtmf.c:601: if(i == 5 && j == 0 && !non_flick){
	ldhl	sp,	#57
	ld	a, (hl)
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00545$
	xor	a, a
00545$:
	ldhl	sp,	#51
	ld	(hl), a
;gb-dtmf.c:609: if(i == 5 && (j == 1 || j == 2) && !non_flick){
	ldhl	sp,	#56
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00547$
	xor	a, a
00547$:
	ldhl	sp,	#52
	ld	(hl), a
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00549$
	xor	a, a
00549$:
	ldhl	sp,	#53
	ld	(hl), a
;gb-dtmf.c:586: if(key2 & J_A){
	push	hl
	ldhl	sp,	#43
	bit	4, (hl)
	pop	hl
	jp	Z,00164$
;gb-dtmf.c:587: if(key1 & J_A){
	xor	a, a
	ldhl	sp,	#47
	or	a, (hl)
	jp	Z, 00124$
;gb-dtmf.c:589: if(i <= 3 && j <= 3){
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	NZ, 00104$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00104$
;gb-dtmf.c:591: NR13_REG = row[i];
	ld	de, #_row
	ldhl	sp,	#57
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#56
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#55
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
;gb-dtmf.c:592: NR23_REG = col[j];
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ldh	(_NR13_REG + 0), a
	ld	de, #_col
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#56
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#55
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldh	(_NR23_REG + 0), a
;gb-dtmf.c:593: NR24_REG = 0x87U;
	ld	a, #0x87
	ldh	(_NR24_REG + 0), a
;gb-dtmf.c:596: NR51_REG = 0x33U;
	ld	a, #0x33
	ldh	(_NR51_REG + 0), a
00104$:
;gb-dtmf.c:601: if(i == 5 && j == 0 && !non_flick){
	ldhl	sp,	#51
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
	ldhl	sp,	#56
	ld	a, (hl)
	or	a, a
	jr	NZ, 00107$
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	NZ, 00107$
;gb-dtmf.c:602: disp(TITLE);
	ld	de, #___str_0
	call	_disp
;gb-dtmf.c:603: non_flick = ON;
	ldhl	sp,	#40
	ld	(hl), #0x01
00107$:
;gb-dtmf.c:609: if(i == 5 && (j == 1 || j == 2) && !non_flick){
	ldhl	sp,	#51
	ld	a, (hl)
	or	a, a
	jp	Z, 00165$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00165$
00114$:
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jp	NZ, 00165$
;gb-dtmf.c:610: sprintf(str_ms, "%u MS", on_time);
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #___str_1
	push	de
	ld	hl, #34
	add	hl, sp
	push	hl
	call	_sprintf
	add	sp, #6
;gb-dtmf.c:611: disp(str_ms);
	ld	hl, #30
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_disp
;gb-dtmf.c:612: non_flick = ON;
	ldhl	sp,	#40
	ld	(hl), #0x01
	jp	00165$
00124$:
;gb-dtmf.c:617: NR51_REG = 0x00U;
	xor	a, a
	ldh	(_NR51_REG + 0), a
;gb-dtmf.c:619: break_button(i, j);
	ldhl	sp,	#56
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
	call	_break_button
;gb-dtmf.c:625: if(i == 5 && (j == 0 || j == 1 || j == 2)){
	ldhl	sp,	#51
	ld	a, (hl)
	or	a, a
	jp	Z, 00165$
	ldhl	sp,	#56
	ld	a, (hl)
	or	a, a
	jr	Z, 00118$
	ldhl	sp,	#52
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00165$
00118$:
;gb-dtmf.c:626: non_flick = OFF;
	ldhl	sp,	#40
	ld	(hl), #0x00
;gb-dtmf.c:627: if(ch_pos == 0)
	ldhl	sp,	#58
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
;gb-dtmf.c:628: clr_disp();
	call	_clr_disp
	jp	00165$
00116$:
;gb-dtmf.c:630: disp(str);
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	call	_disp
	jp	00165$
00164$:
;gb-dtmf.c:635: if(key1 & J_A){
	xor	a, a
	ldhl	sp,	#47
	or	a, (hl)
	jp	Z, 00165$
;gb-dtmf.c:637: press_button(i, j);
	ldhl	sp,	#56
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
	call	_press_button
;gb-dtmf.c:643: str[ch_pos] = pad[j][i];
	ldhl	sp,	#56
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#56
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#55
	ld	(hl), a
;gb-dtmf.c:640: if(i <= 3 && j <= 3){
	ldhl	sp,	#49
	bit	0, (hl)
	jr	NZ, 00129$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00129$
;gb-dtmf.c:642: if(ch_pos < MAX_DTMF-1){
	ldhl	sp,	#58
	ld	a, (hl)
	sub	a, #0x1d
	jr	NC, 00129$
;gb-dtmf.c:643: str[ch_pos] = pad[j][i];
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#51
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#50
	ld	(hl), a
	ld	de, #_pad
	ldhl	sp,	#54
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#57
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#49
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;gb-dtmf.c:644: ch_pos++;
	ldhl	sp,	#58
	inc	(hl)
;gb-dtmf.c:645: str[ch_pos] = 0x00;
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;gb-dtmf.c:646: disp(str);
	ld	e, c
	ld	d, b
	call	_disp
00129$:
;gb-dtmf.c:651: if(i == 4 && j == 2){
	ldhl	sp,	#57
	ld	a, (hl)
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00552$
	xor	a, a
00552$:
	ld	b, a
	or	a, a
	jr	Z, 00134$
	ldhl	sp,	#53
	ld	a, (hl)
	or	a, a
	jr	Z, 00134$
;gb-dtmf.c:653: if(ch_pos < MAX_DTMF-1){
	ldhl	sp,	#58
	ld	a, (hl)
	sub	a, #0x1d
	jr	NC, 00134$
;gb-dtmf.c:654: str[ch_pos] = pad[j][i];
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#51
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#50
	ld	(hl), a
	ld	de, #_pad+0
	ldhl	sp,	#54
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#57
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#49
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;gb-dtmf.c:655: ch_pos++;
	ldhl	sp,	#58
	inc	(hl)
;gb-dtmf.c:656: str[ch_pos] = 0x00;
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;gb-dtmf.c:657: disp(str);
	push	bc
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_disp
	pop	bc
00134$:
;gb-dtmf.c:662: if(i == 4 && j == 0){
	ld	a, b
	or	a, a
	jr	Z, 00137$
	ldhl	sp,	#56
	ld	a, (hl)
	or	a, a
	jr	NZ, 00137$
;gb-dtmf.c:663: ch_pos = 0x00;
	inc	hl
	inc	hl
	ld	(hl), #0x00
;gb-dtmf.c:664: strcpy(str,"");
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ld	hl, #___str_2
	push	hl
	push	de
	call	_strcpy
	add	sp, #4
;gb-dtmf.c:665: clr_disp();
	push	bc
	call	_clr_disp
	pop	bc
00137$:
;gb-dtmf.c:669: if(i == 4 && j == 1){
	ld	a, b
	or	a, a
	jr	Z, 00145$
	ldhl	sp,	#52
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
;gb-dtmf.c:670: if(ch_pos > 0){
	ldhl	sp,	#58
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
;gb-dtmf.c:671: ch_pos--;
	dec	(hl)
;gb-dtmf.c:672: str[ch_pos] = 0x00;
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;gb-dtmf.c:673: if(ch_pos == 0)
	ldhl	sp,	#58
	ld	a, (hl)
	or	a, a
	jr	NZ, 00140$
;gb-dtmf.c:674: clr_disp();
	push	bc
	call	_clr_disp
	pop	bc
	jr	00145$
00140$:
;gb-dtmf.c:676: disp(str);
	push	bc
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_disp
	pop	bc
00145$:
;gb-dtmf.c:681: if(i == 5 && j == 1){
	ldhl	sp,	#51
	ld	a, (hl)
	or	a, a
	jr	Z, 00150$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00150$
;gb-dtmf.c:682: if(on_time >= DTMF_ON / 2){
	ldhl	sp,	#42
	ld	a, (hl+)
	sub	a, #0x32
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00150$
;gb-dtmf.c:683: on_time = on_time - 10;
	dec	hl
	ld	a, (hl+)
	ld	e, (hl)
	dec	hl
	add	a, #0xf6
	ld	c, a
	ld	a, e
	adc	a, #0xff
	ld	(hl), c
	inc	hl
;gb-dtmf.c:684: off_time = off_time - 10;
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, (hl)
	dec	hl
	add	a, #0xf6
	ld	c, a
	ld	a, e
	adc	a, #0xff
	ld	(hl), c
	inc	hl
	ld	(hl), a
00150$:
;gb-dtmf.c:689: if(i == 5 && j == 2){
	ldhl	sp,	#51
	ld	a, (hl)
	or	a, a
	jr	Z, 00155$
	inc	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00155$
;gb-dtmf.c:690: if(on_time <= DTMF_ON * 2){
	ldhl	sp,	#42
	ld	a, #0xc8
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00155$
;gb-dtmf.c:691: on_time = on_time + 10;
	ldhl	sp,	#42
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl+), a
;gb-dtmf.c:692: off_time = off_time + 10;
	xor	a, a
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, (hl)
	dec	hl
	add	a, #0x0a
	ld	c, a
	ld	a, e
	adc	a, #0x00
	ld	(hl), c
	inc	hl
	ld	(hl), a
00155$:
;gb-dtmf.c:697: if((i==4 || i==5) && j==3){
	ld	a, b
	or	a, a
	jr	NZ, 00160$
	ldhl	sp,	#51
	ld	a, (hl)
	or	a, a
	jr	Z, 00165$
00160$:
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00165$
;gb-dtmf.c:698: dialtone(on_time, off_time, str);
	ld	hl, #0
	add	hl, sp
	push	hl
	ldhl	sp,	#46
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#44
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_dialtone
00165$:
;gb-dtmf.c:702: if(!(key1 & J_A)){
	xor	a, a
	ldhl	sp,	#47
	or	a, (hl)
	jr	NZ, 00185$
;gb-dtmf.c:703: if((key1 & J_UP) && !(key2 & J_UP) && j > 0)
	push	hl
	dec	hl
	bit	2, (hl)
	pop	hl
	jr	Z, 00171$
	push	hl
	ldhl	sp,	#43
	bit	2, (hl)
	pop	hl
	jr	NZ, 00171$
	ldhl	sp,	#56
	ld	a, (hl)
	or	a, a
	jr	Z, 00171$
;gb-dtmf.c:704: j--;
	dec	(hl)
	jr	00172$
00171$:
;gb-dtmf.c:705: else if((key1 & J_DOWN) && !(key2 & J_DOWN) && j < 3)
	push	hl
	ldhl	sp,	#48
	bit	3, (hl)
	pop	hl
	jr	Z, 00172$
	push	hl
	ldhl	sp,	#43
	bit	3, (hl)
	pop	hl
	jr	NZ, 00172$
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00172$
;gb-dtmf.c:706: j++;
	inc	(hl)
00172$:
;gb-dtmf.c:708: if((key1 & J_LEFT) && !(key2 & J_LEFT) && i > 0)
	push	hl
	ldhl	sp,	#48
	bit	1, (hl)
	pop	hl
	jr	Z, 00180$
	push	hl
	ldhl	sp,	#43
	bit	1, (hl)
	pop	hl
	jr	NZ, 00180$
	ldhl	sp,	#57
	ld	a, (hl)
	or	a, a
	jr	Z, 00180$
;gb-dtmf.c:709: i--;
	dec	(hl)
	jr	00185$
00180$:
;gb-dtmf.c:710: else if((key1 & J_RIGHT) && !(key2 & J_RIGHT) && i < 5)
	push	hl
	ldhl	sp,	#48
	bit	0, (hl)
	pop	hl
	jr	Z, 00185$
	push	hl
	ldhl	sp,	#43
	bit	0, (hl)
	pop	hl
	jr	NZ, 00185$
	ldhl	sp,	#57
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00185$
;gb-dtmf.c:711: i++;
	inc	(hl)
00185$:
;gb-dtmf.c:713: key2 = key1;
	ldhl	sp,	#46
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
	jp	00187$
;gb-dtmf.c:715: }
	add	sp, #59
	ret
___str_0:
	.ascii " GB-DTMF BY 05AMU "
	.db 0x00
___str_1:
	.ascii "%u MS"
	.db 0x00
___str_2:
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
