@echo off
cls
echo. ***********************************
echo. *         PAT EXE Generator       *
echo. ***********************************

if not "%1"=="" goto GO
echo. PAT version_info
goto EOJ

:GO
d:
cd \projects\conceivetech\thales\pmaadmin\setup\debug
rar a PATv%1.rar *.*
rar s PATv%1.rar
del *.rar
move /y PATv%1.exe l:\localuser\thalespma\PAT
cd ..\..

:EOJ
