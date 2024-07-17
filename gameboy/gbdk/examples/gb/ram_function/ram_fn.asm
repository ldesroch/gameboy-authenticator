;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module ram_fn
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _print_counter
	.globl _inc_hiram
	.globl _inc_ram
	.globl _inc_end
	.globl _inc
	.globl _memcpy
	.globl _puts
	.globl _printf
	.globl _hiramcpy
	.globl _inc_hiram_var
	.globl _inc_ram_var
	.globl _counter
	.globl _hiram_buffer
	.globl _ram_buffer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ram_buffer	=	0xd000
_hiram_buffer	=	0xffa0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_counter::
	.ds 2
_inc_ram_var::
	.ds 2
_inc_hiram_var::
	.ds 2
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
;ram_fn.c:9: void inc(void) {
;	---------------------------------
; Function inc
; ---------------------------------
_inc::
;ram_fn.c:10: counter++;
	ld	hl, #_counter
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;ram_fn.c:11: }
	ret
;ram_fn.c:13: void inc_end(void) {} 
;	---------------------------------
; Function inc_end
; ---------------------------------
_inc_end::
	ret
;ram_fn.c:32: void print_counter(void) {
;	---------------------------------
; Function print_counter
; ---------------------------------
_print_counter::
;ram_fn.c:33: printf(" Counter is %u\n", counter);
	ld	hl, #_counter
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;ram_fn.c:34: }
	ret
___str_0:
	.ascii " Counter is %u"
	.db 0x0a
	.db 0x00
;ram_fn.c:36: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;ram_fn.c:38: hiramcpy((uint8_t)&hiram_buffer, (void *)&inc, (uint8_t)object_distance(inc, inc_end));
	ld	a, #<(_inc_end)
	ld	bc, #_inc
	ld	e, c
	sub	a, e
	ld	d, a
	ld	a, #<(_hiram_buffer)
	push	de
	inc	sp
	push	bc
	push	af
	inc	sp
	call	_hiramcpy
	add	sp, #4
;ram_fn.c:39: memcpy(&ram_buffer, (void *)&inc, (uint16_t)object_distance(inc, inc_end));
	ld	a, #<(_inc_end)
	ld	d, #>(_inc_end)
	ld	bc, #_inc
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	d, a
	push	de
	ld	de, #_ram_buffer
	call	_memcpy
;ram_fn.c:42: puts("Program Start...");
	ld	de, #___str_1
	call	_puts
;ram_fn.c:43: print_counter();
	call	_print_counter
;ram_fn.c:46: puts("Call ROM");
	ld	de, #___str_2
	call	_puts
;ram_fn.c:47: inc();
	call	_inc
;ram_fn.c:48: print_counter();
	call	_print_counter
;ram_fn.c:51: puts("Call RAM direct");
	ld	de, #___str_3
	call	_puts
;ram_fn.c:52: inc_ram();
	call	_inc_ram
;ram_fn.c:53: print_counter();
	call	_print_counter
;ram_fn.c:56: puts("Call RAM indirect");
	ld	de, #___str_4
	call	_puts
;ram_fn.c:57: inc_ram_var();
	ld	hl, #_inc_ram_var
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_inc_ram_var + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
;ram_fn.c:58: print_counter();
	call	_print_counter
;ram_fn.c:61: puts("Call HIRAM direct");
	ld	de, #___str_5
	call	_puts
;ram_fn.c:62: inc_hiram();
	call	_inc_hiram
;ram_fn.c:63: print_counter();
	call	_print_counter
;ram_fn.c:66: puts("Call HIRAM indirect");
	ld	de, #___str_6
	call	_puts
;ram_fn.c:67: inc_hiram_var();
	ld	hl, #_inc_hiram_var
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_inc_hiram_var + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
;ram_fn.c:68: print_counter();
	call	_print_counter
;ram_fn.c:70: puts("The End...");
	ld	de, #___str_7
;ram_fn.c:71: }
	jp	_puts
___str_1:
	.ascii "Program Start..."
	.db 0x00
___str_2:
	.ascii "Call ROM"
	.db 0x00
___str_3:
	.ascii "Call RAM direct"
	.db 0x00
___str_4:
	.ascii "Call RAM indirect"
	.db 0x00
___str_5:
	.ascii "Call HIRAM direct"
	.db 0x00
___str_6:
	.ascii "Call HIRAM indirect"
	.db 0x00
___str_7:
	.ascii "The End..."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__counter:
	.dw #0x0000
__xinit__inc_ram_var:
	.dw _ram_buffer
__xinit__inc_hiram_var:
	.dw _hiram_buffer
	.area _CABS (ABS)
