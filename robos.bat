@ECHO OFF

ECHO One way mirror between %1 to %2
if "%~1"=="" (
echo "Missing arguments!"
goto EOJ
)

:BOJ
rem Delete the zone identifiers (use Mark Rusinovich's utility from sysinternals)
rem to get around any security access issues.
streams -s -d %1
streams -s -d %2
robocopy %1 %2 /MIR

:EOJ