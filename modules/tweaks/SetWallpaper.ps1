Function Set-Wallpaper($url)
{
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $url
    rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
}