Write-Output "Disable Aero-Shake Minimize feature"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisallowShaking" 1