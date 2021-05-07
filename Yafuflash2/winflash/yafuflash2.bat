@echo off
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT

:32BIT
echo Windows x86 Environment
echo.
cd Win32
Yafuflash2.exe %*
cd ..\..
goto END

:64BIT
echo Windows x64 Environment
echo.
cd Win64
Yafuflash2.exe %*
cd ..\..

:END
@echo on
