# Microsoft Edge - Work/School Account Detection
# Intune Remediation Detection Script

$LocalStatePath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Local State"

if (-not (Test-Path $LocalStatePath)) {
    Write-Output "Microsoft Edge Local State not found."
    exit 1
}

try {
    $Content = Get-Content $LocalStatePath -Raw -ErrorAction Stop
}
catch {
    Write-Output "Unable to read Microsoft Edge Local State."
    exit 1
}

# Find all Edge user_name entries
$Accounts = [regex]::Matches(
    $Content,
    '"user_name"\s*:\s*"([^"]*)"'
) | ForEach-Object {
    $_.Groups[1].Value
} | Where-Object {
    -not [string]::IsNullOrWhiteSpace($_)
}

# Consumer Microsoft account domains
$ConsumerDomains = @(
    "outlook.com",
    "hotmail.com",
    "live.com",
    "msn.com"
)

$WorkAccounts = foreach ($Account in $Accounts) {

    $Domain = ($Account -split "@", 2)[1]

    if ($Domain -and $ConsumerDomains -notcontains $Domain.ToLower()) {
        $Account
    }
}

if ($WorkAccounts) {

    $WorkAccounts = $WorkAccounts | Select-Object -Unique

    Write-Output "Microsoft Edge is signed in with a work/school account:"
    $WorkAccounts | ForEach-Object {
        Write-Output " - $_"
    }

    exit 0
}

Write-Output "Microsoft Edge is NOT signed in with a work/school account."
exit 1