// APEX Player Options — God Mode toggle (host-only menu).
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
