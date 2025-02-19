@echo off
echo. ***********************************
echo. *         GoScan EXE Generator    *
echo. ***********************************
PATH=%PATH%;c:\Program Files\WinRar
if not "%1"=="" goto ARG2
:ARGHELP
echo. gexe product version_info
goto EOJ

:ARG2
if "%2"=="" goto ARGHELP

:GO
d:
cd \Corporate\projects\GoScan\Code\%1\setup\release
del /q ..\..\..\Builds\%1%2.exe
rar a %1v%2.rar *.*
rar s %1v%2.rar
del *.rar
move /y %1v%2.exe ..\..\..\Builds

:EOJ
