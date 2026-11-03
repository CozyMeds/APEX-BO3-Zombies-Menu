// APEX Player Options — host-only gameplay toggles.
// Invulnerability uses the native Black Ops III player functions.

apexToggleGodMode()
{
    if (!self.apexGodMode)
    {
        self EnableInvulnerability();
        self.apexGodMode = 1;
        self IPrintLnBold("^7God Mode: ^2ON");
    }
    else
    {
        self DisableInvulnerability();
        self.apexGodMode = 0;
        self IPrintLnBold("^7God Mode: ^1OFF");
    }
}

// Refill only reserve ammunition; do not modify the loaded magazine.
// This keeps Infinite Ammo independent from the planned No Reload option.
apexToggleInfiniteAmmo()
{
    if (!self.apexInfiniteAmmo)
    {
        self.apexInfiniteAmmo = 1;
        self thread apexInfiniteAmmoLoop();
        self IPrintLnBold("^7Infinite Ammo: ^2ON");
    }
    else
    {
        self.apexInfiniteAmmo = 0;
        self notify("apex_infinite_ammo_stop");
        self IPrintLnBold("^7Infinite Ammo: ^1OFF");
    }
}

apexInfiniteAmmoLoop()
{
    self endon("disconnect");
    self endon("apex_infinite_ammo_stop");
    level endon("game_ended");

    while (self.apexInfiniteAmmo)
    {
        // Leave weapon ammo alone while dead or between player spawns.
        if (IsAlive(self))
        {
            weapon = self GetCurrentWeapon();
            if (isDefined(weapon) && isDefined(weapon.maxAmmo))
            {
                if (weapon.maxAmmo > 0)
                    self SetWeaponAmmoStock(weapon, weapon.maxAmmo);
            }
        }
        wait 0.25;
    }
}

// Keep the currently equipped weapon's magazine full while enabled.
// Intentionally does not refill reserve ammo (Infinite Ammo handles that).
// This does not suppress a manual reload animation.
apexToggleNoReload()
{
    if (!self.apexNoReload)
    {
        self.apexNoReload = 1;
        self thread apexNoReloadLoop();
        self IPrintLnBold("^7No Reload: ^2ON");
    }
    else
    {
        self.apexNoReload = 0;
        self notify("apex_no_reload_stop");
        self IPrintLnBold("^7No Reload: ^1OFF");
    }
}

apexNoReloadLoop()
{
    self endon("disconnect");
    self endon("apex_no_reload_stop");
    level endon("game_ended");

    while (self.apexNoReload)
    {
        if (IsAlive(self))
        {
            weapon = self GetCurrentWeapon();
            if (isDefined(weapon) && isDefined(weapon.clipSize))
            {
                if (weapon.clipSize > 0)
                {
                    clip = self GetWeaponAmmoClip(weapon);
                    if (clip < weapon.clipSize)
                        self SetWeaponAmmoClip(weapon, weapon.clipSize);
                }
            }
        }
        wait 0.05;
    }
}

// Movement speed is a selectable multiplier of the player's normal speed.
// Store it in quarter steps to avoid floating-point rounding in the HUD.
// 1 -> 0.50x; 2 -> 1.00x (default); 4 -> 2.00x.
apexMoveSpeedText()
{
    switch (self.apexMoveSpeedStep)
    {
        case 1: return "0.50x";
        case 2: return "1.00x";
        case 3: return "1.50x";
        case 4: return "2.00x";
        case 5: return "2.50x";
        case 6: return "3.00x";
        case 7: return "3.50x";
        case 8: return "4.00x";
				case 9: return "4.50x";
        case 10: return "5.00x";
        case 11: return "5.50x";
        case 12: return "6.00x";
        case 13: return "6.50x";
        case 14: return "7.00x";
        case 15: return "7.50x";
        case 16: return "8.00x";
    }
    return "1.00x";
}

// Only applied when the player confirms the slider with Square.
// Reset by selecting 1.00x and saving.
apexApplyMoveSpeed()
{
    speed = self.apexMoveSpeedStep * 0.50;
    self SetMoveSpeedScale(speed);
    self IPrintLnBold("^7Movement Speed: ^2" + self apexMoveSpeedText());
}
