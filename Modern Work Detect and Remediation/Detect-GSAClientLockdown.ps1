<#
.SYNOPSIS
    Detectie: controleert of gebruikers de Global Secure Access-client niet kunnen uitschakelen.

.DESCRIPTION
    Controleert onder:
      HKLM\SOFTWARE\Microsoft\Global Secure Access Client
        HideSignOutButton              (DWORD) = 1
        HideDisablePrivateAccessButton (DWORD) = 1
        HideDisableButton              (DWORD) = 1
        RestrictNonPrivilegedUsers     (DWORD) = 1

    Exit 0 = compliant, exit 1 = remediatie nodig.

.NOTES
    Intune Remediation: "Run this script using the logged-on credentials" = No (SYSTEM)
                        "Run script in 64-bit PowerShell"               = Yes
#>

$Path = 'HKLM:\SOFTWARE\Microsoft\Global Secure Access Client'
$Settings = [ordered]@{
    HideSignOutButton              = 1
    HideDisablePrivateAccessButton = 1
    HideDisableButton              = 1
    RestrictNonPrivilegedUsers     = 1
}

try {
    if (-not (Test-Path $Path)) {
        Write-Output "Niet compliant: registersleutel ontbreekt (GSA-client geïnstalleerd?)"
        exit 1
    }

    $props = Get-ItemProperty -Path $Path -ErrorAction Stop
    $afwijkend = foreach ($name in @($Settings.Keys)) {
        if ($props.$name -ne $Settings[$name]) { "$name=$($props.$name)" }
    }

    if ($afwijkend) {
        Write-Output "Niet compliant: $($afwijkend -join ', ')"
        exit 1
    }

    Write-Output 'Compliant: alle GSA-clientinstellingen staan goed'
    exit 0
}
catch {
    Write-Output "Detectie mislukt: $($_.Exception.Message)"
    exit 1
}
