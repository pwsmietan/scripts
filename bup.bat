@echo off
rem *****************************************************
rem * Backup script v1.0								*
rem * 24-JAN-2022	PWS									*
rem *****************************************************
cls
d:
cd\

rem Robocopy will append to our log file:
set LogFile=D:\roborun.log
if exist %LogFile% (del %LogFile%)

:Help
if "%1"==""  (
	echo ^Backup script ^(bup.bat ^<target^>^)
	echo ^------------------------------
	echo ^Target:
	echo ^s = Backup to Server from Workstation
	echo ^w = Backup to Workstation from Server
	echo ^u = Backup to USB External drive from Workstation
	
	exit /b 0
)

rem s -> Server
if "%1"=="s" goto ToServer
rem w -> Workstation
if "%1"=="w" goto ToWorkstation
rem u -> External USB Drive
if "%1"=="u" goto ToUSB

goto Help

rem Compress with password (keep for later)
rem rar u -r -pHASP Corporate Corporate\*.*

:ToServer
echo Robocopy workstation to server...
robocopy Paul \\vito\d$\Paul /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy bat \\vito\d$\bat /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy bin \\vito\d$\bin /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy GoScan \\vito\d$\GoScan /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy Documents \\vito\d$\Documents /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy Ham \\vito\d$\Ham /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy scripts \\vito\d$\scripts /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy Rec \\vito\g$\Rec /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy misc \\vito\d$\misc /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy Corporate \\vito\d$\Corporate /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy E:\SysImg \\vito\g$\SysImg /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile%

exit /b 0

:ToWorkstation
echo Robocopy server to workstation
robocopy \\vito\d$\Paul Paul /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\bat bat /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\bin bin /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\GoScan GoScan /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\Documents Documents /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\Ham Ham /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\scripts scripts /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\g$\Rec Rec /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\misc misc /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\d$\Corporate Corporate /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy \\vito\g$\SysImg E:\SysImg /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile%

exit /b 0

:ToUSB
echo Robocopy workstation to USB
robocopy Paul U:\Paul /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy bat U:\bat /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy bin U:\bin /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy GoScan U:\GoScan /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy Documents U:\Documents /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy Ham U:\Ham /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy scripts U:\scripts /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy E:\Rec U:\Rec /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy misc U:\misc /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy Corporate U:\Corporate /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile% /mir
robocopy E:\SysImg U:\SysImg /j /nooffload /r:10 /w:5 /reg /mt:8 /log+:%LogFile%

exit /b 0