;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module gbc_hicolor
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hicolor_palette_isr
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _set_interrupts
	.globl _add_LCD
	.globl _remove_LCD
	.globl _hicolor_start
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
Fgbc_hicolor$SP_SAVE$0_0$0==.
_SP_SAVE:
	.ds 2
Fgbc_hicolor$STAT_SAVE$0_0$0==.
_STAT_SAVE:
	.ds 1
Fgbc_hicolor$p_hicolor_palettes$0_0$0==.
_p_hicolor_palettes:
	.ds 2
Fgbc_hicolor$hicolor_palettes_bank$0_0$0==.
_hicolor_palettes_bank:
	.ds 1
Fgbc_hicolor$hicolor_last_scanline$0_0$0==.
_hicolor_last_scanline:
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
	G$hicolor_palette_isr$0$0	= .
	.globl	G$hicolor_palette_isr$0$0
	C$gbc_hicolor.c$20$0_0$137	= .
	.globl	C$gbc_hicolor.c$20$0_0$137
;src/gbc_hicolor.c:20: void hicolor_palette_isr(void) NONBANKED {
;	---------------------------------
; Function hicolor_palette_isr
; ---------------------------------
_hicolor_palette_isr::
	C$gbc_hicolor.c$116$1_0$137	= .
	.globl	C$gbc_hicolor.c$116$1_0$137
;src/gbc_hicolor.c:116: __endasm;
	ldh	a, (__current_bank) ; switch ROM bank
	push	af
	ld	a, (_hicolor_palettes_bank)
	or	a
	jr	z, 3$
	ldh	(__current_bank), a
	ld	(_rROMB0), a
3$:
	ld	(_SP_SAVE), sp ; save SP
	ld	hl, #_p_hicolor_palettes ; load address of picture palettes buffer
	ld	a, (hl+)
	ld	d, (hl)
	ld	e, a
	ldh	a, (_SCY_REG)
	swap	a
	ld	l, a
	and	#0x0f
	ld	h, a
	ld	a, #0xf0
	and	l
	ld	l, a
	add	hl, hl
	add	hl, de ; offset address by SCY * (4 * 4 * 2)
	ld	sp, hl
	rlca	; compensate odd/even line
	and	#0x20 ; if odd then start from 4-th palette; offset == 32
	or	#0b10000000 ; set auto-increment
	ld	hl, #_BCPS_REG
	ld	(hl+), a ; HL now points to BCPD
	ld	c, #(8 * 4) ; read and set the the colors that come from previous lines
2$:
	pop	de
	ld	(hl), e
	ld	(hl), d
	dec	c
	jr	nz, 2$
0$:
	ldh	a, (_STAT_REG)
	and	#0b00000010
	jr	z, 0$ ; wait for mode 3
	ldh	a, (_STAT_REG)
	ld	(_STAT_SAVE), a
	ld	a, #0b00001000
	ldh	(_STAT_REG), a
	xor	a
	ldh	(_IF_REG), a
1$:
	pop	bc ; preload the first two colors
	pop	de
	xor	a
	ldh	(_IF_REG), a
	halt	; wait for mode 0
	ld	(hl), c ; set the first two colors
	ld	(hl), b
	ld	(hl), e
	ld	(hl), d
	.rept	(4*4)-2 ; read and set four palettes except the two previously set colors
	pop	de
	ld	(hl), e
	ld	(hl), d
	.endm
	ld	a, (_hicolor_last_scanline)
	ld	c, a
	ldh	a, (_LY_REG)
	cp	c
	jr	c, 1$ ; load the next 4 palettes
	ld	a, (_STAT_SAVE)
	ldh	(_STAT_REG), a
	xor	a
	ldh	(_IF_REG), a
	ld	sp, #_SP_SAVE
	pop	hl
	ld	sp, hl ; restore SP
	pop	af
	ldh	(__current_bank), a
	ld	(_rROMB0), a
	ret
	C$gbc_hicolor.c$117$1_0$137	= .
	.globl	C$gbc_hicolor.c$117$1_0$137
;src/gbc_hicolor.c:117: }
	C$gbc_hicolor.c$117$1_0$137	= .
	.globl	C$gbc_hicolor.c$117$1_0$137
	XG$hicolor_palette_isr$0$0	= .
	.globl	XG$hicolor_palette_isr$0$0
	ret
	G$hicolor_start$0$0	= .
	.globl	G$hicolor_start$0$0
	C$gbc_hicolor.c$125$1_0$139	= .
	.globl	C$gbc_hicolor.c$125$1_0$139
