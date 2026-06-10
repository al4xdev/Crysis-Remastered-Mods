# Crysis Remastered - Keybinds and Crouch Toggle Fix

This mod modernizes the layout of Crysis Remastered to feel more agile and inline with modern first-person shooters (like Call of Duty), while keeping the Nanosuit quick-access capabilities.

## Features

- **Toggle Crouch:** Switches Crouch from hold-to-toggle natively.
- **Modern Key Layout:**
  - Crouch (Toggle): `C`
  - Prone: `LCTRL` (Left Control)
  - Armor Mode (Quick Activate): `Mouse3` (Middle Click / Scroll Click)
  - Cloak Mode (Quick Activate): `T`
  - Leaning (Hold): `Q` and `E` (standard hold behavior to lean around corners)

## Installation & Setup

1. Copy `zzzz_zRemasterKeybindsFix.pak` into the `...\Crysis Remastered\Game\` folder.
2. In the game's root directory (`...\Crysis Remastered\`), open (or create) a file named `autoexec.cfg` and add the following line:
   ```cfg
   cl_crouchToggle = 1
   ```
   *This console variable tells the engine to handle the C key input as a toggle event.*
