-- ====================================================================================================================
-- ZKVLC for CP2077 by Kvalyr
-- ====================================================================================================================
local strlower = string.lower
local strlen = string.len
local gsub = string.gsub
-- ====================================================================================================================
local ZKVLC = GetMod("ZKVLC")
local utils = ZKVLC.utils
local constants = ZKVLC.constants
local Limits = {}
ZKVLC:AddModule("Limits", Limits)

function Limits.Callback_Common( configKey, flatKey, newValue )
    if newValue == nil then
        newValue = utils.Config.GetValue(configKey, nil)
        if newValue == nil then
            utils.warning("Failed to get value for configKey:", configKey)
            return false
        end
    else
        utils.Config.SetValue(configKey, newValue)
    end
    return utils.TweakDB.SetQuantityFlat(flatKey, newValue)
end

function Limits.SetLimit_Ammo_Handgun( newValue )
    return Limits.Callback_Common("CapacityLimiter_Ammo_Handgun", "Ammo.HandgunAmmo_inline0.value", newValue)
end

function Limits.SetLimit_Ammo_Rifle( newValue )
    return Limits.Callback_Common("CapacityLimiter_Ammo_Rifle", "Ammo.RifleAmmo_inline0.value", newValue)
end

function Limits.SetLimit_Ammo_Shotgun( newValue )
    return Limits.Callback_Common("CapacityLimiter_Ammo_Shotgun", "Ammo.ShotgunAmmo_inline0.value", newValue)
end

function Limits.SetLimit_Ammo_Sniper( newValue )
    return Limits.Callback_Common("CapacityLimiter_Ammo_Shotgun", "Ammo.SniperRifleAmmo_inline0.value", newValue)
end

function Limits:Init()
    utils.Config.AddCallback("Callback_CapacityLimiter_Ammo_Handgun", Limits.SetLimit_Ammo_Handgun)
    utils.Config.AddCallback("Callback_CapacityLimiter_Ammo_Rifle", Limits.SetLimit_Ammo_Rifle)
    utils.Config.AddCallback("Callback_CapacityLimiter_Ammo_Shotgun", Limits.SetLimit_Ammo_Shotgun)
    utils.Config.AddCallback("Callback_CapacityLimiter_Ammo_Shotgun", Limits.SetLimit_Ammo_Sniper)
end

function Limits.ApplyLimits_Ammo()
    Limits.SetLimit_Ammo_Handgun(nil)
    Limits.SetLimit_Ammo_Rifle(nil)
    Limits.SetLimit_Ammo_Shotgun(nil)
    Limits.SetLimit_Ammo_Sniper(nil)
end
