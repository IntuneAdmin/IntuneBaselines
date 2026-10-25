<#
.SYNOPSIS
    Remediatie: blokkeert het toevoegen van extra werk- of schoolaccounts.

.DESCRIPTION
    Zet:
      HKLM\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin
      BlockAADWorkplaceJoin (DWORD) = 1

    Gebruikers kunnen daarna geen extra werk- of schoolaccounts (Entra-registratie
    bij andere tenants) toevoegen, ook niet via Office-apps.

.NOTES
    Intune Remediation: "Run this script using the logged-on credentials" = No (SYSTEM)
                        "Run script in 64-bit PowerShell"               = Yes
#>

$ErrorActionPreference = 'Stop'

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin'
$Name = 'BlockAADWorkplaceJoin'

try {
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }

    New-ItemProperty -Path $Path -Name $Name -Value 1 -PropertyType DWord -Force | Out-Null

    # Verificatie
    $check = (Get-ItemProperty -Path $Path -Name $Name).$Name
    if ($check -ne 1) { throw "$Name is na remediatie $check" }

    Write-Output "Remediatie geslaagd: $Name = 1"
    exit 0
}
catch {
    Write-Output "Remediatie mislukt: $($_.Exception.Message)"
    exit 1
}
