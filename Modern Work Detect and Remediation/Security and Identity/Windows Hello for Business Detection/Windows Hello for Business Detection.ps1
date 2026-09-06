# Windows Hello for Business Detection
# Intune Remediation Detection Script

$DsReg = dsregcmd /status 2>&1

$InUserState = $false
$NgcSet = $null

foreach ($Line in $DsReg) {

    # Normalize the dsregcmd table formatting
    $CleanLine = $Line.Trim().Trim('|').Trim()

    # Start of User State
    if ($CleanLine -eq "User State") {
        $InUserState = $true
        continue
    }

    # Another section starts -> leave User State
    if ($InUserState -and
        $CleanLine -match '^(Device State|SSO State|Diagnostic Data|Tenant Details|User Details)$') {
        break
    }

    # Get NgcSet specifically from User State
    if ($InUserState -and
        $CleanLine -match '^NgcSet\s*:\s*(YES|NO)$') {

        $NgcSet = $Matches[1]
        break
    }
}

if ($NgcSet -eq "YES") {
    Write-Output "Windows Hello for Business credential is configured."
    exit 0
}
else {
    Write-Output "Windows Hello for Business credential is not configured."
    exit 1
}