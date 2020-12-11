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
Yafuflash2.exe -vyes -nw -ip %1 -u admin -p %2 -fb -pipmi -pauth -pnet -psnmp -pssh -pkvm -pntp -psel ..\..\%filename%
goto END

:64BIT
echo Windows x64 Environment
echo.
cd Win64
Yafuflash2.exe -vyes -nw -ip %1 -u admin -p %2 -fb -pipmi -pauth -pnet -psnmp -pssh -pkvm -pntp -psel ..\..\%filename%

:END
cd ..\..
@echo on
