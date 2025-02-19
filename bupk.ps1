
# *******************************************************
# * Backup script v1.47									*
# *														*
# * General purpose backup script. Can backup/restore	*
# * to/from server or USB external drive.				*
# *														*
# * PWS	24-JAN-2022		Initial creation				*
# *******************************************************

Set-PSDebug -Trace 2
#Set-PSDebug -Off
cls

$LogFile="D:\roborun.log"
if(Test-Path $LogFile)
{
	write-host "Deleting old log file"
	remove-item $LogFile
}

write-host "There are a total of $($args.count) arguments"
if($args.count -eq 0)
{
	write-host "Backup script (bup.ps1 <target>)"
	write-host "------------------------------"
	write-host "Target:"
	write-host "s = Backup from Server to Workstation"
	write-host "w = Backup from Workstation to Server"
	write-host "lw = Backup from Linux Server to Windows Server"
	write-host "uw = Backup from USB to Workstation"
	write-host "wu = Backup from Workstation to USB"
	write-host "bu = Backup from Windows Server (bits only) to USB"
	exit 0
}

# Point to server IP address:
$SVRIP="71.84.229.147"

if($args[0] -eq "s") {
	$SRC="\\$SVRIP\pws"
	$DST="D:"
}
elseif($args[0] -eq "w") {
	$SRC="D:"
	$DST="\\$SVRIP\pws"
}
elseif($args[0] -eq "lw") {
	$SRC="\\$SVRIP\pws"
	$DST="D:"
}
elseif($args[0] -eq "uw") {
	$SRC="U:"
	$DST="D:"
}
elseif($args[0] -eq "wu") {
	$SRC="D:"
	$DST="U:"
}
elseif($args[0] -eq "bu") {
	$SRC="D:"
	$DST="U:"
	$DoBits = 1
}
else {
	write-host ":-("
	exit -1
}

# Compress with password (keep for later)
# rar u -r -pHASP Corporate Corporate\*.*
# $ROBO_OPTS="/j /nooffload /r:10 /w:5 /log+:$LogFile /mir /np"
#$ROBO_OPTS="/j /r:10 /w:5 /mir /log+:$LogFile"
$ROBO_OPTS="/j /r:10 /w:5 /mir"
write-host Robocopy src=$SRC to dst=$DST

if ($DoBits -eq 1)
{
	robocopy $SRC\bits $DST\bits $ROBO_OPTS
}
else
{
	Invoke-Expression "robocopy $SRC\bat $DST\bat $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\bin $DST\bin $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\GoScan $DST\GoScan $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\Documents $DST\Documents $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\nix $DST\nix $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\Ham $DST\Ham $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\Paul $DST\Paul $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\Rec $DST\Rec $ROBO_OPTS"
	Invoke-Expression "robocopy $SRC\Corporate $DST\Corporate $ROBO_OPTS"
}

exit 0