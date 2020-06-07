# Installs a lot of Powershell Modules
# https://github.com/EvotecIT/PSWritePDF
# https://github.com/EvotecIT/PSBlackListChecker
# https://github.com/EvotecIT/PSWriteColor
# https://github.com/ralish/PSWinGlue

# read Software from file
$lines = Get-Content -Path .mypsmodules

$powershellModules = @()

# parse to modules array
ForEach ($line in $lines) {
    $powershellModules += $line;
}

$count = $SoftwarePackages.Length;
Write-Output "Installing $count Powershell Module(s)..."

$failedModules = @();

ForEach ($module in $powershellModules) {
    Write-Host "Installing Module " $module
    Install-Module $module -Force

    # Check If Module installed
    if (Get-Module -Name "$module") {
        Write-Host "Module "$module" exists"
    } 
    else {
        Write-Host "Module \"$module"\ does not exist";
        $failedModules += $module;
    }
}

Write-Host "Failed to install the following Modules..."
ForEach ($module in $failedModules) {
    Write-Host $module;
}

Read-Host -Prompt "Press Enter to exit"