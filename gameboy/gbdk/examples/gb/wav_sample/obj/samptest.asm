;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module samptest
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl b_play_sample2
	.globl _play_sample2
	.globl b_play_sample1
	.globl _play_sample1
	.globl _play_isr
	.globl _puts
	.globl _vsync
	.globl _set_interrupts
	.globl _joypad
	.globl _add_TIM
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
;src/samptest.c:10: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/samptest.c:13: NR52_REG = 0x80u;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/samptest.c:14: NR51_REG = 0xffu;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/samptest.c:15: NR50_REG = 0x77u;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/samptest.c:21: }
	di
;src/samptest.c:18: TMA_REG = 0xC0u, TAC_REG = 0x07u;
	ld	a, #0xc0
	ldh	(_TMA_REG + 0), a
	ld	a, #0x07
	ldh	(_TAC_REG + 0), a
;src/samptest.c:19: add_TIM(play_isr);    
	ld	de, #_play_isr
	call	_add_TIM
;src/samptest.c:20: set_interrupts(VBL_IFLAG | TIM_IFLAG);
	ld	a, #0x05
	call	_set_interrupts
	ei
;src/samptest.c:23: puts("PRESS A/B TO PLAY\n");
	ld	de, #___str_0
	call	_puts
;src/samptest.c:25: while(1)
00113$:
;src/samptest.c:27: UINT8 j = joypad();
	call	_joypad
;src/samptest.c:28: if (j & J_A) {
	bit	4, a
	jr	Z, 00110$
;src/samptest.c:29: play_sample1();
	ld	e, #b_play_sample1
	ld	hl, #_play_sample1
	call	___sdcc_bcall_ehl
;src/samptest.c:30: while (joypad() & J_A) vsync();
00101$:
	call	_joypad
	bit	4, a
	jr	Z, 00111$
	call	_vsync
	jr	00101$
00110$:
;src/samptest.c:32: if (j & J_B) {
	bit	5, a
	jr	Z, 00111$
;src/samptest.c:33: play_sample2();
	ld	e, #b_play_sample2
	ld	hl, #_play_sample2
	call	___sdcc_bcall_ehl
;src/samptest.c:34: while (joypad() & J_B) vsync();
00104$:
	call	_joypad
	bit	5, a
	jr	Z, 00111$
	call	_vsync
	jr	00104$
00111$:
;src/samptest.c:36: vsync();
	call	_vsync
;src/samptest.c:38: }
	jr	00113$
___str_0:
	.ascii "PRESS A/B TO PLAY"
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
