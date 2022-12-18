local ZKVLC = GetMod("ZKVLC")
-- ====================================================================================================================
-- ZKVLC for CP2077 by Kvalyr
-- ====================================================================================================================
local strlower = string.lower
-- ====================================================================================================================
local utils = ZKVLC.utils
-- local i18n = utils.i18n

local ZKVLC_Settings = {}
-- ZKVLC.Settings = ZKVLC_Settings
ZKVLC:AddModule("Settings", ZKVLC_Settings)
local constants = ZKVLC.constants

-- ====================================================================================================================

function ZKVLC:LoadSettings()
    return utils.Settings.Load()
end

function ZKVLC:SaveSettings()
    return utils.Settings.Save()
end

function ZKVLC_Settings.SetupNativeSettingsUIWidgets()

    local modPathPrefix = "zkvlc_"
    local subcategories = {
        "capacity_limits",
        "capacity_limits_grenades",
        "capacity_limits_healing",
        "capacity_limits_ammo",
        "crafting",
        "crafting_equipment",
        "upgrading",
        "upgrading_equipment",
        "upgrading_caps",
        "upgrading_caps_iconic",
        "general",
    }

    for _, key in pairs(subcategories) do
        utils.NativeSettings.AddSubCategory(modPathPrefix .. key, modPathPrefix .. "settings.category." .. key, "")
    end

    -- local switcher = utils.NativeSettings.AddProfileSwitcher(
    --     modPathPrefix .. "general",
    --     modPathPrefix .. "settings.General.ProfileSwitcher",
    --     1,
    --     1,
    --     nil,
    --     ZKVLC.profilesKeys
    -- )
    -- utils.Config.StoreWidget("ActiveProfile", switcher)

    -- Capacity Limits

    utils.Settings.AddSettingWithGenericSetFlatCallback(
        modPathPrefix .. "capacity_limits",
        modPathPrefix .. "settings.Capacity.Limit",
        "CapacityLimiter_Limit",
        "switch",
        { default = false },
        "ZKVLC.Config:CapacityLimiter.limit"
    )

    utils.Settings.AddSettingWithGenericSetFlatCallback(
        modPathPrefix .. "capacity_limits",
        modPathPrefix .. "settings.Capacity.ScrapExcess",
        "CapacityLimiter_ScrapExcess",
        "switch",
        { default = false },
        "ZKVLC.Config:CapacityLimiter.scrapExcess"
    )

    -- Grenades
    utils.Settings.AddSettingWithGenericSetFlatCallback(
        modPathPrefix .. "capacity_limits_grenades",
        modPathPrefix .. "settings.Capacity.Limit_Grenades",
        "CapacityLimiter_Consumable_Grenades",
        "sliderint",
        { default = 10, sliderMin = -1, sliderMax = 100, sliderStep = 1},
        "ZKVLC.Config:CapacityLimiter.limit_grenades"
    )

    -- Healing
    utils.Settings.AddSettingWithGenericSetFlatCallback(
        modPathPrefix .. "capacity_limits_healing",
        modPathPrefix .. "settings.Capacity.Limit_Injectors",
        "CapacityLimiter_Consumable_Injectors",
        "sliderint",
        { default = 10, sliderMin = -1, sliderMax = 100, sliderStep = 1},
        "ZKVLC.Config:CapacityLimiter.limit_injectors"
    )

    utils.Settings.AddSettingWithGenericSetFlatCallback(
        modPathPrefix .. "capacity_limits_healing",
        modPathPrefix .. "settings.Capacity.Limit_Inhalers",
        "CapacityLimiter_Consumable_Inhalers",
        "sliderint",
        { default = 10, sliderMin = -1, sliderMax = 100, sliderStep = 1},
        "ZKVLC.Config:CapacityLimiter.limit_inhalers"
    )

    -- Ammo

    utils.Settings.AddSetting(
        modPathPrefix .. "capacity_limits_ammo",
        modPathPrefix .. "settings.Capacity.Limit_Ammo_Handgun",
        "CapacityLimiter_Ammo_Handgun",
        "sliderint",
        { default = 500, sliderMin = -1, sliderMax = 1000, sliderStep = 5},
        "Callback_CapacityLimiter_Ammo_Handgun"
    )

    utils.Settings.AddSetting(
        modPathPrefix .. "capacity_limits_ammo",
        modPathPrefix .. "settings.Capacity.Limit_Ammo_Rifle",
        "CapacityLimiter_Ammo_Rifle",
        "sliderint",
        { default = 700, sliderMin = -1, sliderMax = 1000, sliderStep = 5},
        "Callback_CapacityLimiter_Ammo_Rifle"
    )

    utils.Settings.AddSetting(
        modPathPrefix .. "capacity_limits_ammo",
        modPathPrefix .. "settings.Capacity.Limit_Ammo_Shotgun",
        "CapacityLimiter_Ammo_Shotgun",
        "sliderint",
        { default = 100, sliderMin = -1, sliderMax = 1000, sliderStep = 5},
        "Callback_CapacityLimiter_Ammo_Shotgun"
    )

    utils.Settings.AddSetting(
        modPathPrefix .. "capacity_limits_ammo",
        modPathPrefix .. "settings.Capacity.Limit_Ammo_Sniper",
        "CapacityLimiter_Ammo_Sniper",
        "sliderint",
        { default = 100, sliderMin = -1, sliderMax = 1000, sliderStep = 5},
        "Callback_CapacityLimiter_Ammo_Sniper"
    )

    -- Crafting
    local craftingSliderMax = 10
    local upgradingSliderMax = 10
    local sliderStep = 0.05
    local sliderFormat = "%.2f"

    utils.Settings.AddSetting(
        modPathPrefix .. "crafting",
        modPathPrefix .. "settings.Crafting.Mult_All",
        "Crafting_Mult_All",
        "sliderfloat",
        { default = 1, sliderMin = 0, sliderMax = craftingSliderMax, sliderStep = sliderStep, sliderFormat = sliderFormat},
        "Callback_Crafting_Mult_Global"
    )

    for _, rarity in ipairs(constants.itemRarities) do
        utils.Settings.AddSetting(
            modPathPrefix .. "crafting",
            modPathPrefix .. "settings.Crafting.Mult_" .. rarity .. "_components",
            "Crafting_Mult_" .. rarity .. "_components",
            "sliderfloat",
            { default = 1, sliderMin = 0, sliderMax = craftingSliderMax, sliderStep = sliderStep, sliderFormat = sliderFormat},
            "Callback_Crafting_Mult_" .. rarity .. "_components"
        )
    end

    for _, rarity in ipairs(constants.itemRarities) do
        utils.Settings.AddSetting(
            modPathPrefix .. "crafting_equipment",
            modPathPrefix .. "settings.Crafting.Mult_" .. rarity,
            "Crafting_Mult_" .. rarity,
            "sliderfloat",
            { default = 1, sliderMin = 0, sliderMax = craftingSliderMax, sliderStep = sliderStep, sliderFormat = sliderFormat},
            "Callback_Crafting_Mult_" .. rarity
        )
    end


    -- Upgrading

    utils.Settings.AddSetting(
        modPathPrefix .. "upgrading",
        modPathPrefix .. "settings.Upgrading.Mult_All",
        "Upgrading_Mult_All",
        "sliderfloat",
        { default = 1, sliderMin = 0, sliderMax = upgradingSliderMax, sliderStep = sliderStep, sliderFormat = sliderFormat},
        "Callback_Upgrading_Mult_Global" -- "ZKVLC.Config:Upgrading.Mult_All"
    )

    for _, rarity in ipairs(constants.itemRarities) do
        utils.Settings.AddSetting(
            modPathPrefix .. "upgrading",
            modPathPrefix .. "settings.Upgrading.Mult_" .. rarity .. "_components",
            "Upgrading_Mult_" .. rarity .. "_components",
            "sliderfloat",
            { default = 1, sliderMin = 0, sliderMax = upgradingSliderMax, sliderStep = sliderStep, sliderFormat = sliderFormat},
            "Callback_Upgrading_Mult_" .. rarity .. "_components"
        )
    end

    for _, rarity in ipairs(constants.itemRarities) do
        utils.Settings.AddSetting(
            modPathPrefix .. "upgrading_equipment",
            modPathPrefix .. "settings.Upgrading.Mult_" .. rarity,
            "Upgrading_Mult_" .. rarity,
            "sliderfloat",
            { default = 1, sliderMin = 0, sliderMax = upgradingSliderMax, sliderStep = sliderStep, sliderFormat = sliderFormat},
            "Callback_Upgrading_Mult_" .. rarity
        )
    end

    local upgradingCapDefault = 50
    local upgradingCapSliderMax = 50

    utils.Settings.AddSettingWithGenericSetFlatCallback(
        modPathPrefix .. "upgrading_caps",
        modPathPrefix .. "settings.Upgrading.Cap_Total",
        "Upgrading_Cap_Total",
        "sliderint",
        { default = upgradingCapDefault, sliderMin = 1, sliderMax = upgradingCapSliderMax, sliderStep = 1},
        "ZKVLC.Config:Upgrading.Cap:Total"
    )

    for _, rarity in ipairs(constants.itemRarities) do
        utils.Settings.AddSettingWithGenericSetFlatCallback(
            modPathPrefix .. "upgrading_caps",
            modPathPrefix .. "settings.Upgrading.Cap_" .. rarity,
            "Upgrading_Cap_" .. rarity,
            "sliderint",
            { default = upgradingCapDefault, sliderMin = 1, sliderMax = upgradingCapSliderMax, sliderStep = 1},
            "ZKVLC.Config:Upgrading.Cap:" .. rarity
        )
    end

    -- Iconics
    utils.Settings.AddSettingWithGenericSetFlatCallback(
        modPathPrefix .. "upgrading_caps_iconic",
        modPathPrefix .. "settings.Upgrading.Cap_Total", -- Reuses string from non-iconic
        "Upgrading_Cap_Total_Iconic",
        "sliderint",
        { default = upgradingCapDefault, sliderMin = 1, sliderMax = upgradingCapSliderMax, sliderStep = 1},
        "ZKVLC.Config:Upgrading.Cap:Total_Iconic"
    )

    for _, rarity in ipairs(constants.itemRarities) do
        utils.Settings.AddSettingWithGenericSetFlatCallback(
            modPathPrefix .. "upgrading_caps_iconic",
            modPathPrefix .. "settings.Upgrading.Cap_" .. rarity, -- Reuses string from non-iconic
            "Upgrading_Cap_" .. rarity .. "_Iconic",
            "sliderint",
            { default = upgradingCapDefault, sliderMin = 1, sliderMax = upgradingCapSliderMax, sliderStep = 1},
            "ZKVLC.Config:Upgrading.Cap:" .. rarity .. "_Iconic"
        )
    end


    local copyButton = utils.NativeSettings.nativeSettings.addButton(
        ZKVLC.nativeSettingsBasePath .. "/" .. modPathPrefix .. "general",
        "Use settings from Kvalyr Profile",
        "Click this button to copy all settings from the Kvalyr balance profile. WARNING: Any other changes you've made to settings will be lost.",
        "Kvalyr Profile",
        35,
        function()
            utils.Settings.SwitchProfileByKey("Kvalyr")
            utils.Settings.CopyToUserProfile()
            utils.Settings.SwitchProfileByKey("User")
            utils.NativeSettings.nativeSettings.refresh()
        end
    )

end

-- GetMod("ZKV_Takedowns").Settings:Debug()
function ZKVLC_Settings:Init()
    utils.NativeSettings:Init()

    ZKVLC:LoadSettings()
    utils.pcall(ZKVLC_Settings.SetupNativeSettingsUIWidgets)
end

-- ====================================================================================================================
