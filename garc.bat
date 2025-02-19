@echo off
cls
echo. **************************************
echo. * GoScan Archival Batch Script       *
echo. **************************************

if not "%1"=="" goto ARG2
:ARGHELP
echo. garc product version_info
goto EOJ

:ARG2
if "%2"=="" goto ARGHELP

:GO
d:
cd \Corporate\projects\GoScan\Code\%1
if %ERRORLEVEL%==0 goto MKLIB
echo. Invalid product directory!
goto EOJ

:MKLIB
rem Housekeeping!
del /q ..\Archives\%1V%2.rar
rd /q /s obj
rd /q /s setup\debug
rd /q /s setup\release
rd /q /s bin\debug
rd /q /s bin\release

rem Make RAR exclude Git and recursively add everything!
rar a -x.git -r %1v%2.rar *.*
move %1v%2.rar ..\Archives

:EOJ


