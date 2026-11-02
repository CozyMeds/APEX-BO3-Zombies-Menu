// Controller polling, menu navigation and Back behaviour.
apexClient()
{
    self endon("disconnect");
    level endon("game_ended");

    // Autoexec can start before the player is in the match.
    while (!isDefined(self.sessionstate) || self.sessionstate != "playing")
        wait 0.25;

    wait 1;

    self.apexOpen = 0;
    self.apexPage = 0;       // 0 = root; 1 = God Mode; 2..6 = placeholders; 7 = settings.
    self.apexSelected = 0;
    self.apexAdjusting = 0;
    self.apexFovPreview = 90;
    self.apexFovOriginal = 90;
    self.apexDemoToggle = 0;
    self.apexGodMode = 0;  // Starts OFF each match/client initialization.

    self apexCreateUI();
	self thread apexReadyNotification();

    wasCombo = 0;
    wasMelee = 0;
    wasUp = 0;
    wasDown = 0;
    wasLeft = 0;
    wasRight = 0;
    wasSelect = 0;

    while (1)
    {
        aim = self AdsButtonPressed();            // L2
        melee = self MeleeButtonPressed();         // R3
        up = self ActionSlotOneButtonPressed();    // D-pad Up
        down = self ActionSlotTwoButtonPressed();  // D-pad Down
        left = self ActionSlotThreeButtonPressed();// D-pad Left
        right = self ActionSlotFourButtonPressed();// D-pad Right
        select = self UseButtonPressed();          // Square
        combo = aim && melee;

        if (!self.apexOpen)
        {
            // Edge detect the combo, rather than opening every frame it is held.
            if (combo && !wasCombo)
            {
                self.apexOpen = 1;
                self.apexPage = 0;
                self.apexSelected = 0;
                self.apexAdjusting = 0;
                self apexShowUI();
                self apexRender();
            }
        }
        else
        {
            if (self.apexAdjusting)
            {
                if (left && !wasLeft)
                {
                    self.apexFovPreview -= 5;
                    if (self.apexFovPreview < 60)
                        self.apexFovPreview = 60;
                    self apexRender();
                }
                if (right && !wasRight)
                {
                    self.apexFovPreview += 5;
                    if (self.apexFovPreview > 120)
                        self.apexFovPreview = 120;
                    self apexRender();
                }
                if (select && !wasSelect)
                {
                    self.apexAdjusting = 0;   // Accept preview value.
                    self apexRender();
                }
                if (melee && !wasMelee && !aim)
                {
                    self.apexFovPreview = self.apexFovOriginal; // Cancel.
                    self.apexAdjusting = 0;
                    self apexRender();
                }
            }
            else
            {
                if (up && !wasUp)
                {
                    self.apexSelected--;
                    if (self.apexSelected < 0)
                        self.apexSelected = self apexCount() - 1;
                    self apexRender();
                }
                if (down && !wasDown)
                {
                    self.apexSelected++;
                    if (self.apexSelected >= self apexCount())
                        self.apexSelected = 0;
                    self apexRender();
                }
                if (select && !wasSelect)
                    self apexSelect();

                // R3 is Back, but not if L2 is held (the open combo).
                if (melee && !wasMelee && !aim)
                    self apexBack();
            }
        }

        wasCombo = combo;
        wasMelee = melee;
        wasUp = up;
        wasDown = down;
        wasLeft = left;
        wasRight = right;
        wasSelect = select;
        wait 0.05;
    }
}

apexBack()
{
    if (self.apexPage == 0)
    {
        self.apexOpen = 0;
        self.apexAdjusting = 0;
        self apexHideUI();
    }
    else
    {
        self.apexSelected = self.apexPage - 1; // Restore selected category.
        self.apexPage = 0;
        self apexRender();
    }
}