;src/gbc_hicolor.c:125: void hicolor_start(const hicolor_data * p_hicolor, uint8_t hicolor_bank) NONBANKED {
;	---------------------------------
; Function hicolor_start
; ---------------------------------
_hicolor_start::
	add	sp, #-7
	ld	c, e
	ld	b, d
	ld	e, a
	C$gbc_hicolor.c$129$1_0$139	= .
	.globl	C$gbc_hicolor.c$129$1_0$139
;src/gbc_hicolor.c:129: }
	di
	C$gbc_hicolor.c$128$2_0$140	= .
	.globl	C$gbc_hicolor.c$128$2_0$140
;src/gbc_hicolor.c:128: remove_LCD(hicolor_palette_isr);
	push	bc
	push	de
	ld	de, #_hicolor_palette_isr
	call	_remove_LCD
	pop	de
	pop	bc
	ei
	C$gbc_hicolor.c$131$1_0$139	= .
	.globl	C$gbc_hicolor.c$131$1_0$139
;src/gbc_hicolor.c:131: if (!p_hicolor) return;
	ld	a, b
	or	a, c
	jp	Z,00107$
	C$gbc_hicolor.c$132$1_0$139	= .
	.globl	C$gbc_hicolor.c$132$1_0$139
;src/gbc_hicolor.c:132: hicolor_palettes_bank = hicolor_bank;
	ld	hl, #_hicolor_palettes_bank
	ld	(hl), e
	C$gbc_hicolor.c$134$2_0$141	= .
	.globl	C$gbc_hicolor.c$134$2_0$141
;src/gbc_hicolor.c:134: uint8_t bank_save = _current_bank;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
	C$gbc_hicolor.c$135$1_1$141	= .
	.globl	C$gbc_hicolor.c$135$1_1$141
;src/gbc_hicolor.c:135: if (hicolor_bank) SWITCH_ROM(hicolor_bank);
	ld	a, e
	or	a, a
	jr	Z, 00104$
	ld	a, e
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), e
00104$:
	C$gbc_hicolor.c$138$1_1$141	= .
	.globl	C$gbc_hicolor.c$138$1_1$141
;src/gbc_hicolor.c:138: p_hicolor_palettes = p_hicolor->p_palette;
	ld	hl, #0x0009
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_p_hicolor_palettes
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	C$gbc_hicolor.c$141$1_1$141	= .
	.globl	C$gbc_hicolor.c$141$1_1$141
;src/gbc_hicolor.c:141: hicolor_last_scanline = (p_hicolor->height_in_tiles > DEVICE_SCREEN_HEIGHT) ? (DEVICE_SCREEN_PX_HEIGHT - 1) : ((p_hicolor->height_in_tiles << 3) - 1);
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x12
	sub	a, l
	jr	NC, 00109$
	ld	a, #0x8f
	jr	00110$
00109$:
	ld	a, l
	add	a, a
	add	a, a
	add	a, a
	dec	a
