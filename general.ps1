
# From Windows10Debloater by Sycnex
# This will self elevate the script so with a UAC prompt since this script needs to be run as an Administrator in order to function properly.
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
    Start-Sleep 1
    Write-Host "                                               3"
    Start-Sleep 1
    Write-Host "                                               2"
    Start-Sleep 1
    Write-Host "                                               1"
    Start-Sleep 1
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}
# End self elevate



# This will install chocolatey packamanager
Function Start-ChocoInstall {
    [CmdletBinding()]
    param (
        
    )
    
    Write-Verbose -Message ("Starting Chocolatey Installation")

    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

}

function Start-SoftwareInstallation  {

    [CmdletBinding()]
    param()

    Write-Verbose -Message ("Starting Software Installation")

    $SoftwarePackages = @("")

    ForEach ($Software in $SoftwarePackages) {
        Write-Output ""

    }
    
}













Write-Host -ForegroundColor Green "Starting Setting up a performant Windows 10 Machine!"
Write-Host



Write-Host -ForegroundColor Yellow "Installing Chocolatey...."
[Diagnostics.Process]::Start("powershell.exe",".\installchoco.ps1")
Write-Host -ForegroundColor Green "Chocolatey successfully installed."
Write-Host

Write-Host -ForegroundColor Yellow "Starting Debloat...."