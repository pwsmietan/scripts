@echo off

if not "%1"=="" goto GO
:ARGHELP
echo. deli <extension to delete recursively>
goto EOJ

:GO
forfiles /m *.%1 /s /c "cmd /c del @path"

:EOJ