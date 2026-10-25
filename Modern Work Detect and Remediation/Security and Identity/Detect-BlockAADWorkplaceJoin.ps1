<#
.SYNOPSIS
    Detectie: extra werk- of schoolaccounts toevoegen moet geblokkeerd zijn.

.DESCRIPTION
    Controleert:
      HKLM\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin
      BlockAADWorkplaceJoin (DWORD) = 1

    Exit 0 = compliant, Exit 1 = non-compliant (remediatie wordt gestart)

.NOTES
    Intune Remediation: "Run this script using the logged-on credentials" = No (SYSTEM)
                        "Run script in 64-bit PowerShell"               = Yes
#>

$ErrorActionPreference = 'Stop'

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin'
$Name = 'BlockAADWorkplaceJoin'

try {
    $value = (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue).$Name

    if ($value -eq 1) {
        Write-Output "Compliant: $Name = 1"
        exit 0
    }

    Write-Output "Non-compliant: $Name = $(if ($null -eq $value) { 'ontbreekt' } else { $value })"
    exit 1
}
catch {
    Write-Output "Fout tijdens detectie: $($_.Exception.Message)"
    exit 1
}