00110$:
	ld	(#_hicolor_last_scanline),a
	C$gbc_hicolor.c$144$1_1$141	= .
	.globl	C$gbc_hicolor.c$144$1_1$141
;src/gbc_hicolor.c:144: VBK_REG = VBK_BANK_0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$gbc_hicolor.c$145$1_1$141	= .
	.globl	C$gbc_hicolor.c$145$1_1$141
;src/gbc_hicolor.c:145: set_bkg_data(0u, MIN(p_hicolor->tile_count, 256), p_hicolor->p_tiles);
	ld	hl, #0x0003
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,	(hl-)
;	spillPairReg hl
	ld	e, (hl)
	sub	a, #0x01
	jr	C, 00112$
	ld	de, #0x0100
00112$:
	ld	a, e
	ldhl	sp,	#5
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$gbc_hicolor.c$146$1_1$141	= .
	.globl	C$gbc_hicolor.c$146$1_1$141
;src/gbc_hicolor.c:146: set_bkg_tiles(0u, 0u, DEVICE_SCREEN_WIDTH, p_hicolor->height_in_tiles, p_hicolor->p_map);
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	h, a
	ld	l, #0x14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$gbc_hicolor.c$149$1_1$141	= .
	.globl	C$gbc_hicolor.c$149$1_1$141
;src/gbc_hicolor.c:149: VBK_REG = VBK_BANK_1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	C$gbc_hicolor.c$150$1_1$141	= .
	.globl	C$gbc_hicolor.c$150$1_1$141
;src/gbc_hicolor.c:150: if (p_hicolor->tile_count > 256) set_bkg_data(0u, (p_hicolor->tile_count - 256), p_hicolor->p_tiles + (256 * 16));
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	xor	a, a
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00106$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	a, #0x10
	ld	d, a
	ldhl	sp,	#5
	ld	a, (hl)
	push	de
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_bkg_data
	add	sp, #4
00106$:
	C$gbc_hicolor.c$151$1_1$141	= .
	.globl	C$gbc_hicolor.c$151$1_1$141
;src/gbc_hicolor.c:151: set_bkg_tiles(0, 0, DEVICE_SCREEN_WIDTH, p_hicolor->height_in_tiles, p_hicolor->p_attribute_map);
	ld	hl, #0x0007
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	ld	h, a
	ld	l, #0x14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$gbc_hicolor.c$152$1_1$141	= .
	.globl	C$gbc_hicolor.c$152$1_1$141
;src/gbc_hicolor.c:152: VBK_REG = VBK_BANK_0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$gbc_hicolor.c$154$1_1$141	= .
	.globl	C$gbc_hicolor.c$154$1_1$141
;src/gbc_hicolor.c:154: SWITCH_ROM(bank_save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
	C$gbc_hicolor.c$162$1_1$141	= .
	.globl	C$gbc_hicolor.c$162$1_1$141
;src/gbc_hicolor.c:162: }
	di
	C$gbc_hicolor.c$158$2_1$142	= .
	.globl	C$gbc_hicolor.c$158$2_1$142
;src/gbc_hicolor.c:158: LYC_REG = 152;
	ld	a, #0x98
	ldh	(_LYC_REG + 0), a
	C$gbc_hicolor.c$159$2_1$142	= .
	.globl	C$gbc_hicolor.c$159$2_1$142
;src/gbc_hicolor.c:159: STAT_REG = STATF_LYC;
	ld	a, #0x40
	ldh	(_STAT_REG + 0), a
	C$gbc_hicolor.c$161$2_1$142	= .
	.globl	C$gbc_hicolor.c$161$2_1$142
;src/gbc_hicolor.c:161: add_LCD(hicolor_palette_isr);
	ld	de, #_hicolor_palette_isr
	call	_add_LCD
	ei
	C$gbc_hicolor.c$163$1_1$141	= .
	.globl	C$gbc_hicolor.c$163$1_1$141
;src/gbc_hicolor.c:163: set_interrupts(IE_REG | LCD_IFLAG);
	ldh	a, (_IE_REG + 0)
	ld	c, a
	set	1, c
	ld	a, c
	call	_set_interrupts
00107$:
	C$gbc_hicolor.c$164$1_1$139	= .
	.globl	C$gbc_hicolor.c$164$1_1$139
;src/gbc_hicolor.c:164: }
	add	sp, #7
	C$gbc_hicolor.c$164$1_1$139	= .
	.globl	C$gbc_hicolor.c$164$1_1$139
	XG$hicolor_start$0$0	= .
	.globl	XG$hicolor_start$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
