# APEX Zombies v0.5 — No Reload (unreleased)

**Target:** Call of Duty: Black Ops III Zombies, PS4 1.33.

This build extends the **developer-tested v0.4** modular menu with a separate **No Reload** toggle.

## Player Options

1. GOD MODE: OFF / ON — tested working
2. INFINITE AMMO: OFF / ON — tested working (reserve ammunition)
3. NO RELOAD: OFF / ON — new and untested (current magazine)
4. < BACK

**Controls:** L2 + R3 opens the menu; D-pad Up/Down navigates; Square toggles; R3 goes back.

## Implementation

- `apexToggleNoReload()` controls a player-owned ON/OFF state.
- `apexNoReloadLoop()` checks the **current weapon** every **0.05 seconds**, and when needed uses `SetWeaponAmmoClip(weapon, weapon.clipSize)`.
- No Reload does **not** refill reserve ammunition; Infinite Ammo still handles that in its separate worker.
- No Reload's worker stops when toggled OFF, on player disconnect, or when the game ends. It only modifies ammunition while the player is alive.
- **Manual reload animations are not suppressed by this approach**. If the player manually presses reload, the animation may still occur.
- Standard magazine-based firearms are the initial test target. Dual-wield weapons, launchers, special weapons and equipment may have different behaviour.

## Compile and PS4 testing

1. Keep your known-good v0.4 `.gscc` and source backup.
2. In APEX Compiler GUI choose **this project's `source/` folder**, **not** the project root.
3. Compile to a new output filename (for example, `APEX_Zombies_NoReload_TEST.gscc`).
4. Inject and test in a **local/private** Zombies match.
5. Open Player Options, switch **No Reload ON**, and fire a normal magazine-based weapon. Check that the **clip stays full** without needing to reload.
6. Turn No Reload **OFF**, then fire and verify the magazine decreases normally.
7. Enable **both Infinite Ammo and No Reload** and check that they operate independently.
8. Switch weapons, reopen the menu, and confirm God Mode still toggles normally.
9. Test manual reload and Pack-a-Punched/dual-wield weapons only after the ordinary-weapon test passes.

If the compiler reports an error or the game behaves unexpectedly, revert to the v0.4 GSCC and share the exact compiler log or in-game symptom.

## Changed files

- `source/features/player.gsc` — No Reload toggle and worker
- `source/menu/menu_main.gsc` — No Reload label, 4-row Player Options count, v0.5 subtitle
- `source/menu/menu_callbacks.gsc` — Square toggle callback
- `source/menu/menu_navigation.gsc` — initialise No Reload OFF

The compiler recursively collects `.gsc` files inside `source/`. Don't copy backup `.gsc` files into the compilation folder.
