@ECHO OFF

rem This should preserve the newer copy if file exist in both locations. 
rem I use /DST and /FFT because NTFS/FAT32 timestamp differences often cause false invalid compares otherwise. 

ECHO Two way mirror between %1 and %2
if "%~1"=="" (
echo "Missing arguments!"
goto EOJ
)

:BOJ
rem Delete the zone identifiers (use Mark Rusinovich's utility from sysinternals)
rem to get around any security access issues.
streams -s -d %1
streams -s -d %2

robocopy %1 %2 /E /DST /FFT /XO /XJ
robocopy %2 %1 /E /DST /FFT /XO /XJ

:EOJ