# Windows Hello for Business - ESS Detection
# Intune Remediation Detection Script

$EssDetected = $false

$Events = Get-WinEvent -FilterHashtable @{
    LogName = "Microsoft-Windows-Biometrics/Operational"
    Id      = 1108
} -MaxEvents 50 -ErrorAction SilentlyContinue

foreach ($Event in $Events) {
    if ($Event.Message -match 'Virtual Secure Mode') {
        $EssDetected = $true
        break
    }
}

if ($EssDetected) {
    Write-Output "Windows Hello Enhanced Sign-in Security is active."
    exit 0
}
else {
    Write-Output "Windows Hello Enhanced Sign-in Security is not detected."
    exit 1
}