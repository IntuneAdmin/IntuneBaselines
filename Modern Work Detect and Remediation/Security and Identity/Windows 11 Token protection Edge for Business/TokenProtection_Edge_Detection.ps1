$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\BrowserCore"
$ValueName   = "EnablePlatformAuth"
$ExpectedValue = 1

try {
    if (-not (Test-Path $RegistryPath)) {
        Write-Output "Non-compliant: Registry path does not exist."
        exit 1
    }

    $CurrentValue = Get-ItemPropertyValue `
        -Path $RegistryPath `
        -Name $ValueName `
        -ErrorAction Stop

    if ($CurrentValue -eq $ExpectedValue) {
        Write-Output "Compliant: EnablePlatformAuth is set to 1."
        exit 0
    }
    else {
        Write-Output "Non-compliant: EnablePlatformAuth is set to '$CurrentValue', expected '1'."
        exit 1
    }
}
catch {
    Write-Output "Non-compliant: EnablePlatformAuth registry value is missing."
    exit 1
}