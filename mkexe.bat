@echo off
cls
echo. ************************************************************
echo  *                                                          *
echo  *                                                          *
echo  *                                                          *
echo. *         Generic EXE Generator                            *
echo  *                                                          *
echo  *                                                          *
echo  *                                                          *
echo  * mkexe d:\projects\mydir deploymentname deploymentdir     *
echo  *                                                          *
echo  *                                                          *
echo. ************************************************************

if not "%1"=="" goto GO
echo.  syntax: mkexe d:\projects\mydir deploymentname deploymentdir
goto EOJ

:GO
cd %1

rar a %2.rar *.*
rar s %2.rar
del *.rar

if "%3"=="" goto EOJ
move /y %2.exe %3

:EOJ
