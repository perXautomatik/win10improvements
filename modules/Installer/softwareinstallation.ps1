# Installs Software the user wants
$SoftwarePackages = (
    "powertoys",
    "microsoft-windows-terminal"
    # here to go more
)


ForEach($Package in $SoftwarePackages) {
    Write-Output "Installing " + $Package + "..."
    # installs software
    # auto license accept (-y) and limited output (--limitoutput)
    choco install $Package -y --limitoutput
}
