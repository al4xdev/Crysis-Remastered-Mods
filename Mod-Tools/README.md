# Crysis Modding Tools

This folder contains helper PowerShell scripts designed to pack and unpack Crysis Remastered `.pak` files (which are standard ZIP archives underneath).

## Scripts

### 1. `Pack-Mods.ps1`
Compresses a mod source directory back into a `.pak` archive inside the game's `Game` folder, ensuring correct internal slash formatting.

**Usage:**
```powershell
.\Pack-Mods.ps1 -SourceFolder "<mod_folder_name>" -OutputPakName "<filename.pak>"
```

**Example:**
To pack the Crouch Toggle mod:
```powershell
.\Pack-Mods.ps1 -SourceFolder "Crysis-Crouch-Toggle" -OutputPakName "zzzz_zRemasterCrouchToggleFix.pak"
```

---

### 2. `Unpack-Pak.ps1`
Extracts files from any game or mod `.pak` archive into a directory for viewing or editing.

**Usage:**
```powershell
.\Unpack-Pak.ps1 -PakFile "<path_to_pak>" -OutputDir "<destination_folder>"
```

**Example:**
To unpack the base game scripts:
```powershell
.\Unpack-Pak.ps1 -PakFile "..\Game\scripts.pak" -OutputDir "..\Game\scripts_extracted"
```
