@ECHO OFF

ECHO One way mirror between %1 to %2
if "%~1"=="" (
echo "Missing arguments!"
goto EOJ
)

:BOJ
robocopy %1 %2 /MIR

:EOJ