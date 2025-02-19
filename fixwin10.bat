
sfc /scannow
DISM.exe /Online /Cleanup-image /Scanhealth
DISM.exe /Online /Cleanup-image /Restorehealth
type C:\windows\logs\DISM\dism.log
