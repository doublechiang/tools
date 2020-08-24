@echo off
set filename=
for /f "delims=" %%i in (..\rom.txt) do set filename=%%i
call socflash.bat -s option=x flashtype=2 if=..\%filename% count=0x4000000
