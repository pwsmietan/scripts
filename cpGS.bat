@echo off

echo. ********************************************
echo. *       GoScan Copy Build to Distribution  *
echo. ********************************************

if not "%1"=="" goto BOJ
:ARGHELP
echo. cpGS VersionNumber
goto EOJ

:BOJ
d:
cd\corporate\projects\goscan\builds
echo Copying to internal server:
xcopy GoScanV%1GSDPROD.exe z:\GoScan /y

rem del /q x:\buildv3\*.*
rem xcopy GoScanV%1*.exe x:\GoScan /y

:EOJ