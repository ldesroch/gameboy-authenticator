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
	.globl _init_gfx
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _vsync
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
;src/main.c:7: void init_gfx(void) {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
;src/main.c:9: set_bkg_data(0, 79u, dungeon_tiles);
	ld	de, #_dungeon_tiles
	push	de
	ld	hl, #0x4f00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:10: set_bkg_tiles(0, 0, 32u, 32u, dungeon_mapPLN0);
	ld	de, #_dungeon_mapPLN0
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:13: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:14: }
	ret
;src/main.c:17: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:19: init_gfx();
	call	_init_gfx
;src/main.c:22: while(1) {
00102$:
;src/main.c:29: vsync();
	call	_vsync
;src/main.c:31: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
