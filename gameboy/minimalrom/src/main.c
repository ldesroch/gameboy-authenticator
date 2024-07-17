#include <gb/gb.h>
#include <gb/drawing.h>
#include <gbdk/console.h>
#include <stdint.h>
#include <stdio.h>

#include <gbdk/platform.h>
#include <gb/drawing.h>

#include <res/test.h>

#include "main.h"

char *digits = "0123456789ABCDEF";
void printbyte(BYTE number)
{
    putchar(digits[(UBYTE)number / 16]);
    putchar(digits[(UBYTE)number % 16]);
}

#define CGB_BKG_PAL_0 0u
#define CGB_ONE_PAL 1u
const palette_color_t cgb_pal_black[] = {RGB_BLACK, RGB_BLACK, RGB_BLACK, RGB_BLACK};

uint8_t g_key_buffer[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
uint8_t g_key_buffer_cursor = 0;
uint8_t state = 0;

uint8_t key_buffer_cursor_safe_move(void)
{
    return (++g_key_buffer_cursor) % 10;
}

void key_buffer_push(uint8_t key)
{
    g_key_buffer[key_buffer_cursor_safe_move()] = key;
}

uint8_t key_buffer_get_last(void)
{
    return g_key_buffer[g_key_buffer_cursor];
}

void key_buffer_replay(void)
{
    uint8_t j;
    uint8_t key;
    for (j = 0; j < 10; ++j)
    {

        key = key_buffer_cursor_safe_move();
        if (key & J_UP)
        {
            line(10, 30, 10, 40);
        }
        if (key & J_DOWN)
        {
            line(20, 30, 20, 40);
        }
        if (key & J_LEFT)
        {
            line(30, 30, 30, 40);
        }
        if (key & J_RIGHT)
        {
            line(40, 30, 40, 40);
        }
        if (key & J_A)
        {
            line(50, 30, 50, 40);
        }
        if (key & J_B)
        {
            line(60, 30, 60, 40);
        }
        delay(200);
        // draw_image(test_tiles);
    }
}

uint8_t key_buffer_is_konami_code(void)
{
    return J_UP & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_UP & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_DOWN & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_DOWN & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_LEFT & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_RIGHT & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_LEFT & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_RIGHT & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_B & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_A & g_key_buffer[key_buffer_cursor_safe_move()];
}
uint8_t key_buffer_is_test_code(void)
{
    return J_A & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_A & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_B & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_B & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_UP & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_UP & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_DOWN & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_DOWN & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_RIGHT & g_key_buffer[key_buffer_cursor_safe_move()] &&
           J_LEFT & g_key_buffer[key_buffer_cursor_safe_move()];
}

uint8_t rnd[512] = {3, 202, 128, 74, 86, 206, 237, 73, 251, 4, 131, 48, 2, 228, 108, 159, 141, 138, 137, 7, 165, 241, 81, 142, 29, 183, 81, 143, 96, 176, 29, 7, 96, 215, 27, 30, 146, 138,
                    138, 197, 193, 248, 56, 208, 151, 210, 12, 48, 227, 10, 237, 109, 183, 184, 104, 102, 117, 83, 75, 19, 113, 236, 38, 147, 100, 28, 162, 195, 17, 91, 136, 94, 241, 86, 174,
                    219, 145, 237, 33, 74, 106, 132, 199, 92, 82, 182, 158, 127, 172, 252, 53, 111, 154, 228, 248, 60, 216, 121, 59, 11, 126, 29, 171, 60, 146, 29, 1, 186, 249, 242, 108, 104,
                    228, 44, 65, 231, 66, 108, 25, 77, 232, 1, 112, 81, 123, 164, 4, 207, 181, 221, 110, 73, 60, 93, 238, 103, 235, 135, 177, 58, 165, 205, 67, 211, 116, 171, 68, 116, 127, 85,
                    165, 173, 150, 240, 199, 198, 77, 58, 134, 116, 205, 228, 164, 219, 229, 177, 251, 70, 1, 191, 53, 220, 251, 50, 154, 188, 99, 235, 91, 35, 180, 4, 115, 167, 111, 142, 13,
                    49, 7, 218, 47, 226, 246, 39, 127, 30, 57, 112, 244, 239, 66, 193, 106, 96, 53, 0, 239, 240, 4, 177, 85, 69, 93, 106, 82, 232, 238, 77, 189, 225, 81, 204, 203, 253, 168,
                    45, 125, 132, 85, 14, 44, 74, 213, 217, 132, 24, 47, 38, 195, 213, 188, 8, 201, 150, 224, 251, 43, 218, 58, 106, 34, 49, 167, 55, 96, 191, 41, 140, 70, 31, 163, 173, 191,
                    188, 49, 142, 157, 178, 163, 60, 187, 68, 95, 185, 232, 72, 172, 21, 209, 191, 119, 72, 3, 177, 109, 153, 210, 37, 103, 102, 158, 33, 180, 21, 131, 244, 27, 102, 156, 109,
                    154, 200, 174, 173, 101, 211, 119, 79, 74, 5, 124, 122, 109, 9, 249, 196, 120, 241, 107, 30, 141, 102, 46, 146, 65, 88, 147, 199, 178, 185, 110, 196, 217, 153, 192, 83, 89,
                    187, 31, 13, 9, 120, 38, 63, 138, 133, 179, 248, 183, 45, 68, 181, 131, 36, 14, 78, 173, 244, 90, 35, 196, 71, 49, 35, 123, 96, 129, 231, 169, 25, 54, 194, 202, 67, 42, 159,
                    8, 76, 93, 156, 50, 205, 213, 209, 204, 163, 235, 115, 162, 24, 222, 187, 129, 62, 107, 42, 160, 46, 215, 85, 53, 159, 136, 185, 113, 41, 60, 174, 205, 17, 36, 192, 242, 92,
                    146, 102, 182, 73, 211, 113, 148, 17, 95, 10, 166, 17, 19, 131, 26, 231, 58, 116, 55, 210, 75, 49, 40, 55, 253, 184, 144, 255, 158, 251, 102, 237, 239, 199, 104, 233, 108, 127,
                    111, 191, 41, 96, 67, 17, 249, 143, 214, 247, 38, 205, 251, 139, 238, 79, 62, 193, 67, 198, 5, 255, 52, 183, 160, 244, 121, 148, 233, 132, 138, 134, 14, 60, 125, 27, 148, 200,
                    109, 188, 126, 46, 93, 26, 48, 19, 248, 163, 220, 55, 2, 252, 194, 215, 161, 83, 52, 145, 119, 58};

void gen_and_print_hash_challenge_response(void)
{
    uint8_t hash[3] = {0, 0, 0};
    volatile uint8_t key = 0;
    uint16_t index = 0;

    volatile uint16_t buff = 0;

    // read keys
    uint8_t keys[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    keys[0] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[1] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[2] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[3] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[4] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[5] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[6] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[7] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[8] = g_key_buffer[key_buffer_cursor_safe_move()];
    keys[9] = g_key_buffer[key_buffer_cursor_safe_move()];

    putchar('\n');
    do
    {
        key = keys[index % 10];
        buff = hash[index % 3] ^ (rnd[index] ^ key);
        hash[index % 3] = (uint8_t)buff;
    } while (++index < 512);

    index = 0;
    putchar('\n');
    do
    {
        printbyte(hash[index]);
        putchar(' ');
    } while (++index < 3);
    putchar('\n');
    putchar('\n');
    printf("Bye !");
}

void test_frequency(void)
{
    uint16_t index = 0;

    do
    {
        printbyte(0x80 | (index * 8 >> 5));
        putchar('-');
        printbyte(index * 8 << 3);
        putchar('\n');

        NR11_REG = 0x10;
        NR12_REG = 0xF3;
        NR13_REG = index * 8 << 3;
        NR14_REG = 0x80 | (index * 8 >> 5);
        delay(300);
    } while (++index < 32);
}

void test_printbyte(void)
{
    printbyte(0x00);
    putchar('\n');
    printbyte(0x01);
    putchar('\n');
    printbyte(0x0A);
    putchar('\n');
    printbyte(0x0F);
    putchar('\n');
    printbyte(0x10);
    putchar('\n');
    printbyte(0x11);
    putchar('\n');
    printbyte(0x1F);
    putchar('\n');
    printbyte(0xA0);
    putchar('\n');
    printbyte(0xA1);
    putchar('\n');
    printbyte(0xAA);
    putchar('\n');
    printbyte(0xAF);
    putchar('\n');
    printbyte(0xFF);
    putchar('\n');
}

void main(void)
{
    uint8_t i = 0;
    uint8_t j = 0;
    uint8_t key = 0;
    uint8_t oldkey = 0;
    uint8_t val[17] = {
        10, 10, 150, 134,
        80, 10, 80, 134,
        150, 10, 10, 134,
        150, 72, 10, 72};

    // Set the screen to black via the palettes to hide the image draw
    if (_cpu == CGB_TYPE)
    {
        set_bkg_palette(BKGF_CGB_PAL0, CGB_ONE_PAL, cgb_pal_black);
    }
    else
    {
        BGP_REG = DMG_PALETTE(DMG_BLACK, DMG_BLACK, DMG_BLACK, DMG_BLACK);
    }

    // Display the image
    // This will automatically switch to APA graphics mode
    // and install it's start and mid-frame ISRs.
    // draw_image(test_tiles);
    SHOW_BKG;

    // Then load the palettes at the start of a new frame
    vsync();
    if (_cpu == CGB_TYPE)
    {
        set_bkg_palette(BKGF_CGB_PAL0, CGB_ONE_PAL, test_palettes);
    }
    else
    {
        BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK);
    }

    i = 0;

    // Loop forever

    //  Game main loop processing goes here
    //  Done processing, yield CPU and wait for start of next frame

    // NR52_REG = 0b10000000;
    NR52_REG = 0x80;
    NR51_REG = 0x11;
    NR50_REG = 0x77;

    NR11_REG = 0x10;
    NR12_REG = 0xF3;
    NR13_REG = rnd[2];
    NR14_REG = 0x85;
    // i = --i % 255;

    // test_frequency();

    printf("Please enter unlock code\n");

    while (1)
    {
        // draw_image(test_tiles);

        //
        // vsync();
        key = joypad();

        // NR10_REG = 0x1E;
        if (key & J_UP && !(oldkey & J_UP))
        {
            // line(10, 10, 10, 20);
            printf("UP ");
            key_buffer_push(key);
        }
        if (key & J_DOWN && !(oldkey & J_DOWN))
        {
            // line(20, 10, 20, 20);
            printf("Down ");
            key_buffer_push(key);
        }
        if (key & J_LEFT && !(oldkey & J_LEFT))
        {
            // line(30, 10, 30, 20);
            printf("Left ");
            key_buffer_push(key);
        }
        if (key & J_RIGHT && !(oldkey & J_RIGHT))
        {
            // line(40, 10, 40, 20);
            printf("Right ");
            key_buffer_push(key);
        }
        if (key & J_A && !(oldkey & J_A))
        {
            // line(50, 10, 50, 20);
            printf("A ");
            key_buffer_push(key);
        }
        if (key & J_B && !(oldkey & J_B))
        {
            printf("B ");
            key_buffer_push(key);
            // line(60, 10, 60, 20);
        }
        if (key & J_SELECT && !(oldkey & J_SELECT))
        {
            printf("Select ");
            key_buffer_push(key);
            // line(60, 10, 60, 20);
        }
        if (key & J_START && !(oldkey & J_START))
        {
            printf("Start ");
            if (state & 0x01)
            {
                gen_and_print_hash_challenge_response();
                state = 0;
            }
            else if (key_buffer_is_konami_code())
            {
                state = 0x01;
                printf("\nUnlocked !\n");
                printf("\nPlease enter challenge : \n");
                NR11_REG = 0x10;
                NR12_REG = 0xF3;
                NR13_REG = rnd[2];
                NR14_REG = 0x85;
            }
            else if (key_buffer_is_test_code())
            {
                printf("\nTesting frequency !\n");
                test_frequency();
            }
            key_buffer_push(key);

            // line(60, 10, 60, 20);
        }

        if (key & J_START && key & J_A)
        {
            // Checksum
            j = 0;
            do
            {
            } while (j++ < 0xFF);
        }

        oldkey = key;
        delay(20);
        vsync();
    }
}
