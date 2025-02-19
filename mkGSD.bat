@echo off

echo. ***********************************
echo. *       GoScan Make GSD           *
echo. ***********************************

if not "%1"=="" goto ARG2
:ARGHELP
echo. mkGSD ProductDir BuildNumber
goto EOJ

:ARG2
if "%2"=="" goto ARGHELP

:BOJ
d:
cd \Corporate\projects\GoScan\Code\%1
del /q setup\release

echo. 
echo Compiling ...
echo.
devenv goscan.sln /clean
devenv goscan.sln /build GSD

echo.
echo done!
echo.
gexe %1 %2GSDPROD

:EOJ