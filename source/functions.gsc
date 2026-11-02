// Shared helpers and delayed ready notification.
apexReadyNotification()
{
    self endon("disconnect");
    level endon("game_ended");

    // Allow time for the Zombies intro cinematic.
    wait 10;

    self IPrintLnBold("^5APEX ^7READY - L2 + R3");
}
