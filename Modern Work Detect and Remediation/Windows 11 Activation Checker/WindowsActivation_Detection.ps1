$activation = Get-CimInstance -Query "Select * from SoftwareLicensingProduct where ApplicationID='55c92734-d682-4d71-983e-d6ec3f16059f' and PartialProductKey is not null"
$licensed = $activation | Where-Object { $_.LicenseStatus -eq 1 }

if ($licensed) {
    Write-Host "Windows is activated."
    exit 0
} else {
    Write-Host "Windows is NOT activated."
    exit 1
}
