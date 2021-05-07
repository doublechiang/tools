@echo off
set filename=
for /f "delims=" %%i in (..\rom_enc.txt) do set filename=%%i
echo.
echo BMC firmware image: %filename%
echo.
call yafuflash2.bat -vyes -cd -fb  ..\..\%filename%
