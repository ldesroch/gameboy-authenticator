;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module example_image
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _example_image_data
	.globl b___func_example_image_palette
	.globl ___func_example_image_palette
	.globl b___func_example_image_attr
	.globl ___func_example_image_attr
	.globl b___func_example_image_map
	.globl ___func_example_image_map
	.globl b___func_example_image_tiles
	.globl ___func_example_image_tiles
	.globl b___func_example_image
	.globl ___func_example_image
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
	G$__func_example_image$0$0	= .
	.globl	G$__func_example_image$0$0
	C$example_image.c$5$0_0$134	= .
	.globl	C$example_image.c$5$0_0$134
;obj/example_image.c:5: BANKREF(example_image)
;	---------------------------------
; Function __func_example_image
; ---------------------------------
	b___func_example_image	= 255
___func_example_image::
	.local b___func_example_image 
	___bank_example_image = b___func_example_image 
	.globl ___bank_example_image 
	G$__func_example_image_tiles$0$0	= .
	.globl	G$__func_example_image_tiles$0$0
	C$example_image.c$13$1_0$139	= .
	.globl	C$example_image.c$13$1_0$139
;obj/example_image.c:13: INCBIN(example_image_tiles,   "obj/example_image.til")
;	---------------------------------
; Function __func_example_image_tiles
; ---------------------------------
	b___func_example_image_tiles	= 255
___func_example_image_tiles::
_example_image_tiles::
1$:
	.incbin "obj/example_image.til" 
2$:
	___size_example_image_tiles = (2$-1$) 
	.globl ___size_example_image_tiles 
	.local b___func_example_image_tiles 
	___bank_example_image_tiles = b___func_example_image_tiles 
	.globl ___bank_example_image_tiles 
	G$__func_example_image_map$0$0	= .
	.globl	G$__func_example_image_map$0$0
	C$example_image.c$14$1_0$141	= .
	.globl	C$example_image.c$14$1_0$141
;obj/example_image.c:14: INCBIN(example_image_map,     "obj/example_image.map")
;	---------------------------------
; Function __func_example_image_map
; ---------------------------------
	b___func_example_image_map	= 255
___func_example_image_map::
_example_image_map::
1$:
	.incbin "obj/example_image.map" 
2$:
	___size_example_image_map = (2$-1$) 
	.globl ___size_example_image_map 
	.local b___func_example_image_map 
	___bank_example_image_map = b___func_example_image_map 
	.globl ___bank_example_image_map 
	G$__func_example_image_attr$0$0	= .
	.globl	G$__func_example_image_attr$0$0
	C$example_image.c$15$1_0$143	= .
	.globl	C$example_image.c$15$1_0$143
;obj/example_image.c:15: INCBIN(example_image_attr,    "obj/example_image.atr")
;	---------------------------------
; Function __func_example_image_attr
; ---------------------------------
	b___func_example_image_attr	= 255
___func_example_image_attr::
_example_image_attr::
1$:
	.incbin "obj/example_image.atr" 
2$:
	___size_example_image_attr = (2$-1$) 
	.globl ___size_example_image_attr 
	.local b___func_example_image_attr 
	___bank_example_image_attr = b___func_example_image_attr 
	.globl ___bank_example_image_attr 
	G$__func_example_image_palette$0$0	= .
	.globl	G$__func_example_image_palette$0$0
	C$example_image.c$16$1_0$145	= .
	.globl	C$example_image.c$16$1_0$145
;obj/example_image.c:16: INCBIN(example_image_palette, "obj/example_image.pal")
;	---------------------------------
; Function __func_example_image_palette
; ---------------------------------
	b___func_example_image_palette	= 255
___func_example_image_palette::
_example_image_palette::
1$:
	.incbin "obj/example_image.pal" 
2$:
	___size_example_image_palette = (2$-1$) 
	.globl ___size_example_image_palette 
	.local b___func_example_image_palette 
	___bank_example_image_palette = b___func_example_image_palette 
	.globl ___bank_example_image_palette 
	.area _CODE_255
G$example_image_data$0_0$0 == .
_example_image_data:
	.dw #0x0166
	.db #0x12	; 18
	.dw _example_image_tiles
	.dw _example_image_map
	.dw _example_image_attr
	.dw _example_image_palette
	.area _INITIALIZER
	.area _CABS (ABS)
