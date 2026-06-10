# Unpack-Pak.ps1
# This script extracts standard Crysis .pak archives into folders for editing.
# Run this script from PowerShell inside the Mod-Tools directory or the root directory.

param (
    [string]$PakFile,       # Path to the .pak file to extract
    [string]$OutputDir      # Output folder path where files will be extracted
)

# Load compression assembly
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

if (-not $PakFile -or -not $OutputDir) {
    Write-Host "Usage: .\Unpack-Pak.ps1 -PakFile <path_to_pak> -OutputDir <output_folder>" -ForegroundColor Yellow
    Write-Host "Example: .\Unpack-Pak.ps1 -PakFile '..\Game\zzz_ImprovementProject.pak' -OutputDir '..\Game\zzz_ImprovementProject_unpacked'" -ForegroundColor Yellow
    exit
}

$resolvedPak = Resolve-Path $PakFile
if (-not (Test-Path $resolvedPak)) {
    Write-Host "[ERROR] Pak file not found: $PakFile" -ForegroundColor Red
    exit
}

# Create output dir if it doesn't exist
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}
$resolvedOut = Resolve-Path $OutputDir

Write-Host "Unpacking '$resolvedPak' to '$resolvedOut'..." -ForegroundColor Cyan

# Extract files
$zip = [System.IO.Compression.ZipFile]::OpenRead($resolvedPak)
foreach ($entry in $zip.Entries) {
    $targetPath = Join-Path $resolvedOut $entry.FullName
    $targetDir = Split-Path $targetPath -Parent
    
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }
    
    # Skip directories entries
    if ($entry.Name -ne "") {
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $targetPath, $true)
    }
}
$zip.Dispose()

Write-Host "Successfully unpacked to $OutputDir!" -ForegroundColor Green
