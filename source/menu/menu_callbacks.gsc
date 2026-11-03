// Menu selection callbacks.
apexSelect()
{
    if (self.apexPage == 0)
    {
        self.apexPage = self.apexSelected + 1;
        self.apexSelected = 0;
        self apexRender();
        return;
    }

    if (self.apexPage == 1)
    {
        if (self.apexSelected == 0)
        {
            self apexToggleGodMode();
            self apexRender();
        }
        else if (self.apexSelected == 1)
        {
            self apexToggleInfiniteAmmo();
            self apexRender();
        }
        else if (self.apexSelected == 2)
        {
            self apexToggleNoReload();
            self apexRender();
        }
        else if (self.apexSelected == 3)
        {
            // Enter adjustment mode (no in-game change until Square saves).
            self.apexMoveSpeedOriginal = self.apexMoveSpeedStep;
            self.apexAdjusting = 2;  // 1 = FOV preview, 2 = movement speed.
            self apexRender();
        }
        else
            self apexBack();
        return;
    }

	if (self.apexPage == 2)
	{
		if (self.apexSelected == 0)
		{
			self apexRefillAmmo();
		}
		else 
			self apexBack();
		return;
	}

    if (self.apexPage == 7)
    {
        if (self.apexSelected == 0)
        {
            self.apexFovOriginal = self.apexFovPreview;
            self.apexAdjusting = 1;
            self apexRender();
        }
        else if (self.apexSelected == 1)
        {
            self.apexDemoToggle = !self.apexDemoToggle;
            self apexRender();
        }
        else
            self apexBack();
        return;
    }

    if (self.apexSelected == 1)
        self apexBack();
    // Placeholder row deliberately does nothing.
}
