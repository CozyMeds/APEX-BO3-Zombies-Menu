# APEX Zombies v0.6 — Movement Speed

**Target:** Call of Duty: Black Ops III Zombies on PlayStation 4 (version 1.33)

**Status:** Tested and Working | Development Build — Unreleased

APEX Zombies v0.6 builds upon the developer-confirmed working v0.5 release, introducing a fully functional **Movement Speed slider** while preserving all existing gameplay features.

The modular menu, controller navigation, God Mode, Infinite Ammo, No Reload and Movement Speed have been successfully tested in-game on PS4 BO3 1.33.

## Player Options

| Feature        | Description                                   | Status     |
| -------------- | --------------------------------------------- | ---------- |
| God Mode       | Toggle player invulnerability                 | ✅ Working |
| Infinite Ammo  | Automatically replenish reserve ammunition    | ✅ Working |
| No Reload      | Automatically replenish magazine ammunition   | ✅ Working |
| Movement Speed | Adjustable movement speed from 0.50x to 8.00x | ✅ Working |
| Back           | Return to the main menu                       | ✅ Working |

All four gameplay features operate independently.

## Movement Speed

The Movement Speed slider allows players to adjust their movement speed using the in-game APEX menu.

### Features

- **Default speed:** 1.00x (normal movement)
- **Minimum speed:** 0.50x
- **Maximum speed:** 8.00x
- **Adjustment increments:** 0.50x
- **Available settings:** 16
- **Native function:** `self SetMoveSpeedScale(multiplier)`
- Supports saving and cancelling adjustments
- Can be reset to normal movement at any time
- Affects the menu-controlling player rather than modifying global movement settings

### Available Speed Settings

| Step | Multiplier | Step | Multiplier |
| ---- | ---------- | ---- | ---------- |
| 1    | 0.50x      | 9    | 4.50x      |
| 2    | 1.00x      | 10   | 5.00x      |
| 3    | 1.50x      | 11   | 5.50x      |
| 4    | 2.00x      | 12   | 6.00x      |
| 5    | 2.50x      | 13   | 6.50x      |
| 6    | 3.00x      | 14   | 7.00x      |
| 7    | 3.50x      | 15   | 7.50x      |
| 8    | 4.00x      | 16   | 8.00x      |

### Controls

1. Press **L2 + R3** to open the APEX menu.
2. Navigate to **Player Options**.
3. Highlight **Movement Speed** and press **Square** to enter adjustment mode.
4. Use **D-pad Left/Right** to decrease or increase the multiplier.
5. Press **Square** again to save and apply the selected speed.
6. Press **R3** while adjusting to cancel and restore the previously selected value.

**Important:** Changing the displayed multiplier does not immediately modify movement speed. The new value is applied only after pressing Square to confirm.

To restore normal movement, select **1.00x** and save.

## Compilation

APEX Zombies is compiled using [APEX DevTools](https://github.com/CozyMeds/APEX-DevTools).

### Using the GUI

1. Open `APEX.Compiler.GUI.exe`.
2. Select the project's `source/` directory.
3. Choose the destination for the compiled GSCC file.
4. Click **COMPILE GSCC**.
5. Use the resulting `.gscc` file with your compatible PS4 BO3 GSC loading environment.

**Important:** Always select the `source/` directory rather than the project root to prevent duplicate definitions from backup files.

### Command-Line Compilation

```powershell
.\APEX.Compiler.exe "C:\APEX-Zombies\source" "C:\APEX-Zombies\build\APEX_Zombies_v0.6.gscc"
```

## Testing and Verification

**Platform:** PlayStation 4  
**Game:** Call of Duty: Black Ops III Zombies  
**Game Version:** 1.33  
**Environment:** Local/private Zombies gameplay

### Confirmed Working

- [x] Modular GSC compilation
- [x] Successful GSCC injection
- [x] Menu initialization and rendering
- [x] Controller navigation and selection
- [x] God Mode activation and deactivation
- [x] Infinite Ammo reserve replenishment
- [x] No Reload magazine replenishment
- [x] Movement Speed adjustment and application
- [x] Movement Speed menu integration
- [x] FOV preview slider interface

### Known Limitations

- The FOV slider remains a UI preview and does not change the game's actual FOV.
- Movement speed may be affected by game-controlled character initialization, respawning, perks or certain map mechanics.
- Automatic reapplication of movement speed after such events has not been implemented.
- Extremely high movement multipliers may produce unexpected movement or collision behaviour.
- Compatibility with BO3 versions other than PS4 1.33 has not been established.

## Modified Source Files

| File                              | Changes                                                                    |
| --------------------------------- | -------------------------------------------------------------------------- |
| `source/features/player.gsc`      | Movement Speed multiplier calculation, text values and native speed setter |
| `source/menu/menu_main.gsc`       | Movement Speed menu entry and option labels                                |
| `source/menu/menu_callbacks.gsc`  | Movement Speed selection and adjustment handling                           |
| `source/menu/menu_navigation.gsc` | Slider navigation, limits, defaults, save and cancel logic                 |
| `source/menu/menu_elements.gsc`   | HUD version updates                                                        |

### Implementation Notes

Movement Speed uses 16 numbered steps, with each step representing a 0.50x multiplier:

```c
speed = self.apexMoveSpeedStep * 0.50;
self SetMoveSpeedScale(speed);
```

The default step is `2`, producing normal movement speed of `1.00x`.

The existing God Mode, Infinite Ammo and No Reload gameplay functionality remains unchanged.

## Development Status

**APEX Zombies v0.6 is confirmed working and remains an unreleased development build.**

The next development milestone will focus on expanding Weapon Options while maintaining compatibility with existing menu functionality.

No public GitHub release has been created for this version.
