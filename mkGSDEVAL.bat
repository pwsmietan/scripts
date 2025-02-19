@echo off

echo. ***********************************
echo. *       GoScan Make GSDEVAL       *
echo. ***********************************

if not "%1"=="" goto ARG2
:ARGHELP
echo. mkGSDEVAL ProductDir BuildNumber
goto EOJ

:ARG2
if "%2"=="" goto ARGHELP

:BOJ
d:
cd \Corporate\projects\GoScan\%1
rem del /q setup\release

devenv goscan.sln /build GSDEVAL
gexe %1 %2GSDEVAL

:EOJ