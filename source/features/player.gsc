// APEX Player Options — host-only gameplay toggles.
// Invulnerability uses the native Black Ops III player functions.

apexToggleGodMode()
{
    if (!self.apexGodMode)
    {
        self EnableInvulnerability();
        self.apexGodMode = 1;
        self IPrintLnBold("^5APEX ^7God Mode: ^2ON");
    }
    else
    {
        self DisableInvulnerability();
        self.apexGodMode = 0;
        self IPrintLnBold("^5APEX ^7God Mode: ^1OFF");
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
        self IPrintLnBold("^5APEX ^7Infinite Ammo: ^2ON");
    }
    else
    {
        self.apexInfiniteAmmo = 0;
        self notify("apex_infinite_ammo_stop");
        self IPrintLnBold("^5APEX ^7Infinite Ammo: ^1OFF");
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
        self IPrintLnBold("^5APEX ^7No Reload: ^2ON");
    }
    else
    {
        self.apexNoReload = 0;
        self notify("apex_no_reload_stop");
        self IPrintLnBold("^5APEX ^7No Reload: ^1OFF");
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
