# APEX Zombies Menu — modular UI prototype

**Target:** Call of Duty: Black Ops III Zombies on PS4 (1.33)  
**State:** Modular menu previously confirmed loading and navigating on PS4 by the developer; God Mode is newly added and **not yet tested in-game**.

## What is working in the original tested `main.gsc`

- `autoexec main()` bootstrap and host-only initialization
- Left-side APEX menu HUD with seven category pages
- L2 + R3 to open the menu
- D-pad up/down to change selection, Square to select, R3 to go back/close
- Player Options: God Mode ON/OFF toggle (new, needs PS4 testing)
- Other placeholder feature pages and a settings preview (FOV slider value and demo toggle)
- A delayed `APEX READY` notification

**The FOV value is only a menu preview:** this script does not apply FOV to the game. The demo toggle also does not change gameplay. The other feature pages contain placeholders, not active features.

## Layout

```text
source/
  apex.gsc                     # Comments / project marker, no second autoexec
  initialization.gsc           # autoexec main, host-only bootstrap
  functions.gsc                # delayed ready notification
  menu/
    menu_navigation.gsc        # controller loop and Back
    menu_elements.gsc          # HUD rendering primitives
    menu_main.gsc              # page labels, menu render
    menu_callbacks.gsc         # option selection
  features/
    player.gsc                 # God Mode toggle
    weapons.gsc                # reserved
    zombies.gsc                # reserved
    gameplay.gsc               # reserved
    miscellaneous.gsc          # reserved
backups/
  WORKING_main.gsc             # byte-for-byte copy of supplied working prototype
  original_apex.gsc.txt        # earlier welcome-message stub; not compiled
references/                     # supplied third-party compiled examples (NOT compiled)
```

## Compile (important)

Choose the **`source` folder**, not the project root. Your current APEX Compiler recursively combines every `.gsc` file under the directory passed to it. Selecting the project root risks including `backups/WORKING_main.gsc`, causing duplicate definitions.

In the GUI select:

- **Source directory:** `<APEX project>/source`
- **Output file:** `<APEX project>/build/APEX_Zombies.gscc`

The CLI equivalent is:

```powershell
.\APEX.Compiler.exe "C:\Path\To\APEX_Zombies_Modular_Project\source" "C:\Path\To\APEX_Zombies_Modular_Project\build\APEX_Zombies.gscc"
```

To establish parity before adding features, compile the original `backups/WORKING_main.gsc` **as a file** to a different output filename (the CLI supports file input), then compile the modular source folder; test the modular GSCC in your existing environment. Binary files can differ because source order changes, so rely on behaviour, not file hashes, for the comparison.

## Test God Mode (new functionality)

1. Back up your currently working GSCC and compile **`source/`** into a fresh output file.
2. Start a local/private Zombies match on PS4 and inject using your normal test setup.
3. Press **L2 + R3** to open APEX, select **PLAYER OPTIONS** with Square.
4. Confirm it shows **GOD MODE: OFF**. Press Square; it should change to **GOD MODE: ON** and display an APEX notification.
5. Allow a zombie to hit you. With God Mode ON, regular zombie damage should not reduce your health.
6. Press Square again; it should display **GOD MODE: OFF**. Verify that ordinary damage resumes.
7. Close/reopen the menu with R3 and confirm the toggle state remains displayed correctly.

The native functions used are `self EnableInvulnerability()` and `self DisableInvulnerability()`.
No background loop is needed. This test has **not yet been verified on PS4**.

## Notes for next iteration

1. Only test in local/private gameplay, not public multiplayer sessions.
2. If the game reports an unresolved function, inspect compiler logs and runtime messages before adding more features.
3. Keep host-only ownership and disconnect/game-end behaviour intact.
4. Do not move `WORKING_main.gsc` into `source/` (duplicate definitions).

**References:** `references/` holds compiled third-party menus supplied for local comparison. They are not editable GSC source and are not needed to compile APEX. Check redistribution rights before committing them publicly.
