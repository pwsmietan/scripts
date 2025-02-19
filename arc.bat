@echo off
cls
echo. **************************************
echo. *        Archival Batch Script       *
echo. **************************************

if not "%1"=="" goto ARG2
:ARGHELP
echo. arc dir product version_info
goto EOJ

:ARG2
if "%2"=="" goto ARGHELP

:GO
d:
cd %1
if %ERRORLEVEL%==0 goto MKLIB
echo. Invalid product directory!
goto EOJ

:MKLIB
del /q ..\Archives\%2V%3.rar
rem del /q setup\debug\*.*

rar a -r %2V%3.rar *.*
move %2V%3.rar ..\Archives

:EOJ


