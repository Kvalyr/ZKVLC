-- ====================================================================================================================
-- ZKVLC for CP2077 by Kvalyr
-- ====================================================================================================================
local ZKVLC = GetMod("ZKVLC")
local utils = ZKVLC.utils
local constants = {}
ZKVLC.constants = constants

-- ====================================================================================================================




-- ====================================================================================================================
-- Healing

local healingItems_MaxDocs = { "Items.FirstAidWhiffV0", "Items.FirstAidWhiffV1", "Items.FirstAidWhiffV2" }
constants.healingItems_MaxDocs = healingItems_MaxDocs

local healingItems_BounceBacks = { "Items.BonesMcCoy70V0", "Items.BonesMcCoy70V1", "Items.BonesMcCoy70V2" }
constants.healingItems_BounceBacks = healingItems_BounceBacks

local healingItems = {}
for _, key in ipairs(healingItems_MaxDocs) do
    table.insert(healingItems, key)
end
for _, key in ipairs(healingItems_BounceBacks) do
    table.insert(healingItems, key)
end
constants.healingItems = healingItems

-- ====================================================================================================================
-- Grenades

local grenades = {
    "Items.GrenadeFragRegular",
    "Items.GrenadeFragRegularHack",
    "Items.GrenadeFragHoming",
    "Items.GrenadeFragSticky",

    "Items.GrenadeBiohazardHoming",
    "Items.GrenadeBiohazardRegular",
    "Items.GrenadeBiohazardRegularHack",

    "Items.GrenadeCuttingRegular",
    "Items.GrenadeCuttingRegularHack",

    "Items.GrenadeEMPRegular",
    "Items.GrenadeEMPRegularHack",
    "Items.GrenadeEMPHoming",
    "Items.GrenadeEMPSticky",

    "Items.GrenadeFlashRegular",
    "Items.GrenadeFlashRegularHack",
    "Items.GrenadeFlashHoming",

    "Items.GrenadeIncendiaryRegular",
    "Items.GrenadeIncendiaryRegularHack",
    "Items.GrenadeIncendiarySticky",
    "Items.GrenadeIncendiaryHoming",

    "Items.GrenadeReconRegular",
    "Items.GrenadeReconRegularHack",
    "Items.GrenadeReconSticky",

    "Items.GrenadeOzobsNose",
}
constants.grenadeItems = grenades

-- NYI: Grenade priority from Lowest to highest for determining what to discard in excess of total grenades cap
constants.grenadePriority = {
    [1] = "Items.GrenadeCutting",
    [2] = "Items.GrenadeOzobsNose",
    [3] = "Items.GrenadeIncendiary",
    [4] = "Items.GrenadeFrag",
    [5] = "Items.GrenadeEMP",
    [6] = "Items.GrenadeBiohazard",
    [7] = "Items.GrenadeRecon",
    [8] = "Items.GrenadeFlash",
}

local baseKey = "ZKVLC.Config"
constants.tweakDB_configKeys = {
    base = baseKey,
    CapacityLimiter = "ZKVLC.Config:CapacityLimiter",
    CapacityLimiter_limit = "ZKVLC.Config:CapacityLimiter.limit",
    CapacityLimiter_scrapExcess = "ZKVLC.Config:CapacityLimiter.scrapExcess",
    CapacityLimiter_limit_grenades = "ZKVLC.Config:CapacityLimiter.limit_grenades",
    CapacityLimiter_limit_injectors = "ZKVLC.Config:CapacityLimiter.limit_injectors",
    CapacityLimiter_limit_inhalers = "ZKVLC.Config:CapacityLimiter.limit_inhalers",

    CapacityLimiter_limit_ammo_handgun = "ZKVLC.Config:CapacityLimiter.limit_ammo_handgun",
    CapacityLimiter_limit_ammo_rifle = "ZKVLC.Config:CapacityLimiter.limit_ammo_rifle",
    CapacityLimiter_limit_ammo_shotgun = "ZKVLC.Config:CapacityLimiter.limit_ammo_shotgun",
    CapacityLimiter_limit_ammo_sniper = "ZKVLC.Config:CapacityLimiter.limit_ammo_sniper",
}

