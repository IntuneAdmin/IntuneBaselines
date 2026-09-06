# TPM Health Detection
# Intune Remediation Detection Script

try {
    $TPM = Get-Tpm -ErrorAction Stop
}
catch {
    Write-Output "Unable to query TPM."
    exit 1
}

if ($TPM.TpmPresent -and $TPM.TpmReady) {

    Write-Output "TPM is healthy and ready."
    exit 0

}
else {

    Write-Output "TPM is not healthy or ready."
    exit 1

}