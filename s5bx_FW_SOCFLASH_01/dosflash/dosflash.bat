@echo off
SED "s/^/SET filename=/" ../ROM.TXT > FILE1.BAT
CALL FILE1.BAT
DEL FILE1.BAT
socflash.exe -s option=x flashtype=2 if=../%filename% count=0x4000000
