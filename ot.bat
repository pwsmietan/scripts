@echo off
if not "%1"=="" goto BOJ

echo. ot "number of days previous to today"
echo. ex. ot 10 (delete files older than 10 days)
goto EOJ

:BOJ
forfiles -m *.* -d -%1 -c "cmd /c del /q @FILE"

:EOJ