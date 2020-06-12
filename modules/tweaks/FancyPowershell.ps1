# Install POSH-Git and Oh-my-posh
Write-Host "Installing Posh Git..."
Install-Module posh-git -Scope CurrentUser

Write-Host "Installing Oh my posh..."
Install-Module oh-my-posh -Scope CurrentUser


$themes = (
    [PSCustomObject]@{
        'Name' = 'Agnoster'
    },
    [PSCustomObject]@{
        'Name' = 'Paradox'
    },
    [PSCustomObject]@{
        'Name' = 'Sorin'
    },
    [PSCustomObject]@{
        'Name' = 'Darkblood'
    },
    [PSCustomObject]@{
        'Name' = 'Avit'
    },
    [PSCustomObject]@{
        'Name' = 'Honukai'
    }, 
    [PSCustomObject]@{
        'Name' = 'Fish'
    }, 
    [PSCustomObject]@{
        'Name' = 'Robbyrussell'
    }, 
    [PSCustomObject]@{
        'Name' = 'Pararussel'
    },
    [PSCustomObject]@{
        'Name' = 'Material'
    },
    [PSCustomObject]@{
        'Name' = 'Star'
    },
    [PSCustomObject]@{
        'Name' = 'Zash'
    }
)

Write-Host ""
Write-Host "----------------------"
Write-Host "Available Themes"
Write-Host "----------------------"

For ($i = 0; $i -le ($themes.Length - 1); $i++) {
    Write-Host(($i + 1).ToString() + " " + ($themes.Name)[$i])
}

$themeChoice = Read-Host '>'
$choiceNum = 0
if (($themeChoice.Length -ne 0) -and ($themeChoice -match '^\d+$')) {
    if (($themeChoice -gt 0) -and ($themeChoice -le $themes.Length)) {
        $choiceNum = ($themeChoice - 1)
    }
}
$choice = $themes[$choiceNum]

Write-Host "Setting Powershell profile to oh-my-posh..."
# add Theme and Modules to profile file
$theme = $choice.Name;
Add-Content $PROFILE "Import-Module posh-git `nImport-Module oh-my-posh `nSet-Theme $theme"
