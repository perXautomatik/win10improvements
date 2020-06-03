# Disabling Location Tracking
Write-Output "Disabling Location Tracking"
$SensorState = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
$LocationConfig = "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
If (!(Test-Path $SensorState)) {
    New-Item $SensorState
}
Set-ItemProperty $SensorState SensorPermissionState -Value 0 
If (!(Test-Path $LocationConfig)) {
    New-Item $LocationConfig
}
Set-ItemProperty $LocationConfig Status -Value 0 
    
#Disables People icon on Taskbar
Write-Output "Disabling People icon on Taskbar"
$People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
If (Test-Path $People) {
    Set-ItemProperty $People -Name PeopleBand -Value 0
}