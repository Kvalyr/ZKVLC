-- ====================================================================================================================
-- ZKV_Takedowns for CP2077 by Kvalyr
-- ====================================================================================================================
local ZKVLC = GetMod("ZKVLC")
local i18n = ZKVLC.i18n
local i18n_strings = {}
ZKVLC:AddModule("i18n_strings", i18n_strings)
i18n.strings = i18n_strings

-- ====================================================================================================================

local function AddStringsForLanguage( langKey, stringsTable )
    for key, value in pairs(stringsTable) do
        i18n:AddString(langKey, key, value)
    end
end

-- ====================================================================================================================
-- Localization Strings for ZKVLC
-- Any missing entries will just show the English string as default
-- Please submit translations on GitHub: https://github.com/Kvalyr/ZKVLC
-- ====================================================================================================================

function i18n_strings:Init()
    local strings_EN = {
        ["zkvlc_settings.tab"] = "ZKVLC",
        ["zkvlc_settings.category.general"] = "General",
        ["zkvlc_settings.General.ProfileSwitcher.label"] = "Switch Profile",
        ["zkvlc_settings.General.ProfileSwitcher.tooltip"] = "Choose from User config, Kvalyr's custom balance or CP2077 v1.61 defaults.\nNote: Settings changes only save between sessions when the 'User' profile is active.",

        -- Crafting Settings
        ["zkvlc_settings.category.crafting"] = "Crafting Resource Multipliers - Components",
        ["zkvlc_settings.category.crafting_equipment"] = "Crafting Resource Multipliers - Item Rarity",

        ["zkvlc_settings.Crafting.Mult_All.label"] = "Crafting Materials Cost - Global",
        ["zkvlc_settings.Crafting.Mult_All.tooltip"] = "Multiplier for crafting materials required. Rarity sliders below get further multiplied by this.",

        ["zkvlc_settings.Crafting.Mult_Common_components.label"] = "Materials Cost - Common Components",
        ["zkvlc_settings.Crafting.Mult_Common_components.tooltip"] = "Multiplier for Common crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Uncommon_components.label"] = "Materials Cost - Uncommon Components",
        ["zkvlc_settings.Crafting.Mult_Uncommon_components.tooltip"] = "Multiplier for Uncommon crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Rare_components.label"] = "Materials Cost - Rare Components",
        ["zkvlc_settings.Crafting.Mult_Rare_components.tooltip"] = "Multiplier for Rare crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Epic_components.label"] = "Materials Cost - Epic Components",
        ["zkvlc_settings.Crafting.Mult_Epic_components.tooltip"] = "Multiplier for Epic crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Legendary_components.label"] = "Materials Cost - Legendary Components",
        ["zkvlc_settings.Crafting.Mult_Legendary_components.tooltip"] = "Multiplier for Legendary crafting materials required.",

        -- Crafting - Equipment
        ["zkvlc_settings.Crafting.Mult_Common.label"] = "Materials Cost - Common Equipment",
        ["zkvlc_settings.Crafting.Mult_Common.tooltip"] = "Multiplier for Common crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Uncommon.label"] = "Materials Cost - Uncommon Equipment",
        ["zkvlc_settings.Crafting.Mult_Uncommon.tooltip"] = "Multiplier for Uncommon crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Rare.label"] = "Materials Cost - Rare Equipment",
        ["zkvlc_settings.Crafting.Mult_Rare.tooltip"] = "Multiplier for Rare crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Epic.label"] = "Materials Cost - Epic Equipment",
        ["zkvlc_settings.Crafting.Mult_Epic.tooltip"] = "Multiplier for Epic crafting materials required.",

        ["zkvlc_settings.Crafting.Mult_Legendary.label"] = "Materials Cost - Legendary Equipment",
        ["zkvlc_settings.Crafting.Mult_Legendary.tooltip"] = "Multiplier for Legendary crafting materials required.",

        -- Upgrading Settings
        ["zkvlc_settings.category.upgrading"] = "Upgrading Resource Multipliers - Components",

        ["zkvlc_settings.Upgrading.Mult_Common_components.label"] = "Materials Cost - Common Components",
        ["zkvlc_settings.Upgrading.Mult_Common_components.tooltip"] = "Multiplier for Common upgrading materials required.",

        ["zkvlc_settings.Upgrading.Mult_Uncommon_components.label"] = "Materials Cost - Uncommon Components",
        ["zkvlc_settings.Upgrading.Mult_Uncommon_components.tooltip"] = "Multiplier for Uncommon upgrading materials required.",

        ["zkvlc_settings.Upgrading.Mult_Rare_components.label"] = "Materials Cost - Rare Components",
        ["zkvlc_settings.Upgrading.Mult_Rare_components.tooltip"] = "Multiplier for Rare craupgradingfting materials required.",

        ["zkvlc_settings.Upgrading.Mult_Epic_components.label"] = "Materials Cost - Epic Components",
        ["zkvlc_settings.Upgrading.Mult_Epic_components.tooltip"] = "Multiplier for Epic upgrading materials required.",

        ["zkvlc_settings.Upgrading.Mult_Legendary_components.label"] = "Materials Cost - Legendary Components",
        ["zkvlc_settings.Upgrading.Mult_Legendary_components.tooltip"] = "Multiplier for Legendary upgrading materials required.",

        -- Upgrading - Equipment
        ["zkvlc_settings.category.upgrading_equipment"] = "Upgrading Resource Multipliers - Item Rarity",

        ["zkvlc_settings.Upgrading.Mult_All.label"] = "Upgrading Materials Cost - Global",
        ["zkvlc_settings.Upgrading.Mult_All.tooltip"] = "Multiplier for upgrading materials required. Rarity sliders below get further multiplied by this.",

        ["zkvlc_settings.Upgrading.Mult_Common.label"] = "Materials Cost - Common Equipment",
        ["zkvlc_settings.Upgrading.Mult_Common.tooltip"] = "Multiplier for Common upgrading materials required.",

        ["zkvlc_settings.Upgrading.Mult_Uncommon.label"] = "Materials Cost - Uncommon Equipment",
        ["zkvlc_settings.Upgrading.Mult_Uncommon.tooltip"] = "Multiplier for Uncommon upgrading materials required.",

        ["zkvlc_settings.Upgrading.Mult_Rare.label"] = "Materials Cost - Rare Equipment",
        ["zkvlc_settings.Upgrading.Mult_Rare.tooltip"] = "Multiplier for Rare upgrading materials required.",

        ["zkvlc_settings.Upgrading.Mult_Epic.label"] = "Materials Cost - Epic Equipment",
        ["zkvlc_settings.Upgrading.Mult_Epic.tooltip"] = "Multiplier for Epic upgrading materials required.",

        ["zkvlc_settings.Upgrading.Mult_Legendary.label"] = "Materials Cost - Legendary Equipment",
        ["zkvlc_settings.Upgrading.Mult_Legendary.tooltip"] = "Multiplier for Legendary upgrading materials required.",

        -- Upgrading Caps
        ["zkvlc_settings.category.upgrading_caps"] = "Upgrading Cost Caps",
        ["zkvlc_settings.category.upgrading_caps_iconic"] = "Upgrading Cost Caps (Iconic Equipment)",

        ["zkvlc_settings.Upgrading.Cap_Total.label"] = "Cap - # of Upgrades - All Materials",
        ["zkvlc_settings.Upgrading.Cap_Total.tooltip"] = "\nThe cost of upgrading an item normally increases for each upgrade.\nThis setting controls when the costs of upgrading an item stop increasing.\ni.e.; If set to 5, the cost stays the same past 5 upgrades.",

        ["zkvlc_settings.Upgrading.Cap_Common.label"] = "Cap - # of Upgrades - Common Materials",
        ["zkvlc_settings.Upgrading.Cap_Common.tooltip"] = "The cost of upgrading an item normally increases for each upgrade.\nThis setting controls when the cost in COMMON material components stops increasing.\ni.e.; If set to 5, the cost stays the same past 5 upgrades.",

        ["zkvlc_settings.Upgrading.Cap_Uncommon.label"] = "Cap - # of Upgrades - Uncommon Materials",
        ["zkvlc_settings.Upgrading.Cap_Uncommon.tooltip"] = "The cost of upgrading an item normally increases for each upgrade.\nThis setting controls when the cost in UNCOMMON material components stops increasing.\ni.e.; If set to 5, the cost stays the same past 5 upgrades.",

        ["zkvlc_settings.Upgrading.Cap_Rare.label"] = "Cap - # of Upgrades - Rare Materials",
        ["zkvlc_settings.Upgrading.Cap_Rare.tooltip"] = "The cost of upgrading an item normally increases for each upgrade.\nThis setting controls when the cost in RARE material components stops increasing.\ni.e.; If set to 5, the cost stays the same past 5 upgrades.",

        ["zkvlc_settings.Upgrading.Cap_Epic.label"] = "Cap - # of Upgrades - Epic Materials",
        ["zkvlc_settings.Upgrading.Cap_Epic.tooltip"] = "The cost of upgrading an item normally increases for each upgrade.\nThis setting controls when the cost in EPIC material components stops increasing.\ni.e.; If set to 5, the cost stays the same past 5 upgrades.",

        ["zkvlc_settings.Upgrading.Cap_Legendary.label"] = "Cap - # of Upgrades - Legendary Materials",
        ["zkvlc_settings.Upgrading.Cap_Legendary.tooltip"] = "The cost of upgrading an item normally increases for each upgrade.\nThis setting controls when the cost in LEGENDARY material components stops increasing.\ni.e.; If set to 5, the cost stays the same past 5 upgrades.",

        -- Capacity Settings
        ["zkvlc_settings.category.capacity_limits"] = "Capacity Limits",
        ["zkvlc_settings.category.capacity_limits_grenades"] = "Capacity Limits - Grenades",
        ["zkvlc_settings.category.capacity_limits_healing"] = "Capacity Limits - Healing",
        ["zkvlc_settings.category.capacity_limits_ammo"] = "Capacity Limits - Ammo",

        ["zkvlc_settings.Capacity.Limit.label"] = "Limit Item Capacities",
        ["zkvlc_settings.Capacity.Limit.tooltip"] = "Master Switch to control item capacity limits. If enabled, excess items will be dropped.",

        ["zkvlc_settings.Capacity.ScrapExcess.label"] = "Scrap Excess Items",
        ["zkvlc_settings.Capacity.ScrapExcess.tooltip"] = "Scrap Excess items (instead of dropping them) if you have the Scrapper perk.",

        ["zkvlc_settings.Capacity.Limit_Grenades.label"] = "Grenade Carry Limit (per type)",
        ["zkvlc_settings.Capacity.Limit_Grenades.tooltip"] = "Maximum that you can carry of each type & rarity of Grenade.\nSet to -1 for unlimited",

        ["zkvlc_settings.Capacity.Limit_Injectors.label"] = "Injector Carry Limit (per quality)",
        ["zkvlc_settings.Capacity.Limit_Injectors.tooltip"] = "Maximum that you can carry of each level of Injector (BounceBack).\nSet to -1 for unlimited",

        ["zkvlc_settings.Capacity.Limit_Inhalers.label"] = "Inhaler Carry Limit (per quality)",
        ["zkvlc_settings.Capacity.Limit_Inhalers.tooltip"] = "Maximum that you can carry of each level of Inhaler (MaxDoc).\nSet to -1 for unlimited",

        ["zkvlc_settings.Capacity.Limit_Ammo_Handgun.label"] = "Handgun Ammo Limit",
        ["zkvlc_settings.Capacity.Limit_Ammo_Handgun.tooltip"] = "Maximum Handgun Ammo you can carry.\nSet to -1 for unlimited",

        ["zkvlc_settings.Capacity.Limit_Ammo_Rifle.label"] = "Rifle Ammo Limit",
        ["zkvlc_settings.Capacity.Limit_Ammo_Rifle.tooltip"] = "Maximum Rifle Ammo you can carry.\nSet to -1 for unlimited",

        ["zkvlc_settings.Capacity.Limit_Ammo_Shotgun.label"] = "Shotgun Ammo Limit",
        ["zkvlc_settings.Capacity.Limit_Ammo_Shotgun.tooltip"] = "Maximum Shotgun Ammo you can carry.\nSet to -1 for unlimited",

        ["zkvlc_settings.Capacity.Limit_Ammo_Sniper.label"] = "Sniper Ammo Limit",
        ["zkvlc_settings.Capacity.Limit_Ammo_Sniper.tooltip"] = "Maximum Sniper Ammo you can carry.\nSet to -1 for unlimited",

    }
    AddStringsForLanguage("en-us", strings_EN)

    -- ====================================================================================================================

    -- Polski
    local strings_PL = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("pl-pl", strings_PL)

    -- ====================================================================================================================

    -- ??????????????
    local strings_AR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("ar-ar", strings_AR)

    -- ====================================================================================================================

    -- ??e??tina
    local strings_CZ = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("cz-cz", strings_CZ)

    -- ====================================================================================================================

    -- Deutsch
    local strings_DE = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("de-de", strings_DE)

    -- ====================================================================================================================

    -- Espa??ol
    local strings_ES = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("es-es", strings_ES)

    -- ====================================================================================================================

    -- Espa??ol de Latinoam??rica
    local strings_ESMX = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("es-mx", strings_ESMX)

    -- ====================================================================================================================

    -- Fran??ais
    local strings_FR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("fr-fr", strings_FR)

    -- ====================================================================================================================

    -- Magyar
    local strings_HU = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("hu-hu", strings_HU)

    -- ====================================================================================================================

    -- Italiano
    local strings_IT = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("it-it", strings_IT)

    -- ====================================================================================================================

    -- ?????????
    local strings_JP = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("jp-jp", strings_JP)

    -- ====================================================================================================================

    -- ?????????
    local strings_KR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("kr-kr", strings_KR)

    -- ====================================================================================================================

    -- Portugu??s brasileiro
    local strings_PTBR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("pt-br", strings_PTBR)

    -- ====================================================================================================================

    -- ??????????????
    local strings_RU = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("ru-ru", strings_RU)

    -- ====================================================================================================================

    -- ??????????????????
    local strings_TH = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("th-th", strings_TH)

    -- ====================================================================================================================

    -- T??rk??e
    local strings_TR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("tr-tr", strings_TR)

    -- ====================================================================================================================

    -- Chinese (PRC)
    -- Translation submitted by Zo7lin @ NexusMods
    local strings_ZHCN = {
        ["zkvlc_settings.tab"] = "???????????????",
         ["zkvlc_settings.category.general"] = "??????",
         ["zkvlc_settings.General.ProfileSwitcher.label"] = "??????????????????",
         ["zkvlc_settings.General.ProfileSwitcher.tooltip"] = "?????????????????????Kvalyr??????????????????????????????????????????\n??????:?????????????????????User??????????????????????????????????????????",

         -- Crafting Settings
         ["zkvlc_settings.category.crafting"] = "??????????????????-??????",
         ["zkvlc_settings.category.crafting_equipment"] = "??????????????????-???????????????",

         ["zkvlc_settings.Crafting.Mult_All.label"] = "??????????????????-??????",
         ["zkvlc_settings.Crafting.Mult_All.tooltip"] = "??????????????????????????????????????????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Common_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Common_components.tooltip"] = "??????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Uncommon_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Uncommon_components.tooltip"] = "??????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Rare_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Rare_components.tooltip"] = "??????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Epic_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Epic_components.tooltip"] = "??????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Legendary_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Legendary_components.tooltip"] = "??????????????????????????????",

         -- Crafting - Equipment
         ["zkvlc_settings.Crafting.Mult_Common.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Common.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Uncommon.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Uncommon.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Rare.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Rare.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Epic.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Epic.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Crafting.Mult_Legendary.label"] = "????????????-????????????",
         ["zkvlc_settings.Crafting.Mult_Legendary.tooltip"] = "?????????????????????????????????",

         -- Upgrading Settings
         ["zkvlc_settings.category.upgrading"] = "??????????????????-??????",

         ["zkvlc_settings.Upgrading.Mult_Common_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Common_components.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Uncommon_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Uncommon_components.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Rare_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Rare_components.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Epic_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Epic_components.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Legendary_components.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Legendary_components.tooltip"] = "?????????????????????????????????",

         -- Upgrading - Equipment
         ["zkvlc_settings.category.upgrading_equipment"] = "??????????????????-???????????????",

         ["zkvlc_settings.Upgrading.Mult_All.label"] = "??????????????????-??????",
         ["zkvlc_settings.Upgrading.Mult_All.tooltip"] = "??????????????????????????????????????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Common.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Common.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Uncommon.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Uncommon.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Rare.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Rare.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Epic.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Epic.tooltip"] = "?????????????????????????????????",

         ["zkvlc_settings.Upgrading.Mult_Legendary.label"] = "????????????-????????????",
         ["zkvlc_settings.Upgrading.Mult_Legendary.tooltip"] = "?????????????????????????????????",

         -- Upgrading Caps
         ["zkvlc_settings.category.upgrading_caps"] = "??????????????????",
         ["zkvlc_settings.category.upgrading_caps_iconic"] = "??????????????????(????????????)",

         ["zkvlc_settings.Upgrading.Cap_Total.label"] = "????????????????????????????????????",
         ["zkvlc_settings.Upgrading.Cap_Total.tooltip"] = "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????5???????????????5???????????????????????????",

         ["zkvlc_settings.Upgrading.Cap_Common.label"] = "????????????????????????????????????",
         ["zkvlc_settings.Upgrading.Cap_Common.tooltip"] = "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????5???????????????5???????????????????????????",

         ["zkvlc_settings.Upgrading.Cap_Uncommon.label"] = "????????????????????????????????????",
         ["zkvlc_settings.Upgrading.Cap_Uncommon.tooltip"] = "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????5???????????????5???????????????????????????",

         ["zkvlc_settings.Upgrading.Cap_Rare.label"] = "????????????????????????????????????",
         ["zkvlc_settings.Upgrading.Cap_Rare.tooltip"] = "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????5???????????????5???????????????????????????",

         ["zkvlc_settings.Upgrading.Cap_Epic.label"] = "????????????????????????????????????",
         ["zkvlc_settings.Upgrading.Cap_Epic.tooltip"] = "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????5???????????????5???????????????????????????",

         ["zkvlc_settings.Upgrading.Cap_Legendary.label"] = "????????????????????????????????????",
         ["zkvlc_settings.Upgrading.Cap_Legendary.tooltip"] = "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????5???????????????5???????????????????????????",

         -- Capacity Settings
         ["zkvlc_settings.category.capacity_limits"] = "????????????",
         ["zkvlc_settings.category.capacity_limits_grenades"] = "????????????-??????",
         ["zkvlc_settings.category.capacity_limits_healing"] = "????????????-?????????",
         ["zkvlc_settings.category.capacity_limits_ammo"] = "????????????-??????",

         ["zkvlc_settings.Capacity.Limit.label"] = "??????????????????",
         ["zkvlc_settings.Capacity.Limit.tooltip"] = "?????????????????????????????????????????????????????????????????????????????????",

         ["zkvlc_settings.Capacity.ScrapExcess.label"] = "??????????????????",
         ["zkvlc_settings.Capacity.ScrapExcess.tooltip"] = "???????????????????????????????????????????????????????????????????????????????????????",

         ["zkvlc_settings.Capacity.Limit_Grenades.label"] = "??????????????????(????????????)",
         ["zkvlc_settings.Capacity.Limit_Grenades.tooltip"] = "??????????????????????????????????????????????????????????????????-1????????????",

         ["zkvlc_settings.Capacity.Limit_Injectors.label"] = "?????????????????????(????????????)",
         ["zkvlc_settings.Capacity.Limit_Injectors.tooltip"] = "????????????????????????????????????????????????????????????-1????????????",

         ["zkvlc_settings.Capacity.Limit_Inhalers.label"] = "?????????????????????(????????????)",
         ["zkvlc_settings.Capacity.Limit_Inhalers.tooltip"] = "????????????????????????????????????????????????????????????-1????????????",

         ["zkvlc_settings.Capacity.Limit_Ammo_Handgun.label"] = "??????????????????",
         ["zkvlc_settings.Capacity.Limit_Ammo_Handgun.tooltip"] = "????????????????????????????????????????????????-1????????????",

         ["zkvlc_settings.Capacity.Limit_Ammo_Rifle.label"] = "??????????????????",
         ["zkvlc_settings.Capacity.Limit_Ammo_Rifle.tooltip"] = "????????????????????????????????????????????????-1????????????",

         ["zkvlc_settings.Capacity.Limit_Ammo_Shotgun.label"] = "?????????????????????",
         ["zkvlc_settings.Capacity.Limit_Ammo_Shotgun.tooltip"] = "???????????????????????????????????????????????????-1????????????",

         ["zkvlc_settings.Capacity.Limit_Ammo_Sniper.label"] = "????????????????????????",
         ["zkvlc_settings.Capacity.Limit_Ammo_Sniper.tooltip"] = "??????????????????????????????????????????????????????-1????????????",
     }
     AddStringsForLanguage("zh-cn", strings_ZHCN)

    -- ====================================================================================================================

    -- Chinese (TW)
    local strings_ZHTW = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("zh-tw", strings_ZHTW)

    -- ====================================================================================================================
end
