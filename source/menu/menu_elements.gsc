// HUD elements, colours and visibility.
apexCreateUI()
{
    // Basic BO3 client HUD elements. No LUI or external scripts required.
    self.apexPanel = self apexRectangle(23, 67, 273, 309, (0.018, 0.045, 0.080), 0);
    self.apexTopLine = self apexRectangle(23, 67, 273, 4, (0.02, 0.78, 1), 0);
    self.apexHighlight = self apexRectangle(29, 140, 259, 25, (0.01, 0.35, 0.55), 0);

    self.apexTitle = self apexText(39, 81, 2.0,(0.06, 0.82, 1),"APEX");

	self.apexSubTitle = self apexText(40, 111, 1.5,(0.58, 0.76, 0.86),"ZOMBIES / v0.6");

	self.apexFooter = self apexText(38, 347, 0.5,(0.58, 0.85, 0.95),"");

    self.apexRows = [];
    for (i = 0; i < 7; i++)
        self.apexRows[i] = self apexText(39, 143 + (i * 27), 1.18, (0.85, 0.92, 1), " ");
}

apexRectangle(x, y, width, height, tint, opacity)
{
    e = NewClientHudElem(self);
    e.horzAlign = "user_left";
    e.vertAlign = "user_top";
    e.alignX = "left";
    e.alignY = "top";
    e.x = x;
    e.y = y;
    e.sort = 5;
    e.foreground = true;
    e.hideWhenInMenu = true;
    e.hideWhenDead = false;
    e.color = tint;
    e.alpha = opacity;
    e setShader("white", width, height);
    return e;
}

apexText(x, y, scale, tint, value)
{
    e = NewClientHudElem(self);

    e.horzAlign = "user_left";
    e.vertAlign = "user_top";
    e.alignX = "left";
    e.alignY = "top";

    e.x = x;
    e.y = y;

    e.sort = 10;
    e.foreground = true;

    e.hideWhenInMenu = true;
    e.hideWhenDead = false;

    e.color = tint;
    e.alpha = 0;

    // Set the requested font size.
    e.fontScale = scale;

    // Assign the text after configuring its size.
    e setText(value);

    return e;
}

apexShowUI()
{
    self.apexPanel.alpha = 0.87;
    self.apexTopLine.alpha = 1;
    self.apexHighlight.alpha = 0.85;
    self.apexTitle.alpha = 1;
    self.apexSubTitle.alpha = 1;
    self.apexFooter.alpha = 1;
}

apexHideUI()
{
    self.apexPanel.alpha = 0;
    self.apexTopLine.alpha = 0;
    self.apexHighlight.alpha = 0;
    self.apexTitle.alpha = 0;
    self.apexSubTitle.alpha = 0;
    self.apexFooter.alpha = 0;

    for (i = 0; i < 7; i++)
        self.apexRows[i].alpha = 0;
}
