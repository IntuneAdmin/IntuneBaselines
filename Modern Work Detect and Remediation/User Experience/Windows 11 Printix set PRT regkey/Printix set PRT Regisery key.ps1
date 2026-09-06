$RegistryPath = "HKLM:\SOFTWARE\printix.net\Printix Client"
$ValueName = "ForceAzurePrt"
$ValueData = 1

# Maak de registry key aan als deze nog niet bestaat
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Maak of wijzig de DWORD waarde
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Registry value $ValueName successfully configured to $ValueData."