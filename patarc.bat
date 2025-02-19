@echo off
cls
echo. **************************************
echo. * PAT Archival Batch Script          *
echo. **************************************

if not "%1"=="" goto GO
echo. PATarc version_info
goto EOJ

:GO
d:
cd \projects\conceivetech\thales\pmaadmin\
rar a -r PATv%1.rar *.*
move PATv%1.rar ..\Archives

:EOJ