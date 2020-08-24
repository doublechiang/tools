@echo off






cd winflash

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
    
:32BIT
echo Windows x86 Environment
echo.
cd Win32
Yafuflash2.exe -d 2 -nw -ip %1 -u admin -p cmb9.admin ..\..\%2
goto END

:64BIT
echo Windows x64 Environment
echo.
cd Win64
Yafuflash2.exe -d 2 -nw -ip %1 -u admin -p cmb9.admin ..\..\%2

:END
cd ../..
@echo on