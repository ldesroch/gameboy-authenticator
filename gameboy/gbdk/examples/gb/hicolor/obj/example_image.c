#include <gbdk/platform.h>
#include <gbdk/incbin.h>

#pragma bank 255
BANKREF(example_image)

#include <gbc_hicolor.h>

// Generated by png2hicolorgb

// Note: filepath is relative to the working directory of the tool that is calling it (often a makefile's working directory), NOT to the file it's being included into.

INCBIN(example_image_tiles,   "obj/example_image.til")
INCBIN(example_image_map,     "obj/example_image.map")
INCBIN(example_image_attr,    "obj/example_image.atr")
INCBIN(example_image_palette, "obj/example_image.pal")

INCBIN_EXTERN(example_image_tiles)
INCBIN_EXTERN(example_image_map)
INCBIN_EXTERN(example_image_attr)
INCBIN_EXTERN(example_image_palette)

const hicolor_data example_image_data = {
    .tile_count      = 358u,
    .height_in_tiles = 18u,
    .p_tiles         = example_image_tiles,
    .p_map           = example_image_map,
    .p_attribute_map = example_image_attr,
    .p_palette       = example_image_palette
};
