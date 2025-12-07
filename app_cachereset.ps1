Write-Output "[TASK 1] Fetching username"
$username = $env:USERNAME
Write-Output "[TASK 2] Configure username and soucepath in the runtime environment variable"
$sourcePath = "C:\Users\$username\apps\appsgui"
Write-Output "[TASK 3] Configure timestamp format in the runtime environment variable"
$timestamp = Get-Date -Format "ddMMyyyyHHmmss"
Write-Output "[TASK 4] Configure username and destination path in the runtime environment variable"
$destinationPath = "C:\Users\$username\apps\appsgui_backup.$timestamp"
Write-Output "[TASK 5] Change to source location"
Set-Location "C:\Users\$username\apps\" -Verbose
Write-Output "[TASK 6] Take backup of appsgui"
Move-Item -Path $sourcePath -Destination $destinationPath -Verbose
Write-Output "[TASK 7] Print Directory"
Get-ChildItem
Write-Output "[TASK 8] Configure Source Roaming path"
$RoamingSourcePath = "C:\Users\$username\AppData\Roaming\apps\appsgui"
Write-Output "[TASK 9] Configure Destination Roaming path"
$RoamingDestinationPath = "C:\Users\$username\AppData\Roaming\apps\appsgui_backup.$timestamp"
Write-Output "[TASK 10] Change to source roaming location"
Set-Location "C:\Users\$username\AppData\Roaming\apps\" -Verbose
Write-Output "[TASK 11] Take backup of appsgui in roaming location"
Move-Item -Path $RoamingSourcePath -Destination $RoamingDestinationPath -Verbose
Write-Output "[TASK 12] Print Directory"
Get-ChildItem
Write-Output "[TASK 13] Uninstall Java"
Set-Location "C:\Users\$username\apps\" -Verbose
Write-Output "[TASK 14] clearcache Java"
javaws -clearcache
Write-Output "[TASK 15] Uninstall Javaws apps"
javaws -uninstall
Write-Output "[TASK 16] Java Clear Completed"
