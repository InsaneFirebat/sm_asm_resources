
@echo off

echo Creating 00 and FF files
python tools/create_dummies.py ../00.sfc ../ff.sfc

echo Patching files with asar
"tools/asar" --no-title-check RepointSamusTiles.asm 00.sfc
"tools/asar" --no-title-check RepointSamusTiles.asm ff.sfc

echo Creating IPS patch
python tools/create_ips.py ../00.sfc ../ff.sfc ../RepointSamusTiles.ips

echo Cleanup
del 00.sfc ff.sfc

echo Done

PAUSE

