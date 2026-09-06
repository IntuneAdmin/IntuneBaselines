$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\BrowserCore"
$ValueName   = "EnablePlatformAuth"
$ExpectedValue = 1

try {
    # Create registry path if it does not exist
    if (-not (Test-Path $RegistryPath)) {
        New-Item `
            -Path $RegistryPath `
            -Force `
            -ErrorAction Stop | Out-Null

        Write-Output "Registry path created: $RegistryPath"
    }

    # Create or update the registry value
    New-ItemProperty `
        -Path $RegistryPath `
        -Name $ValueName `
        -PropertyType DWord `
        -Value $ExpectedValue `
        -Force `
        -ErrorAction Stop | Out-Null

    # Verify remediation
    $CurrentValue = Get-ItemPropertyValue `
        -Path $RegistryPath `
        -Name $ValueName `
        -ErrorAction Stop

    if ($CurrentValue -eq $ExpectedValue) {
        Write-Output "Remediation successful: EnablePlatformAuth is set to 1."
        exit 0
    }
    else {
        Write-Output "Remediation failed: Registry value could not be set correctly."
        exit 1
    }
}
catch {
    Write-Output "Remediation failed: $($_.Exception.Message)"
    exit 1
}