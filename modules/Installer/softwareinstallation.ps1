# Installs Software the user wants

# read Software from file
$lines = Get-Content -Path .mysoftware

# parse to softare package array
ForEach ($line in $lines) {
    $SoftwarePackages += $line;
}

$SoftwarePackages = @()

$count = $SoftwarePackages.Length;
Write-Output "Installing $count Software Packages..."

ForEach($Package in $SoftwarePackages) {
    Write-Output "Installing " + $Package + "..."
    # installs software
    # auto license accept (-y) and limited output (--limitoutput)
    choco install $Package -y --limitoutput
}
