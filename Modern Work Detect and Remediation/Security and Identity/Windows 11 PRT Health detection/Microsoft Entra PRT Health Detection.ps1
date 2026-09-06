# Microsoft Entra PRT Detection
# Intune Remediation Detection Script

try {
    $DsReg = dsregcmd /status 2>&1
}
catch {
    Write-Output "Unable to query dsregcmd."
    exit 1
}

$PrtLine = $DsReg |
    Where-Object {
        $_ -match '^\s*AzureAdPrt\s*:\s*(YES|NO)\s*$'
    } |
    Select-Object -First 1

if ($PrtLine -and $PrtLine -match '^\s*AzureAdPrt\s*:\s*YES\s*$') {
    Write-Output "Microsoft Entra Primary Refresh Token is available."
    #exit 0
}
else {
    Write-Output "Microsoft Entra Primary Refresh Token is not available."
    #exit 1
}