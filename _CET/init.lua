-- ====================================================================================================================
-- ZKVLC for CP2077 by Kvalyr
-- ====================================================================================================================
local version = "0.1.3"
local modString = "ZKVLC v" .. version
local ZKVLC = {
    name = "ZKVLC",
    version = version,
    modString = modString,
    description = modString .. " - Loot & Crafting Overhaul for CP2077 - Version: " .. version,
    descSimple = "Loot & Crafting Overhaul",
    nativeSettingsBasePath = "/ZKVLC",
    nativeSettingsTabLabel = "ZKVLC",
    -- nativeSettingsTabi18nKey = "zkvlc_settings.tab",
    configFileName = "config.json",
    displayName = "ZKVLC - Loot & Crafting Overhaul",
    profiles = {
        User = "config.json",
        Kvalyr = "profile_kvalyr.json",
        ["CP2077 v1.61"] = "profile_cdpr_1_61.json"
    },
    archive_files = {
    },
}
ZKVLC.debugMode = true
ZKVLC.version = version
ZKVLC.modString = modString

local utils = assert(loadfile("utils/main.lua"))(ZKVLC)
utils.ClearLog() -- Clear the log file for a new startup

-- ====================================================================================================================

local function SetupLocalization()
    ZKVLC.debug("SetupLocalization")

    ZKVLC:InitModule("i18n_strings")
end

local function SetupConfig()
    ZKVLC.debug("SetupConfig")

    ZKVLC:InitModule("ConfigDefaults")
end

local function SetupSettings()
    ZKVLC.debug("SetupSettings")

    ZKVLC:InitModule("Settings")
end

local function SetupUpgrading()
    ZKVLC.debug("SetupUpgrading")

    ZKVLC:InitModule("Upgrading")
end

local function SetupCrafting()
    ZKVLC.debug("SetupCrafting")

    ZKVLC:InitModule("Crafting")
end

local function onInit()
    if not utils.Init() then
        print("ZKVLC: Failed to initialize mod - Please check for error messages above.")
        return
    end
    ZKVLC.debug("onInit")
    utils.doFile("debug/debug.lua")

    utils.doFile("constants.lua")

    utils.doFile("i18n/i18n_strings.lua")

    utils.doFile("settings/config_defaults.lua")
    utils.doFile("settings/settings.lua")

    utils.doFile("upgrading/upgrading.lua")
    utils.doFile("crafting/crafting.lua")

    utils.pcall(SetupConfig)
    utils.pcall(SetupLocalization)
    utils.pcall(SetupCrafting)
    utils.pcall(SetupUpgrading)
    utils.pcall(SetupSettings)
    utils.Settings.LoadActiveProfile()
end

function ZKVLC:New()
    registerForEvent("onInit", function() utils.ModInit(onInit) end)

    return ZKVLC
end

return ZKVLC:New()
