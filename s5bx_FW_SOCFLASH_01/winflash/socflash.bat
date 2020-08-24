@echo off
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT

:32BIT
echo Windows x86 Environment
socflash.exe %*
goto END

:64BIT
echo Windows x64 Environment
socflash_x64.exe %*

:END
@echo on
