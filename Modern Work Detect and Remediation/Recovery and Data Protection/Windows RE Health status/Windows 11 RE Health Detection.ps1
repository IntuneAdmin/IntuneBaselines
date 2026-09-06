# Windows RE Health Detection
# Intune Remediation Detection Script

$ReAgentXmlPath = "$env:windir\System32\Recovery\ReAgent.xml"

if (-not (Test-Path $ReAgentXmlPath)) {
    Write-Output "Windows Recovery Environment configuration not found."
    #exit 1
}

try {
    $ReAgent = [xml](Get-Content $ReAgentXmlPath -Raw -ErrorAction Stop)
}
catch {
    Write-Output "Unable to read Windows Recovery Environment configuration."
    exit 1
}

$InstallState = $ReAgent.WindowsRE.InstallState.state
$WinREPath = $ReAgent.WindowsRE.WinreLocation.path

if ($InstallState -eq "1" -and -not [string]::IsNullOrWhiteSpace($WinREPath)) {
    Write-Output "Windows Recovery Environment is enabled."
    exit 0
}
else {
    Write-Output "Windows Recovery Environment is not enabled."
    exit 1
}