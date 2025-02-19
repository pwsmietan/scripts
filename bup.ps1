
# *******************************************************
# * Backup script v1.51									*
# *														*
# * General purpose backup script. Can backup/restore	*
# * to/from server or USB external drive.				*
# *														*
# * PWS	24-JAN-2022		Initial creation				*
# * PWS	04-JAN-2024		Improved Robocopy options		*
# * PWS	13-MAR-2024		Added <sp>ecial parameter		*
# *******************************************************

#Set-PSDebug -Trace 2
#Set-PSDebug -On
Set-PSDebug -Off
cls

if($args.count -eq 0)
{
	write-host "Backup script (bup.ps1 <target> [Source] [Destination])"
	write-host "------------------------------"
	write-host "Target:"
	write-host "s = Backup from Server to Workstation"
	write-host "w = Backup from Workstation to Server"
	write-host "lw = Backup from Linux Server to Windows Server"
	write-host "uw = Backup from USB to Workstation"
	write-host "wu = Backup from Workstation to USB"
	write-host "bu = Backup from Windows Server (bits only) to USB"
	write-host "sp = Special: Must define Source and Destination arguments!"
	exit 0
}

$SVR="192.168.1.11"
$LogFile="$ENV:Temp\roborun.log"
if(Test-Path $LogFile)
{
	write-host "Deleting $LogFile"
	remove-item $LogFile
}

write-host "There are a total of $($args.count) arguments"

if($args[0] -eq "s") 
{
	$SRC="\\$SVR\pws"
	$DST="D:"
}
elseif($args[0] -eq "w") 
{
	$SRC="D:"
	$DST="\\$SVR\pws"	
}
elseif($args[0] -eq "lw") 
{
	$SRC="\\$SVR\pws"
	$DST="D:"
}
elseif($args[0] -eq "uw") 
{
	$SRC="U:"
	$DST="D:"
}
elseif($args[0] -eq "wu") 
{
	$SRC="D:"
	$DST="U:"
}
elseif($args[0] -eq "bu") 
{
	$SRC="D:"
	$DST="U:"
	$DoBits = 1
}
elseif($args[0] -eq "sp") 
{
	if($args.count -ne 3)
	{
		write-host "Missing source/destination arguments!"
		exit -1
	}
	else
	{
		#if ([string]::IsNullOrEmpty($TGT)) 
		write-host "Special Source->Destination paths!"
		$SRC=$args[1]
		$DST=$args[2]
	}
}
else {
	write-host "Invalid arguments! :-("
	exit -1
}

write-host "SRC: $($SRC); DST: $($DST)"
#read-host "Please hit Enter ..."

# Compress with password (keep for later)
# rar u -r -pHASP Corporate Corporate\*.*
# $ROBO_OPTS="/j /nooffload /r:10 /w:5 /log+:$LogFile /mir /np"
$ROBO_OPTS="/MIR /J /NP /MT:16 /FFT /Z /XA:SO /R:3 /log:$LogFile /TEE /XJD /NP /XD AppData"

# Use an array for generic handling:
$DIRS = @("bat", "bin", "GoScan", "ScreenCaptures", "Documents", "nix", "Ham", "Paul", "Corporate")

if($DoBits -eq 1)
{
	robocopy $SRC\bits $DST\bits $ROBO_OPTS
}
else
{
	# For special directory handling simply copy source->destination:
	# For generic handling just traverse the array. 
	# Note: we expect same directory structure in both source and destination.
	foreach($d in $DIRS)
	{
		write-host "Syncing $SRC\$d -> $DST\$d"
		Invoke-Expression "robocopy $SRC\$d $DST\$d $ROBO_OPTS"
	}
}	

exit 0