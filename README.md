# APEX Zombies Menu

**A modular GSC Zombies mod menu for Call of Duty: Black Ops III on PlayStation 4.**

APEX Zombies is an independently developed mod menu designed for **PS4 BO3 version 1.33**, featuring a custom HUD, controller-based navigation and modular gameplay features.

**Current Version:** v0.3.0-alpha  
**Status:** Active Development — Tested on PS4 BO3 1.33

## Features

### Menu System
- Custom left-side APEX HUD
- Seven menu categories
- Controller-based navigation
- Host-only initialization
- Dynamic menu labels and toggle indicators
- Delayed APEX startup notification
- Modular GSC architecture for easier development

### Player Options

| Feature | Status |
|---|---|
| God Mode | ✅ Working |
| Infinite Ammo | 🔜 Planned |
| No Reload | 🔜 Planned |
| Movement Speed | 🔜 Planned |

**God Mode** uses native BO3 invulnerability functions and has been successfully tested in-game, including enabling and disabling damage protection.

### Settings
- FOV adjustment preview (60–120)
- Demonstration toggle

**Note:** The FOV slider currently modifies only the displayed value. It does not alter the in-game camera FOV. Other unfinished menu options are placeholders.

---

## Controls

| Input | Action |
|---|---|
| L2 + R3 | Open menu |
| D-pad Up / Down | Navigate options |
| Square | Select / Toggle |
| D-pad Left / Right | Adjust active slider |
| R3 | Back / Close menu |

For adjustable settings, press **Square** to enter adjustment mode, use the D-pad Left/Right to change the value, then press Square again to confirm.

---

## Project Structure

```text
source/
├── apex.gsc
├── initialization.gsc
├── functions.gsc
├── menu/
│   ├── menu_navigation.gsc
│   ├── menu_elements.gsc
│   ├── menu_main.gsc
│   └── menu_callbacks.gsc
└── features/
    ├── player.gsc
    ├── weapons.gsc
    ├── zombies.gsc
    ├── gameplay.gsc
    └── miscellaneous.gsc
```

### Architecture

- **initialization.gsc** — Startup and host initialization
- **functions.gsc** — Shared functionality and notifications
- **menu_navigation.gsc** — Controller input handling
- **menu_elements.gsc** — HUD elements and visual components
- **menu_main.gsc** — Menu categories, labels and rendering
- **menu_callbacks.gsc** — Menu selection and feature callbacks
- **features/** — Individual gameplay modifications

This structure allows features to be developed independently without cluttering the main menu logic.

---

## Compilation

APEX Zombies is compiled using [APEX DevTools](https://github.com/CozyMeds/APEX-DevTools), a separate GSC compiler toolkit featuring a command-line compiler and Windows GUI.

### Using APEX Compiler GUI

1. Download and install APEX DevTools.
2. Open `APEX.Compiler.GUI.exe`.
3. Select the Zombies menu's `source` directory.
4. Choose a destination for the compiled `.gscc` file.
5. Click **COMPILE GSCC**.

**Important:** Select the `source/` directory rather than a parent folder containing backup GSC files, as the compiler processes GSC files recursively.

### Command-Line Compilation

```powershell
.\APEX.Compiler.exe "C:\APEX-Zombies\source" "C:\APEX-Zombies\build\APEX_Zombies.gscc"
```

The resulting GSCC file can be used with a compatible PS4 BO3 GSC loading environment.

No injector or PS4 jailbreak payloads are included in this repository.

---

## Development Progress

### v0.3.0-alpha
- [x] Modular GSC project structure
- [x] Custom menu HUD
- [x] Controller navigation
- [x] Menu categories and callbacks
- [x] Dynamic text and toggle indicators
- [x] Adjustable slider interface
- [x] Working God Mode
- [ ] Infinite Ammo
- [ ] No Reload
- [ ] Movement Speed
- [ ] Weapon options
- [ ] Zombie options
- [ ] Gameplay modifications
- [ ] Additional menu customisation

Development is ongoing, with features added and tested individually.

---

## Testing and Compatibility

**Confirmed working on PS4 BO3 1.33:**
- Modular GSCC compilation and injection
- Menu initialization and rendering
- Controller navigation
- Menu selection and toggle callbacks
- FOV preview slider controls
- God Mode activation and deactivation

Testing is currently focused on local/private Zombies gameplay.

Compatibility with other game versions has not been established. Compilation does not guarantee successful execution in every environment.

## Credits

APEX Zombies is developed as an independent community project.

Compilation is performed using [APEX DevTools](https://github.com/CozyMeds/APEX-DevTools).

## Disclaimer

This project is not affiliated with, endorsed by or sponsored by Activision, Treyarch or Sony Interactive Entertainment.

Call of Duty and Black Ops are trademarks of their respective owners.