constants.tweakDB_configDefaults = {
    CapacityLimiter = {
        limit = true,
        scrapExcess = true,

        -- Consumables
        limit_grenades = 2,
        limit_injectors = 3,
        limit_inhalers = 3,

        -- Ammo
        limit_ammo_handgun = 60,
        limit_ammo_rifle = 120,
        limit_ammo_shotgun = 32,
        limit_ammo_sniper = 32,
    },
}

-- ====================================================================================================================
-- Upgrading

constants.itemRarities = {
    "Common",
    "Uncommon",
    "Rare",
    "Epic",
    "Legendary"
}

constants.ammoTypes = {
    "Handgun",
    "Rifle",
    "Shotgun",
    "Sniper",
}

constants.Crafting = {}
constants.Crafting.CDPR_Defaults = {
    -- Defaults as of 1.61

    -- Weapon - Small
    ["Items.Small_Common_Crafting_Materials_Weapon_inline0.amount"] = 30,

    ["Items.Small_Uncommon_Crafting_Materials_Weapon_inline0.amount"] = 25,
    ["Items.Small_Uncommon_Crafting_Materials_Weapon_inline1.amount"] = 20,

    ["Items.Small_Rare_Crafting_Materials_Weapon_inline0.amount"] = 15,
    ["Items.Small_Rare_Crafting_Materials_Weapon_inline1.amount"] = 15,
    ["Items.Small_Rare_Crafting_Materials_Weapon_inline2.amount"] = 25,

    ["Items.Small_Epic_Crafting_Materials_Weapon_inline0.amount"] = 15,
    ["Items.Small_Epic_Crafting_Materials_Weapon_inline1.amount"] = 15,
    ["Items.Small_Epic_Crafting_Materials_Weapon_inline2.amount"] = 25,

    ["Items.Small_Legendary_Crafting_Materials_Weapon_inline0.amount"] = 20,
    ["Items.Small_Legendary_Crafting_Materials_Weapon_inline1.amount"] = 20,
    ["Items.Small_Legendary_Crafting_Materials_Weapon_inline2.amount"] = 23,

    -- Weapon - Small Iconic
    ["Items.Iconic_Small_Common_Crafting_Materials_Weapon_inline0.amount"] = 55,
    ["Items.Iconic_Small_Common_Crafting_Materials_Weapon_inline1.amount"] = 20,

    ["Items.Iconic_Small_Uncommon_Crafting_Materials_Weapon_inline0.amount"] = 35,
    ["Items.Iconic_Small_Uncommon_Crafting_Materials_Weapon_inline1.amount"] = 45,
    ["Items.Iconic_Small_Uncommon_Crafting_Materials_Weapon_inline2.amount"] = 5,

    ["Items.Iconic_Small_Rare_Crafting_Materials_Weapon_inline0.amount"] = 35,
    ["Items.Iconic_Small_Rare_Crafting_Materials_Weapon_inline1.amount"] = 20,
    ["Items.Iconic_Small_Rare_Crafting_Materials_Weapon_inline2.amount"] = 30,
    ["Items.Iconic_Small_Rare_Crafting_Materials_Weapon_inline3.amount"] = 3,

    ["Items.Iconic_Small_Epic_Crafting_Materials_Weapon_inline0.amount"] = 30,
    ["Items.Iconic_Small_Epic_Crafting_Materials_Weapon_inline1.amount"] = 25,
    ["Items.Iconic_Small_Epic_Crafting_Materials_Weapon_inline2.amount"] = 30,
    ["Items.Iconic_Small_Epic_Crafting_Materials_Weapon_inline3.amount"] = 1,

    ["Items.Iconic_Small_Legendary_Crafting_Materials_Weapon_inline0.amount"] = 40,
    ["Items.Iconic_Small_Legendary_Crafting_Materials_Weapon_inline1.amount"] = 35,
    ["Items.Iconic_Small_Legendary_Crafting_Materials_Weapon_inline2.amount"] = 5,

    -- Weapon - Big
    ["Items.Big_Common_Crafting_Materials_Weapon_inline0.amount"] = 40,

    ["Items.Big_Uncommon_Crafting_Materials_Weapon_inline0.amount"] = 30,
    ["Items.Big_Uncommon_Crafting_Materials_Weapon_inline1.amount"] = 25,

    ["Items.Big_Rare_Crafting_Materials_Weapon_inline0.amount"] = 20,
    ["Items.Big_Rare_Crafting_Materials_Weapon_inline1.amount"] = 20,
    ["Items.Big_Rare_Crafting_Materials_Weapon_inline2.amount"] = 30,

    ["Items.Big_Epic_Crafting_Materials_Weapon_inline0.amount"] = 20,
    ["Items.Big_Epic_Crafting_Materials_Weapon_inline1.amount"] = 20,
    ["Items.Big_Epic_Crafting_Materials_Weapon_inline2.amount"] = 30,

    ["Items.Big_Legendary_Crafting_Materials_Weapon_inline0.amount"] = 25,
    ["Items.Big_Legendary_Crafting_Materials_Weapon_inline1.amount"] = 25,
    ["Items.Big_Legendary_Crafting_Materials_Weapon_inline2.amount"] = 7,

    -- Weapon - Big Iconic
    ["Items.Iconic_Big_Common_Crafting_Materials_Weapon_inline0.amount"] = 65,
    ["Items.Iconic_Big_Common_Crafting_Materials_Weapon_inline1.amount"] = 25,

    ["Items.Iconic_Big_Uncommon_Crafting_Materials_Weapon_inline0.amount"] = 40,
    ["Items.Iconic_Big_Uncommon_Crafting_Materials_Weapon_inline1.amount"] = 50,
    ["Items.Iconic_Big_Uncommon_Crafting_Materials_Weapon_inline2.amount"] = 10,

    ["Items.Iconic_Big_Rare_Crafting_Materials_Weapon_inline0.amount"] = 40,
    ["Items.Iconic_Big_Rare_Crafting_Materials_Weapon_inline1.amount"] = 25,
    ["Items.Iconic_Big_Rare_Crafting_Materials_Weapon_inline2.amount"] = 35,
    ["Items.Iconic_Big_Rare_Crafting_Materials_Weapon_inline3.amount"] = 6,

    ["Items.Iconic_Big_Epic_Crafting_Materials_Weapon_inline0.amount"] = 35,
    ["Items.Iconic_Big_Epic_Crafting_Materials_Weapon_inline1.amount"] = 30,
    ["Items.Iconic_Big_Epic_Crafting_Materials_Weapon_inline2.amount"] = 35,
    ["Items.Iconic_Big_Epic_Crafting_Materials_Weapon_inline3.amount"] = 2,

    ["Items.Iconic_Big_Legendary_Crafting_Materials_Weapon_inline0.amount"] = 45,
    ["Items.Iconic_Big_Legendary_Crafting_Materials_Weapon_inline1.amount"] = 40,
    ["Items.Iconic_Big_Legendary_Crafting_Materials_Weapon_inline2.amount"] = 10,


    -- Clothing - FaceHead
    ["Items.FaceHead_Uncommon_Crafting_Materials_Clothing_inline0.amount"] = 35,
    ["Items.FaceHead_Uncommon_Crafting_Materials_Clothing_inline1.amount"] = 20,

    ["Items.FaceHead_Rare_Crafting_Materials_Clothing_inline0.amount"] = 25,
    ["Items.FaceHead_Rare_Crafting_Materials_Clothing_inline1.amount"] = 20,
    ["Items.FaceHead_Rare_Crafting_Materials_Clothing_inline2.amount"] = 10,

    ["Items.FaceHead_Epic_Crafting_Materials_Clothing_inline0.amount"] = 20,
    ["Items.FaceHead_Epic_Crafting_Materials_Clothing_inline1.amount"] = 15,
    ["Items.FaceHead_Epic_Crafting_Materials_Clothing_inline2.amount"] = 10,

    ["Items.FaceHead_Legendary_Crafting_Materials_Clothing_inline0.amount"] = 20,
    ["Items.FaceHead_Legendary_Crafting_Materials_Clothing_inline1.amount"] = 15,
    ["Items.FaceHead_Legendary_Crafting_Materials_Clothing_inline2.amount"] = 5,

    -- Clothing - FaceHead Iconic
    ["Items.Iconic_FaceHead_Rare_Crafting_Materials_Clothing_inline0.amount"] = 30,
    ["Items.Iconic_FaceHead_Rare_Crafting_Materials_Clothing_inline1.amount"] = 25,
    ["Items.Iconic_FaceHead_Rare_Crafting_Materials_Clothing_inline2.amount"] = 15,
    ["Items.Iconic_FaceHead_Rare_Crafting_Materials_Clothing_inline3.amount"] = 3,

    ["Items.Iconic_FaceHead_Epic_Crafting_Materials_Clothing_inline0.amount"] = 25,
    ["Items.Iconic_FaceHead_Epic_Crafting_Materials_Clothing_inline1.amount"] = 20,
    ["Items.Iconic_FaceHead_Epic_Crafting_Materials_Clothing_inline2.amount"] = 15,
    ["Items.Iconic_FaceHead_Epic_Crafting_Materials_Clothing_inline3.amount"] = 3,

    ["Items.Iconic_FaceHead_Legendary_Crafting_Materials_Clothing_inline0.amount"] = 25,
    ["Items.Iconic_FaceHead_Legendary_Crafting_Materials_Clothing_inline1.amount"] = 20,
    ["Items.Iconic_FaceHead_Legendary_Crafting_Materials_Clothing_inline2.amount"] = 10,

    -- Clothing - Torso
    ["Items.Torso_Uncommon_Crafting_Materials_Clothing_inline0.amount"] = 50,
    ["Items.Torso_Uncommon_Crafting_Materials_Clothing_inline1.amount"] = 40,

    ["Items.Torso_Rare_Crafting_Materials_Clothing_inline0.amount"] = 40,
    ["Items.Torso_Rare_Crafting_Materials_Clothing_inline1.amount"] = 30,
    ["Items.Torso_Rare_Crafting_Materials_Clothing_inline2.amount"] = 20,

    ["Items.Torso_Epic_Crafting_Materials_Clothing_inline0.amount"] = 35,
    ["Items.Torso_Epic_Crafting_Materials_Clothing_inline1.amount"] = 25,
    ["Items.Torso_Epic_Crafting_Materials_Clothing_inline2.amount"] = 25,

    ["Items.Torso_Legendary_Crafting_Materials_Clothing_inline0.amount"] = 30,
    ["Items.Torso_Legendary_Crafting_Materials_Clothing_inline1.amount"] = 25,
    ["Items.Torso_Legendary_Crafting_Materials_Clothing_inline2.amount"] = 15,

    -- Clothing - Torso Iconic
    ["Items.Iconic_Torso_Rare_Crafting_Materials_Clothing_inline0.amount"] = 45,
    ["Items.Iconic_Torso_Rare_Crafting_Materials_Clothing_inline1.amount"] = 35,
    ["Items.Iconic_Torso_Rare_Crafting_Materials_Clothing_inline2.amount"] = 25,
    ["Items.Iconic_Torso_Rare_Crafting_Materials_Clothing_inline3.amount"] = 10,

    ["Items.Iconic_Torso_Epic_Crafting_Materials_Clothing_inline0.amount"] = 40,
    ["Items.Iconic_Torso_Epic_Crafting_Materials_Clothing_inline1.amount"] = 30,
    ["Items.Iconic_Torso_Epic_Crafting_Materials_Clothing_inline2.amount"] = 30,
    ["Items.Iconic_Torso_Epic_Crafting_Materials_Clothing_inline3.amount"] = 10,

    ["Items.Iconic_Torso_Legendary_Crafting_Materials_Clothing_inline0.amount"] = 35,
    ["Items.Iconic_Torso_Legendary_Crafting_Materials_Clothing_inline1.amount"] = 30,
    ["Items.Iconic_Torso_Legendary_Crafting_Materials_Clothing_inline2.amount"] = 20,

    -- Clothing - LegsFeet
    ["Items.LegsFeet_Uncommon_Crafting_Materials_Clothing_inline0.amount"] = 40,
    ["Items.LegsFeet_Uncommon_Crafting_Materials_Clothing_inline1.amount"] = 30,

    ["Items.LegsFeet_Rare_Crafting_Materials_Clothing_inline0.amount"] = 30,
    ["Items.LegsFeet_Rare_Crafting_Materials_Clothing_inline1.amount"] = 25,
    ["Items.LegsFeet_Rare_Crafting_Materials_Clothing_inline2.amount"] = 15,

    ["Items.LegsFeet_Epic_Crafting_Materials_Clothing_inline0.amount"] = 25,
    ["Items.LegsFeet_Epic_Crafting_Materials_Clothing_inline1.amount"] = 20,
    ["Items.LegsFeet_Epic_Crafting_Materials_Clothing_inline2.amount"] = 20,

    ["Items.LegsFeet_Legendary_Crafting_Materials_Clothing_inline0.amount"] = 25,
    ["Items.LegsFeet_Legendary_Crafting_Materials_Clothing_inline1.amount"] = 20,
    ["Items.LegsFeet_Legendary_Crafting_Materials_Clothing_inline2.amount"] = 10,

    -- Clothing - LegsFeet Iconic

    ["Items.Iconic_LegsFeet_Rare_Crafting_Materials_Clothing_inline0.amount"] = 35,
    ["Items.Iconic_LegsFeet_Rare_Crafting_Materials_Clothing_inline1.amount"] = 30,
    ["Items.Iconic_LegsFeet_Rare_Crafting_Materials_Clothing_inline2.amount"] = 20,
    ["Items.Iconic_LegsFeet_Rare_Crafting_Materials_Clothing_inline3.amount"] = 6,

    ["Items.Iconic_LegsFeet_Epic_Crafting_Materials_Clothing_inline0.amount"] = 30,
    ["Items.Iconic_LegsFeet_Epic_Crafting_Materials_Clothing_inline1.amount"] = 25,
    ["Items.Iconic_LegsFeet_Epic_Crafting_Materials_Clothing_inline2.amount"] = 25,
    ["Items.Iconic_LegsFeet_Epic_Crafting_Materials_Clothing_inline3.amount"] = 6,

    ["Items.Iconic_LegsFeet_Legendary_Crafting_Materials_Clothing_inline0.amount"] = 30,
    ["Items.Iconic_LegsFeet_Legendary_Crafting_Materials_Clothing_inline1.amount"] = 25,
    ["Items.Iconic_LegsFeet_Legendary_Crafting_Materials_Clothing_inline2.amount"] = 15,

}

constants.Upgrading = {}
constants.Upgrading.CDPR_Defaults = {
    -- Defaults as of 1.61

    ["Upgrading.Weapon_inline0.amount"] = 8,
    ["Upgrading.Weapon_inline1.amount"] = 5,

    ["Upgrading.Clothing_inline0.amount"] = 8,
    ["Upgrading.Clothing_inline1.amount"] = 5,

    ["Upgrading.Rare_inline0.amount"] = 4,
    ["Upgrading.Rare_inline1.amount"] = 4,

    ["Upgrading.Epic_inline0.amount"] = 3,
    ["Upgrading.Epic_inline1.amount"] = 3,
    ["Upgrading.Epic_inline2.amount"] = 2,
    ["Upgrading.Epic_inline3.amount"] = 2,

    ["Upgrading.Legendary_inline0.amount"] = 2,
    ["Upgrading.Legendary_inline1.amount"] = 2,
    ["Upgrading.Legendary_inline2.amount"] = 1,
    ["Upgrading.Legendary_inline3.amount"] = 1,
    ["Upgrading.Legendary_inline4.amount"] = 1,
    ["Upgrading.Legendary_inline5.amount"] = 1,
}

-- ====================================================================================================================
-- Crafting
