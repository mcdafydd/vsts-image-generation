################################################################################
##  File:  Run-Antivirus.ps1
##  Team:  CI-Platform
##  Desc:  Run a full antivirus scan.
##         Run right after cleanup before we sysprep
################################################################################

Write-Host "Run antivirus"
Push-Location "C:\Program Files\Windows Defender"
# Full Scan
.\MpCmdRun.exe -Scan -ScanType 2
Pop-Location

Write-Host "Set antivirus parmeters"
Set-MpPreference -ScanAvgCPULoadFactor 5 `
                 -ExclusionPath "D:\", "C:\"