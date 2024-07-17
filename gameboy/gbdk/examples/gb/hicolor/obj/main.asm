;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _hicolor_start
	.globl _cpu_fast
	.globl _fill_bkg_rect
	.globl _set_bkg_data
	.globl _display_off
	.globl _vsync
	.globl _joypad
	.globl _buttons_prev
	.globl _buttons
	.globl _hicolors
	.globl _blank_tile
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$buttons$0_0$0==.
_buttons::
	.ds 1
G$buttons_prev$0_0$0==.
_buttons_prev::
	.ds 1
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$36$0_0$137	= .
	.globl	C$main.c$36$0_0$137
;src/main.c:36: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-8
	C$main.c$38$2_0$137	= .
	.globl	C$main.c$38$2_0$137
;src/main.c:38: uint8_t  img_select = 0;
	ldhl	sp,	#7
	ld	(hl), #0x00
	C$main.c$39$2_0$137	= .
	.globl	C$main.c$39$2_0$137
;src/main.c:39: bool     first_pass = true;
	ldhl	sp,	#2
	C$main.c$40$2_0$137	= .
	.globl	C$main.c$40$2_0$137
;src/main.c:40: uint8_t  scroll_limit = 0;
	ld	a, #0x01
	ld	(hl-), a
	dec	hl
	ld	(hl), #0x00
	C$main.c$44$1_0$137	= .
	.globl	C$main.c$44$1_0$137
;src/main.c:44: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$47$1_0$137	= .
	.globl	C$main.c$47$1_0$137
;src/main.c:47: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jp	NZ,00128$
	C$main.c$49$2_0$138	= .
	.globl	C$main.c$49$2_0$138
;src/main.c:49: cpu_fast();
	call	_cpu_fast
	C$main.c$51$2_0$138	= .
	.globl	C$main.c$51$2_0$138
