
Repoint Samus tiles (graphics) anywhere in the ROM
This clears up 4.25 BANKS of space in valuable lorom banks ($80-BF, which have a mirror to WRAM)
A pre-configured IPS is provided that repoints the graphics to banks $E0-E3

This patch was made using the disassembly at https://github.com/InsaneFirebat/sm_disassembly


To start, you will need an unheadered vanilla ROM named `Super Metroid.sfc` in the root directory with the build scripts. Run `create_data.bat` to extract the tiles to the `data` directory.

You can open `RepointSamusTiles.asm` in a text editor and configure the patch with the instructions provided within. Only the lines starting with ! at the top need editing.

Run `build_ips.bat` to get an IPS patch of the ASM. Run `patch_rom.bat` to get a copy of your ROM with the patch pre-applied.