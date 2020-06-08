# Install POSH-Git and Oh-my-posh
Write-Host "Installing Posh Git..."
Install-Module posh-git -Scope CurrentUser

Write-Host "Installing Oh my posh..."
Install-Module oh-my-posh -Scope CurrentUser

Write-Host "Setting Powershell profile to oh-my-posh..."
# add Theme and Modules to profile file
Add-Content $PROFILE "Import-Module posh-git `nImport-Module oh-my-posh `nSet-Theme Paradox"
