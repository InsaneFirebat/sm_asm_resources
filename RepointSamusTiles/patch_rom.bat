
@echo off

echo Making a copy of the Super Metroid ROM
copy Super Metroid.sfc SM-Modified.sfc

echo Patching copied ROM with asar
"tools/asar" --no-title-check RepointSamusTiles.asm SM-Modified.sfc && echo Success!

PAUSE
