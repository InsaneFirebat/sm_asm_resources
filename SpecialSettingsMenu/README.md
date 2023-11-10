# Special Settings Menu ASM

https://github.com/InsaneFirebat/sm_asm_resources/blob/main/SpecialSettingsMenu

## Edit Icon Cancel Setting

This resource is intended to help hackers replace the Icon Cancel menu setting with a toggle of their own. You can easily rename the setting and its enable/disable options. The address to modify can also be changed. If you're also replacing the Moon Walk setting, there is some optional code to erase the extra line of text below the option.

## Notes

Always use an UNHEADERED (UH) rom

Two separate ASM files provided for use with xkas or asar v1.81

## Thanks

Creation of this resource relied heavily on P.JBoy's bank logs

https://patrickjohnston.org/bank/82

## How to Use

Start by opening the desired ASM file (choose asar or xkas version). There are a few things for you to customize, indicated by the comments that stick out to the right. Everything you need is in the first half of the file.

If you're using a different address for your setting, be sure to edit `SpecialSettingsAddressTable` as well.

For asar, a macro is provided that will automatically produce the upper and lower bytes of each character. If using xkas, you'll need to edit the upper and lower text so that they match.
