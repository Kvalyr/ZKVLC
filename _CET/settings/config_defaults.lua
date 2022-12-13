-- ====================================================================================================================
-- ZKVLC for CP2077 by Kvalyr
-- Default Config values - Editing this file is not advisable - Use the in-game settings UI instead (Main Menu -> Mods -> Kvalyr Mods)
-- ====================================================================================================================
local ZKVLC = GetMod("ZKVLC")
local ConfigDefaults = {}
ZKVLC:AddModule("ConfigDefaults", ConfigDefaults)

function ConfigDefaults:Init()
    ZKVLC.Config.SetDefaultValue("ActiveProfile", "User")

    -- TODO: Move to AddSetting() ?

    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Limit", false)
    ZKVLC.Config.SetDefaultValue("CapacityLimiter_ScrapExcess", false)

    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Consumable_Grenades", 100)
    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Consumable_Injectors", 100)
    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Consumable_Inhalers", 100)

    -- CDPR default ammo limits
    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Ammo_Handgun", 500)
    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Ammo_Rifle", 700)
    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Ammo_Shotgun", 100)
    ZKVLC.Config.SetDefaultValue("CapacityLimiter_Ammo_Sniper", 100)

    ZKVLC.Config.SetDefaultValue("Crafting_Mult_All", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Common", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Uncommon", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Rare", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Epic", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Legendary", 1.0)

    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_All", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Common", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Uncommon", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Rare", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Epic", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Legendary", 1.0)

    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Common_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Uncommon_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Rare_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Epic_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Crafting_Mult_Legendary_components", 1.0)

    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Common_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Uncommon_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Rare_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Epic_components", 1.0)
    ZKVLC.Config.SetDefaultValue("Upgrading_Mult_Legendary_components", 1.0)

    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Total", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Common", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Uncommon", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Rare", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Epic", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Legendary", 50)

    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Total_Iconic", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Common_Iconic", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Uncommon_Iconic", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Rare_Iconic", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Epic_Iconic", 50)
    ZKVLC.Config.SetDefaultValue("Upgrading_Cap_Legendary_Iconic", 50)

    ZKVLC.print("Config Defaults Loaded!")
end
