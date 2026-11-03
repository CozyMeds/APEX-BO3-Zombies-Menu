apexRefillAmmo()
{
    if (IsAlive(self))
    {
        weapon = self GetCurrentWeapon();

        if (isDefined(weapon) && isDefined(weapon.maxAmmo) && weapon.maxAmmo > 0)
        {
            self SetWeaponAmmoStock(weapon, weapon.maxAmmo);
            self IPrintLnBold("^7Ammo Refilled!");
        }
        else
        {
            self IPrintLnBold("^7Cannot refill this weapon!");
        }
    }
}