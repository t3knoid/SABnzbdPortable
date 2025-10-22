# Path to version file
$versionFile = "version.txt"
$basePath = "SABnzbdPortable\App"
$targetName = "SABnzbdPortable"


# Read version from file
if (!(Test-Path $versionFile)) {
    Write-Error "❌ version.txt not found."
    exit 1
}

$Version = Get-Content $versionFile | Select-Object -First 1
if (-not $Version) {
    Write-Error "❌ version.txt is empty or unreadable."
    exit 1
}

# Construct download URL
$baseUrl = "https://github.com/sabnzbd/sabnzbd/releases/download"
$zipName = "SABnzbd-$Version-win64-bin.zip"
$downloadUrl = "$baseUrl/$Version/$zipName"

# Define paths
$targetRoot = "SABnzbdPortable\App"
$zipPath = "$env:TEMP\$zipName"

# Create target directory if it doesn't exist
if (!(Test-Path $targetRoot)) {
    New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
}

# Download the ZIP
Write-Host "Downloading SABnzbd $Version..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

# Unzip to target
Write-Host "Extracting to $targetRoot..."
Expand-Archive -Path $zipPath -DestinationPath $targetRoot -Force

# Rename extracted folder
$extractedFolder = Join-Path $basePath "SABnzbd-$Version"
$finalPath = Join-Path $basePath $targetName

if (Test-Path $finalPath) {
    Remove-Item $finalPath -Recurse -Force
}
Rename-Item -Path $extractedFolder -NewName $targetName

# Cleanup
Remove-Item $zipPath

Write-Host "SABnzbd $Version extracted to $targetRoot"