;src/main.c:51: while(true) {
00124$:
	C$main.c$53$3_0$139	= .
	.globl	C$main.c$53$3_0$139
;src/main.c:53: vsync();
	call	_vsync
	C$main.c$54$3_0$139	= .
	.globl	C$main.c$54$3_0$139
;src/main.c:54: UPDATE_BUTTONS();
	ld	a, (#_buttons)
	ld	(#_buttons_prev),a
	call	_joypad
	ldhl	sp,#6
	ld	(hl), a
	ld	a, (hl)
	ld	(#_buttons),a
	C$main.c$57$3_0$139	= .
	.globl	C$main.c$57$3_0$139
;src/main.c:57: if (BUTTON_TOGGLED(J_A | J_B) || first_pass) {
	ld	a, (#_buttons_prev)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	cpl
	ld	(hl+), a
	xor	a, a
	cpl
	ld	(hl), a
	ld	a, (#_buttons)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	and	a, (hl)
	and	a, #0x30
	jr	NZ, 00119$
	ldhl	sp,	#2
	bit	0, (hl)
	jp	Z, 00120$
00119$:
	C$main.c$59$4_0$140	= .
	.globl	C$main.c$59$4_0$140
;src/main.c:59: vsync();
	call	_vsync
	C$main.c$60$4_0$140	= .
	.globl	C$main.c$60$4_0$140
;src/main.c:60: DISPLAY_OFF;
	call	_display_off
	C$main.c$63$4_0$140	= .
	.globl	C$main.c$63$4_0$140
;src/main.c:63: hicolor_bank = hicolors[img_select].bank;
	ldhl	sp,	#7
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_hicolors
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl), a
	C$main.c$64$4_0$140	= .
	.globl	C$main.c$64$4_0$140
;src/main.c:64: p_hicolor = (const hicolor_data *)hicolors[img_select].ptr;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#3
	C$main.c$66$5_0$141	= .
	.globl	C$main.c$66$5_0$141
;src/main.c:66: uint8_t bank_save = _current_bank;
	ld	(hl+), a
	ldh	a, (__current_bank + 0)
	ld	(hl), a
	C$main.c$67$4_1$141	= .
	.globl	C$main.c$67$4_1$141
;src/main.c:67: if (hicolor_bank) SWITCH_ROM(hicolor_bank);
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
00102$:
	C$main.c$70$4_1$141	= .
	.globl	C$main.c$70$4_1$141
;src/main.c:70: SCY_REG = 0u;
	xor	a, a
	ldh	(_SCY_REG + 0), a
	C$main.c$71$1_0$137	= .
	.globl	C$main.c$71$1_0$137
;src/main.c:71: if ((p_hicolor->height_in_tiles * 8u) > DEVICE_SCREEN_PX_HEIGHT)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	C$main.c$81$1_0$137	= .
	.globl	C$main.c$81$1_0$137
;src/main.c:81: if ((p_hicolor->height_in_tiles * 8u) < DEVICE_SCREEN_PX_HEIGHT) {
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	C$main.c$71$1_0$137	= .
	.globl	C$main.c$71$1_0$137
;src/main.c:71: if ((p_hicolor->height_in_tiles * 8u) > DEVICE_SCREEN_PX_HEIGHT)
	ld	e, c
	ld	d, #0x00
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	a, #0x90
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00104$
	C$main.c$72$4_1$141	= .
	.globl	C$main.c$72$4_1$141
;src/main.c:72: scroll_limit = ((p_hicolor->height_in_tiles * 8u) - DEVICE_SCREEN_PX_HEIGHT);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x70
	ldhl	sp,	#0
	ld	(hl), a
	jr	00105$
00104$:
	C$main.c$73$4_1$141	= .
	.globl	C$main.c$73$4_1$141
;src/main.c:73: else scroll_limit = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
00105$:
	C$main.c$81$4_1$141	= .
	.globl	C$main.c$81$4_1$141
;src/main.c:81: if ((p_hicolor->height_in_tiles * 8u) < DEVICE_SCREEN_PX_HEIGHT) {
	ld	a, e
	sub	a, #0x90
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00107$
	C$main.c$82$5_1$142	= .
	.globl	C$main.c$82$5_1$142
;src/main.c:82: VBK_REG = VBK_BANK_1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	C$main.c$83$5_1$142	= .
	.globl	C$main.c$83$5_1$142
;src/main.c:83: set_bkg_data(BG_LAST_TILE, 1u, blank_tile);
	ld	de, #_blank_tile
	push	de
	ld	hl, #0x1ff
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$84$5_1$142	= .
	.globl	C$main.c$84$5_1$142
;src/main.c:84: fill_bkg_rect(0u, (p_hicolor->height_in_tiles), DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT, BKGF_BANK1);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x08
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x12
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x14
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_fill_bkg_rect
	add	sp, #5
	C$main.c$85$5_1$142	= .
	.globl	C$main.c$85$5_1$142
;src/main.c:85: VBK_REG = VBK_BANK_0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$main.c$86$5_1$142	= .
	.globl	C$main.c$86$5_1$142
;src/main.c:86: fill_bkg_rect(0u, (p_hicolor->height_in_tiles), DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT, BG_LAST_TILE);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0xff
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x12
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x14
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_fill_bkg_rect
	add	sp, #5
00107$:
	C$main.c$89$4_1$141	= .
	.globl	C$main.c$89$4_1$141
;src/main.c:89: SWITCH_ROM(bank_save);
	ldhl	sp,	#4
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
	C$main.c$92$4_1$141	= .
	.globl	C$main.c$92$4_1$141
;src/main.c:92: hicolor_start(p_hicolor, hicolor_bank);
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_hicolor_start
	C$main.c$94$4_1$141	= .
	.globl	C$main.c$94$4_1$141
;src/main.c:94: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	C$main.c$97$4_1$141	= .
	.globl	C$main.c$97$4_1$141
;src/main.c:97: img_select++;
	ldhl	sp,	#7
	inc	(hl)
	C$main.c$98$4_1$141	= .
	.globl	C$main.c$98$4_1$141
;src/main.c:98: if (img_select == ARRAY_LEN(hicolors)) img_select = 0;
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00109$
	ldhl	sp,	#7
	ld	(hl), #0x00
00109$:
	C$main.c$100$4_1$141	= .
	.globl	C$main.c$100$4_1$141
;src/main.c:100: first_pass = false;
	ldhl	sp,	#2
	ld	(hl), #0x00
	jp	00124$
00120$:
	C$main.c$103$1_0$137	= .
	.globl	C$main.c$103$1_0$137
;src/main.c:103: else if (BUTTON_PRESSED(J_UP)) {
	ld	a, (#_buttons)
	bit	2, a
	jr	Z, 00117$
	C$main.c$104$4_0$143	= .
	.globl	C$main.c$104$4_0$143
;src/main.c:104: if (SCY_REG) SCY_REG--;
	ld	a, (#_SCY_REG)
	or	a, a
	jp	Z, 00124$
	ldh	a, (_SCY_REG + 0)
	dec	a
	ldh	(_SCY_REG + 0), a
	jp	00124$
00117$:
	C$main.c$105$3_0$139	= .
	.globl	C$main.c$105$3_0$139
;src/main.c:105: } else if (BUTTON_PRESSED(J_DOWN)) {
	bit	3, a
	jp	Z,00124$
	C$main.c$106$4_0$144	= .
	.globl	C$main.c$106$4_0$144
;src/main.c:106: if (SCY_REG < scroll_limit) SCY_REG++;
	ldh	a, (_SCY_REG + 0)
	ldhl	sp,	#0
	sub	a, (hl)
	jp	NC, 00124$
	ldh	a, (_SCY_REG + 0)
	inc	a
	ldh	(_SCY_REG + 0), a
	jp	00124$
00128$:
	C$main.c$110$1_0$137	= .
	.globl	C$main.c$110$1_0$137
;src/main.c:110: }
	add	sp, #8
	C$main.c$110$1_0$137	= .
	.globl	C$main.c$110$1_0$137
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
G$blank_tile$0_0$0 == .
_blank_tile:
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
G$hicolors$0_0$0 == .
_hicolors:
	.byte ___bank_test_pattern_tall
	.dw _test_pattern_tall_data
	.byte ___bank_example_image
	.dw _example_image_data
	.byte ___bank_test_pattern_short
	.dw _test_pattern_short_data
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
