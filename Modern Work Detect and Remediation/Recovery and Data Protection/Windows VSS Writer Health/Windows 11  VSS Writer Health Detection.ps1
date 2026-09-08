# VSS Writer Health Detection
# Intune Remediation Detection Script

try {
    $Output = vssadmin list writers 2>&1
}
catch {
    Write-Output "Unable to query VSS writers."
    exit 1
}

$WriterStates = [regex]::Matches(
    ($Output -join "`n"),
    'State:\s*\[\s*(\d+)\s*\]'
) | ForEach-Object {
    [int]$_.Groups[1].Value
}

if (-not $WriterStates) {
    Write-Output "No VSS writers could be detected."
    exit 1
}

$UnhealthyWriters = $WriterStates | Where-Object {
    $_ -ne 1
}

if (-not $UnhealthyWriters) {
    Write-Output "All VSS writers are in a stable state."
    exit 0
}
else {
    Write-Output "One or more VSS writers are not in a stable state."
    exit 1
}
