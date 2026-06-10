# Pack-Mods.ps1
# This script compresses Crysis mod source folders into game-compatible .pak archives.
# Run this script from PowerShell inside the Mod-Tools directory or the root directory.

param (
    [string]$GameDir = "..", # Relative path to Crysis root or specify the absolute path
    [string]$SourceFolder,   # e.g., "Crysis-Crouch-Toggle"
    [string]$OutputPakName   # e.g., "zzzz_zRemasterCrouchToggleFix.pak"
)

# Load compression assembly
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

# Resolve paths
$resolvedGameDir = Resolve-Path $GameDir
$gameFolderPath = Join-Path $resolvedGameDir "Game"

if (-not $SourceFolder -or -not $OutputPakName) {
    Write-Host "Usage: .\Pack-Mods.ps1 -SourceFolder <folder_name> -OutputPakName <pak_name.pak>" -ForegroundColor Yellow
    Write-Host "Example: .\Pack-Mods.ps1 -SourceFolder 'Crysis-Crouch-Toggle' -OutputPakName 'zzzz_zRemasterCrouchToggleFix.pak'" -ForegroundColor Yellow
    exit
}

$srcDir = Resolve-Path (Join-Path ".." $SourceFolder)
$zipPath = Join-Path $gameFolderPath $OutputPakName

Write-Host "Packing '$srcDir' into '$zipPath'..." -ForegroundColor Cyan

# Remove old pak if it exists
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

# Create zip archive
$zip = [System.IO.Compression.ZipFile]::Open($zipPath, [System.IO.Compression.ZipArchiveMode]::Create)
$files = Get-ChildItem -Path $srcDir -Recurse -File

foreach ($file in $files) {
    # Skip README.md and .git files if they exist in source
    if ($file.Name -eq "README.md" -or $file.FullName -like "*\.git\*") {
        continue
    }
    
    # Calculate relative entry path
    $relPath = $file.FullName.Substring($srcDir.FullName.Length + 1)
    $entryName = $relPath.Replace("\", "/") # CryEngine requires forward slashes
    
    $entry = $zip.CreateEntry($entryName, [System.IO.Compression.CompressionLevel]::Optimal)
    $entryStream = $entry.Open()
    $fileStream = [System.IO.File]::OpenRead($file.FullName)
    $fileStream.CopyTo($entryStream)
    $fileStream.Close()
    $entryStream.Close()
}
$zip.Dispose()

Write-Host "Successfully compiled $OutputPakName!" -ForegroundColor Green
