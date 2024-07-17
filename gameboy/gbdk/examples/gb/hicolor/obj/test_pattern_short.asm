;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module test_pattern_short
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _test_pattern_short_data
	.globl b___func_test_pattern_short_palette
	.globl ___func_test_pattern_short_palette
	.globl b___func_test_pattern_short_attr
	.globl ___func_test_pattern_short_attr
	.globl b___func_test_pattern_short_map
	.globl ___func_test_pattern_short_map
	.globl b___func_test_pattern_short_tiles
	.globl ___func_test_pattern_short_tiles
	.globl b___func_test_pattern_short
	.globl ___func_test_pattern_short
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
	.area _CODE_255
	G$__func_test_pattern_short$0$0	= .
	.globl	G$__func_test_pattern_short$0$0
	C$test_pattern_short.c$5$0_0$134	= .
	.globl	C$test_pattern_short.c$5$0_0$134
;obj/test_pattern_short.c:5: BANKREF(test_pattern_short)
;	---------------------------------
; Function __func_test_pattern_short
; ---------------------------------
	b___func_test_pattern_short	= 255
___func_test_pattern_short::
	.local b___func_test_pattern_short 
	___bank_test_pattern_short = b___func_test_pattern_short 
	.globl ___bank_test_pattern_short 
	G$__func_test_pattern_short_tiles$0$0	= .
	.globl	G$__func_test_pattern_short_tiles$0$0
	C$test_pattern_short.c$13$1_0$139	= .
	.globl	C$test_pattern_short.c$13$1_0$139
;obj/test_pattern_short.c:13: INCBIN(test_pattern_short_tiles,   "obj/test_pattern_short.til")
;	---------------------------------
; Function __func_test_pattern_short_tiles
; ---------------------------------
	b___func_test_pattern_short_tiles	= 255
___func_test_pattern_short_tiles::
_test_pattern_short_tiles::
1$:
	.incbin "obj/test_pattern_short.til" 
2$:
	___size_test_pattern_short_tiles = (2$-1$) 
	.globl ___size_test_pattern_short_tiles 
	.local b___func_test_pattern_short_tiles 
	___bank_test_pattern_short_tiles = b___func_test_pattern_short_tiles 
	.globl ___bank_test_pattern_short_tiles 
	G$__func_test_pattern_short_map$0$0	= .
	.globl	G$__func_test_pattern_short_map$0$0
	C$test_pattern_short.c$14$1_0$141	= .
	.globl	C$test_pattern_short.c$14$1_0$141
;obj/test_pattern_short.c:14: INCBIN(test_pattern_short_map,     "obj/test_pattern_short.map")
;	---------------------------------
; Function __func_test_pattern_short_map
; ---------------------------------
	b___func_test_pattern_short_map	= 255
___func_test_pattern_short_map::
_test_pattern_short_map::
1$:
	.incbin "obj/test_pattern_short.map" 
2$:
	___size_test_pattern_short_map = (2$-1$) 
	.globl ___size_test_pattern_short_map 
	.local b___func_test_pattern_short_map 
	___bank_test_pattern_short_map = b___func_test_pattern_short_map 
	.globl ___bank_test_pattern_short_map 
	G$__func_test_pattern_short_attr$0$0	= .
	.globl	G$__func_test_pattern_short_attr$0$0
	C$test_pattern_short.c$15$1_0$143	= .
	.globl	C$test_pattern_short.c$15$1_0$143
;obj/test_pattern_short.c:15: INCBIN(test_pattern_short_attr,    "obj/test_pattern_short.atr")
;	---------------------------------
; Function __func_test_pattern_short_attr
; ---------------------------------
	b___func_test_pattern_short_attr	= 255
___func_test_pattern_short_attr::
_test_pattern_short_attr::
1$:
	.incbin "obj/test_pattern_short.atr" 
2$:
	___size_test_pattern_short_attr = (2$-1$) 
	.globl ___size_test_pattern_short_attr 
	.local b___func_test_pattern_short_attr 
	___bank_test_pattern_short_attr = b___func_test_pattern_short_attr 
	.globl ___bank_test_pattern_short_attr 
	G$__func_test_pattern_short_palette$0$0	= .
	.globl	G$__func_test_pattern_short_palette$0$0
	C$test_pattern_short.c$16$1_0$145	= .
	.globl	C$test_pattern_short.c$16$1_0$145
;obj/test_pattern_short.c:16: INCBIN(test_pattern_short_palette, "obj/test_pattern_short.pal")
;	---------------------------------
; Function __func_test_pattern_short_palette
; ---------------------------------
	b___func_test_pattern_short_palette	= 255
___func_test_pattern_short_palette::
_test_pattern_short_palette::
1$:
	.incbin "obj/test_pattern_short.pal" 
2$:
	___size_test_pattern_short_palette = (2$-1$) 
	.globl ___size_test_pattern_short_palette 
	.local b___func_test_pattern_short_palette 
	___bank_test_pattern_short_palette = b___func_test_pattern_short_palette 
	.globl ___bank_test_pattern_short_palette 
	.area _CODE_255
G$test_pattern_short_data$0_0$0 == .
_test_pattern_short_data:
	.dw #0x008c
	.db #0x07	; 7
	.dw _test_pattern_short_tiles
	.dw _test_pattern_short_map
	.dw _test_pattern_short_attr
	.dw _test_pattern_short_palette
	.area _INITIALIZER
	.area _CABS (ABS)
