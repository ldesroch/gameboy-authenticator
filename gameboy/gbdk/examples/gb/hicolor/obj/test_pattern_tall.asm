;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module test_pattern_tall
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _test_pattern_tall_data
	.globl b___func_test_pattern_tall_palette
	.globl ___func_test_pattern_tall_palette
	.globl b___func_test_pattern_tall_attr
	.globl ___func_test_pattern_tall_attr
	.globl b___func_test_pattern_tall_map
	.globl ___func_test_pattern_tall_map
	.globl b___func_test_pattern_tall_tiles
	.globl ___func_test_pattern_tall_tiles
	.globl b___func_test_pattern_tall
	.globl ___func_test_pattern_tall
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
	G$__func_test_pattern_tall$0$0	= .
	.globl	G$__func_test_pattern_tall$0$0
	C$test_pattern_tall.c$5$0_0$134	= .
	.globl	C$test_pattern_tall.c$5$0_0$134
;obj/test_pattern_tall.c:5: BANKREF(test_pattern_tall)
;	---------------------------------
; Function __func_test_pattern_tall
; ---------------------------------
	b___func_test_pattern_tall	= 255
___func_test_pattern_tall::
	.local b___func_test_pattern_tall 
	___bank_test_pattern_tall = b___func_test_pattern_tall 
	.globl ___bank_test_pattern_tall 
	G$__func_test_pattern_tall_tiles$0$0	= .
	.globl	G$__func_test_pattern_tall_tiles$0$0
	C$test_pattern_tall.c$13$1_0$139	= .
	.globl	C$test_pattern_tall.c$13$1_0$139
;obj/test_pattern_tall.c:13: INCBIN(test_pattern_tall_tiles,   "obj/test_pattern_tall.til")
;	---------------------------------
; Function __func_test_pattern_tall_tiles
; ---------------------------------
	b___func_test_pattern_tall_tiles	= 255
___func_test_pattern_tall_tiles::
_test_pattern_tall_tiles::
1$:
	.incbin "obj/test_pattern_tall.til" 
2$:
	___size_test_pattern_tall_tiles = (2$-1$) 
	.globl ___size_test_pattern_tall_tiles 
	.local b___func_test_pattern_tall_tiles 
	___bank_test_pattern_tall_tiles = b___func_test_pattern_tall_tiles 
	.globl ___bank_test_pattern_tall_tiles 
	G$__func_test_pattern_tall_map$0$0	= .
	.globl	G$__func_test_pattern_tall_map$0$0
	C$test_pattern_tall.c$14$1_0$141	= .
	.globl	C$test_pattern_tall.c$14$1_0$141
;obj/test_pattern_tall.c:14: INCBIN(test_pattern_tall_map,     "obj/test_pattern_tall.map")
;	---------------------------------
; Function __func_test_pattern_tall_map
; ---------------------------------
	b___func_test_pattern_tall_map	= 255
___func_test_pattern_tall_map::
_test_pattern_tall_map::
1$:
	.incbin "obj/test_pattern_tall.map" 
2$:
	___size_test_pattern_tall_map = (2$-1$) 
	.globl ___size_test_pattern_tall_map 
	.local b___func_test_pattern_tall_map 
	___bank_test_pattern_tall_map = b___func_test_pattern_tall_map 
	.globl ___bank_test_pattern_tall_map 
	G$__func_test_pattern_tall_attr$0$0	= .
	.globl	G$__func_test_pattern_tall_attr$0$0
	C$test_pattern_tall.c$15$1_0$143	= .
	.globl	C$test_pattern_tall.c$15$1_0$143
;obj/test_pattern_tall.c:15: INCBIN(test_pattern_tall_attr,    "obj/test_pattern_tall.atr")
;	---------------------------------
; Function __func_test_pattern_tall_attr
; ---------------------------------
	b___func_test_pattern_tall_attr	= 255
___func_test_pattern_tall_attr::
_test_pattern_tall_attr::
1$:
	.incbin "obj/test_pattern_tall.atr" 
2$:
	___size_test_pattern_tall_attr = (2$-1$) 
	.globl ___size_test_pattern_tall_attr 
	.local b___func_test_pattern_tall_attr 
	___bank_test_pattern_tall_attr = b___func_test_pattern_tall_attr 
	.globl ___bank_test_pattern_tall_attr 
	G$__func_test_pattern_tall_palette$0$0	= .
	.globl	G$__func_test_pattern_tall_palette$0$0
	C$test_pattern_tall.c$16$1_0$145	= .
	.globl	C$test_pattern_tall.c$16$1_0$145
;obj/test_pattern_tall.c:16: INCBIN(test_pattern_tall_palette, "obj/test_pattern_tall.pal")
;	---------------------------------
; Function __func_test_pattern_tall_palette
; ---------------------------------
	b___func_test_pattern_tall_palette	= 255
___func_test_pattern_tall_palette::
_test_pattern_tall_palette::
1$:
	.incbin "obj/test_pattern_tall.pal" 
2$:
	___size_test_pattern_tall_palette = (2$-1$) 
	.globl ___size_test_pattern_tall_palette 
	.local b___func_test_pattern_tall_palette 
	___bank_test_pattern_tall_palette = b___func_test_pattern_tall_palette 
	.globl ___bank_test_pattern_tall_palette 
	.area _CODE_255
G$test_pattern_tall_data$0_0$0 == .
_test_pattern_tall_data:
	.dw #0x01b2
	.db #0x19	; 25
	.dw _test_pattern_tall_tiles
	.dw _test_pattern_tall_map
	.dw _test_pattern_tall_attr
	.dw _test_pattern_tall_palette
	.area _INITIALIZER
	.area _CABS (ABS)
