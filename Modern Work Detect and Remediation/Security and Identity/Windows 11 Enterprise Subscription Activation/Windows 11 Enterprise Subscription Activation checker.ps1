# Windows 11 Enterprise - Subscription Activation Detection

$WindowsLicense = Get-CimInstance -ClassName SoftwareLicensingProduct |
    Where-Object {
        $_.ApplicationID -eq '55c92734-d682-4d71-983e-d6ec3f16059f' -and
        $_.Name -like '*Windows*Enterprise*' -and
        $_.LicenseStatus -eq 1
    }

if ($WindowsLicense) {

    # Subscription activation uses the digital subscription product key
    if ($WindowsLicense.PartialProductKey -eq '3V66T') {
        Write-Output "Windows 11 Enterprise is activated through subscription."
        exit 0
    }
}

Write-Output "Windows 11 Enterprise subscription activation not detected."
exit 1