// Menu labels, page names and rendering.
apexCount()
{
    if (self.apexPage == 0)
        return 7;
    if (self.apexPage == 7)
        return 3;
    if (self.apexPage == 1)
        return 2;  // God Mode + Back.
    return 2;
}

apexLabel(index)
{
    if (self.apexPage == 0)
    {
        switch (index)
        {
            case 0: return "PLAYER OPTIONS     >";
            case 1: return "WEAPON OPTIONS     >";
            case 2: return "ZOMBIE OPTIONS     >";
            case 3: return "GAMEPLAY OPTIONS   >";
            case 4: return "TELEPORTATION      >";
            case 5: return "VISUAL OPTIONS     >";
            case 6: return "SETTINGS           >";
        }
    }
    if (self.apexPage == 1)
    {
        if (index == 0)
        {
            if (self.apexGodMode)
                return "GOD MODE: ON";
            return "GOD MODE: OFF";
        }
        if (index == 1)
            return "< BACK";
    }
    if (self.apexPage == 7)
    {
        switch (index)
        {
            case 0: return "FOV PREVIEW: " + self.apexFovPreview;
            case 1:
                if (self.apexDemoToggle)
                    return "DEMO TOGGLE: ON";
                return "DEMO TOGGLE: OFF";
            case 2: return "< BACK";
        }
    }
    if (index == 0)
        return "FEATURES COMING SOON";
    if (index == 1)
        return "< BACK";
    return "";
}

apexPageName()
{
    switch (self.apexPage)
    {
        case 0: return "MAIN MENU";
        case 1: return "PLAYER OPTIONS";
        case 2: return "WEAPON OPTIONS";
        case 3: return "ZOMBIE OPTIONS";
        case 4: return "GAMEPLAY OPTIONS";
        case 5: return "TELEPORTATION";
        case 6: return "VISUAL OPTIONS";
        case 7: return "SETTINGS";
    }
    return "APEX";
}

apexRender()
{
    if (!self.apexOpen)
        return;

    self.apexSubTitle setText(self apexPageName() + "  /  v0.2");
    self.apexHighlight.y = 140 + (self.apexSelected * 27);

    for (i = 0; i < 7; i++)
    {
        if (i < self apexCount())
        {
            self.apexRows[i] setText(self apexLabel(i));
            self.apexRows[i].alpha = 1;
            if (i == self.apexSelected)
                self.apexRows[i].color = (0.14, 0.93, 1);
            else
                self.apexRows[i].color = (0.83, 0.90, 0.95);
        }
        else
            self.apexRows[i].alpha = 0;
    }

	self.apexFooter.fontScale = 1.5;
	self.apexFooter.color = (0.45, 0.65, 0.75);

    if (self.apexAdjusting)
	{
		self.apexFooter setText("LEFT/RIGHT | SQUARE SAVE | R3 CANCEL");
	}
	else
	{
		self.apexFooter setText("UP/DOWN | SQUARE SELECT | R3 BACK");
	}
}
