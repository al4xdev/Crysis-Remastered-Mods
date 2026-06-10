# Crysis Remastered Mods Collection

A collection of lightweight gameplay and visual modifications for *Crysis Remastered*, designed to work cleanly with other major community mods (such as the *Improvement Project*).

## Mod List

1. **[Crysis Keybinds and Crouch Toggle](./Crysis-Keybinds-and-Crouch-Toggle)**
   * Enables a native crouch toggle (requires setting `cl_crouchToggle = 1` in `autoexec.cfg`).
   * Custom modern layout mapping:
     * Crouch Toggle: `C`
     * Prone: `LCTRL` (Left Control)
     * Armor Mode: `Mouse3` (Middle Click)
     * Cloak Mode: `T`
     * Lean Left / Right: `Q` / `E` (standard hold)

2. **[Crysis Green Reflex Sight](./Crysis-Green-Reflex-Sight)**
   * Replaces the default red dot on the Reflex sight with a sharp, 50% smaller neon-green triangle (chevron/delta shape) for cleaner aim.

3. **[Crysis Nanosuit Gameplay Tweaks](./Crysis-Nanosuit-Gameplay-Tweaks)**
   * Balance adjustments for the player and Nanosuit (sprint speed, energy conservation, power jump height, etc.).

## How to Install (For Players)

To install any of these mods:
1. Go to the **Releases** section of this repository.
2. Download the `.pak` file of the mod you want to install:
   * `zzzz_zRemasterKeybindsFix.pak`
   * `zzzz_zRemasterGreenReflexSight.pak`
   * `zzzz_zRemasterGameplayTweaks.pak`
3. Copy the `.pak` files and paste them into your game's installation folder:
   `...\Crysis Remastered\Game\`
4. (Optional) For the Crouch Toggle mod, open or create the file `autoexec.cfg` in the game's root directory (`...\Crysis Remastered\`) and add:
   ```cfg
   cl_crouchToggle = 1
   ```

*Note: The `zzzz_` prefix in the filenames ensures that these mods load after all other assets (including other mods like the Improvement Project), overriding their default files correctly.*
