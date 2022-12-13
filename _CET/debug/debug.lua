local ZKVLC = GetMod("ZKVLC")

ZKVLC.debugMode = true

-- GetMod("ZKV_Takedowns").GiveDebugItems()
function ZKVLC.GiveDebugItems()
    Game.AddToInventory("Items.Preset_Crowbar_Default", 1);
    Game.AddToInventory("Items.Preset_Dildo_Stout", 1);
    Game.AddToInventory("Items.Preset_Baseball_Bat_Default", 1);

    Game.AddToInventory("Items.Preset_Hammer_Default", 1);
end
