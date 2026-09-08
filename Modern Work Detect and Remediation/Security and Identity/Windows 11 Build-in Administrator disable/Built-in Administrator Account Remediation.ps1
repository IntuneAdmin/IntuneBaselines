# Disable Built-in Administrator Account
# Intune Remediation Script

$Admin = Get-LocalUser | Where-Object {
    $_.SID.Value -match '-500$'
}

if (-not $Admin) {
    Write-Output "Built-in Administrator account not found."
    exit 1
}

if (-not $Admin.Enabled) {
    Write-Output "Built-in Administrator account is already disabled."
    exit 0
}

try {
    Disable-LocalUser -Name $Admin.Name -ErrorAction Stop

    $Admin = Get-LocalUser | Where-Object {
        $_.SID.Value -match '-500$'
    }

    if (-not $Admin.Enabled) {
        Write-Output "Built-in Administrator account has been disabled."
        exit 0
    }
    else {
        Write-Output "Failed to disable Built-in Administrator account."
        exit 1
    }
}
catch {
    Write-Output "Failed to disable Built-in Administrator account."
    Write-Output $_.Exception.Message
    exit 1
}
