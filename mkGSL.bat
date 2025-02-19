@echo off

echo. ***********************************
echo. *       GoScan Make GSL           *
echo. ***********************************

if not "%1"=="" goto BOJ
:ARGHELP
echo. mkGSL ProductDir BuildNumber
goto EOJ

:ARG2
if "%2"=="" goto ARGHELP

:BOJ
d:
cd \Corporate\projects\GoScan\%1
rem del /q setup\release

devenv goscan.sln /build GSL
gexe %1 %2GSLPROD

