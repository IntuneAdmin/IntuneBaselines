# Built-in Administrator Account Detection
# Intune Remediation Detection Script

$Admin = Get-LocalUser | Where-Object {
    $_.SID.Value -match '-500$'
}

if ($Admin -and -not $Admin.Enabled) {
    Write-Output "Built-in Administrator account is disabled."
    #exit 0
}
else {
    Write-Output "Built-in Administrator account is enabled."
    #exit 1
}