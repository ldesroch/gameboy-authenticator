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
	.globl _draw_image
	.globl _set_bkg_palette
	.globl _vsync
	.globl _cgb_pal_black
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;src/main.c:13: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:16: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00102$
;src/main.c:17: set_bkg_palette(BKGF_CGB_PAL0, CGB_ONE_PAL, cgb_pal_black);
	ld	de, #_cgb_pal_black
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
	jr	00103$
00102$:
;src/main.c:19: BGP_REG = DMG_PALETTE(DMG_BLACK, DMG_BLACK, DMG_BLACK, DMG_BLACK);
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
00103$:
;src/main.c:25: draw_image(scenery_tiles);
	ld	de, #_scenery_tiles
	push	de
	call	_draw_image
	pop	hl
;src/main.c:26: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:29: vsync();
	call	_vsync
;src/main.c:30: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00105$
;src/main.c:31: set_bkg_palette(BKGF_CGB_PAL0, CGB_ONE_PAL, scenery_palettes);
	ld	de, #_scenery_palettes
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
	jr	00108$
00105$:
;src/main.c:33: BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK);
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;src/main.c:38: while(1) {
00108$:
;src/main.c:41: vsync();
	call	_vsync
;src/main.c:43: }
	jr	00108$
_cgb_pal_black:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
