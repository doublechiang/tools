@echo off
set filename=
for /f "delims=" %%i in (rom_enc.txt) do set filename=%%i
echo.
echo BMC firmware image: %filename%
echo.

cd winflash

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
    
:32BIT
echo Windows x86 Environment
echo.
cd Win32
Yafuflash2.exe -vyes -nw -ip %1 -u admin -p cmb9.admin -fb ..\..\%filename%
goto END

:64BIT
echo Windows x64 Environment
echo.
cd Win64
Yafuflash2.exe -vyes -nw -ip %1 -u admin -p cmb9.admin -fb ..\..\%filename%

:END
cd ..\..
@echo on
