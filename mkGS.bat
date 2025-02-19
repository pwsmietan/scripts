@echo off
cls
echo. ***********************************
echo. *       GoScan Make ALL Products  *
echo. ***********************************

if not "%1"=="" goto ARG2
:ARGHELP
echo. mkGS ProductDir VersionNumber
goto EOJ

:ARG2
if "%2"=="" goto ARGHELP

:BOJ
d:
del /q D:\Corporate\projects\GoScan\Code\Builds\%1V%2*.exe

call mkGSD %1 %2
call mkGSDEVAL %1 %2
call mkGSL %1 %2
call mkGSLIT %1 %2

:EOJ