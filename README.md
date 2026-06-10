# Crysis Remastered Mods Collection

A collection of lightweight gameplay and visual modifications for *Crysis Remastered*, designed to work cleanly with other major community mods.

## Nexus Mods & Updates
You can also find these mods on my [Nexus Mods Profile](https://www.nexusmods.com/profile/alexspf).
> [!NOTE]
> The GitHub repository is the main source of development. The most up-to-date and stable versions of the mods will always be released here first.

---

## Mod List

1. **[Crysis Crouch Toggle](./Crysis-Crouch-Toggle)**
   * Converts the Crouch action from hold-to-crouch to a clean toggle functionality.
   * Completely clean: preserves all other defaults and custom hotkeys.

2. **[Crysis Green Reflex Sight](./Crysis-Green-Reflex-Sight)**
   * Replaces the default red reflex sight triangle reticle with a vibrant neon-green reticle for improved target acquisition and visibility.

3. **[Call of Crysis - Gameplay Tweaks](./Crysis-CallOfCrysis-Tweaks)**
   * Boosts movement dynamics by increasing the default walk and run speed (both normal and Nanosuit speeds) for a faster shooter experience.

---

## How to Install (For Players)

To install any of these mods:
1. Go to the **Releases** section of this repository.
2. Download the `.pak` file of the mod you want to install:
   * `zzzz_zRemasterCrouchToggleFix.pak` (Crouch Toggle)
   * `zzzz_CallOfCrysis.pak` (Call of Crysis Tweaks)
   * `zzzz_GreenReflexSight.pak` (Green Reflex Sight)
3. Copy the `.pak` files and paste them into your game's installation folder:
   `...\Crysis Remastered\Game\`
4. For the Crouch Toggle mod, open or create the file `autoexec.cfg` in the game's root directory (`...\Crysis Remastered\`) and add:
   ```cfg
   cl_crouchToggle = 1
   ```

*Note: The `zzzz_` prefix in the filenames ensures that these mods load after all other assets, overriding their default files correctly.*
