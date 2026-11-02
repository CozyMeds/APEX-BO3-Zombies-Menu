// Startup entry point and host-only client bootstrap.
autoexec main()
{
    level thread apexBootstrap();
}

apexBootstrap()
{
    level endon("game_ended");

    while (1)
    {
        players = GetPlayers();
        for (i = 0; i < players.size; i++)
        {
            if (isDefined(players[i]) && players[i] IsHost())
            {
                if (!isDefined(players[i].apexStarted))
                {
                    players[i].apexStarted = 1;
                    players[i] thread apexClient();
                }
            }
        }
        wait 1;
    }
}
