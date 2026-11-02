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
