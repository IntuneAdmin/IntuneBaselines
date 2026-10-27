<#
.SYNOPSIS
    Remediatie: voorkomt dat gebruikers de Global Secure Access-client uitschakelen.

.DESCRIPTION
    Zet onder:
      HKLM\SOFTWARE\Microsoft\Global Secure Access Client
        HideSignOutButton              (DWORD) = 1   -> Sign out verborgen
        HideDisablePrivateAccessButton (DWORD) = 1   -> Disable Private Access verborgen
        HideDisableButton              (DWORD) = 1   -> Disable-knop verborgen
        RestrictNonPrivilegedUsers     (DWORD) = 1   -> uit-/aanzetten vereist lokale admin (UAC)

    Effect na herstart van de GSA-client of opnieuw aanmelden.

.NOTES
    Intune Remediation: "Run this script using the logged-on credentials" = No (SYSTEM)
                        "Run script in 64-bit PowerShell"               = Yes
#>

$ErrorActionPreference = 'Stop'

$Path = 'HKLM:\SOFTWARE\Microsoft\Global Secure Access Client'
$Settings = [ordered]@{
    HideSignOutButton              = 1
    HideDisablePrivateAccessButton = 1
    HideDisableButton              = 1
    RestrictNonPrivilegedUsers     = 1
}

try {
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }

    foreach ($name in @($Settings.Keys)) {
        New-ItemProperty -Path $Path -Name $name -Value $Settings[$name] -PropertyType DWord -Force | Out-Null
    }

    # Verificatie
    $props = Get-ItemProperty -Path $Path
    foreach ($name in @($Settings.Keys)) {
        if ($props.$name -ne $Settings[$name]) { throw "$name is na remediatie $($props.$name)" }
    }

    Write-Output 'Remediatie geslaagd: alle GSA-clientinstellingen gezet'
    exit 0
}
catch {
    Write-Output "Remediatie mislukt: $($_.Exception.Message)"
    exit 1
}
