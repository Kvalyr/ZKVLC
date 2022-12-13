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
local Upgrading = {}
ZKVLC:AddModule("Upgrading", Upgrading)

function Upgrading.Callback_Common( configKey, newValue )
    if newValue == nil then
        newValue = utils.Config.GetValue(configKey, nil)
        if newValue == nil then
            utils.warning("Failed to get value for configKey:", configKey)
            return false
        end
    else
        utils.Config.SetValue(configKey, newValue)
    end
    return Upgrading.Callback_Multipliers()
end

local function GetIngredientFlatKeyFromAmountFlatKey( flatKey )
    if utils.String.EndsWith(flatKey, ".amount") then
        flatKey = gsub(flatKey, ".amount", ".ingredient")
    end
    if not utils.String.EndsWith(flatKey, ".ingredient") then
        utils.debug("GetIngredientFlatKeyFromAmountFlatKey invalid flatKey:", flatKey)
        return
    end
    return flatKey
end

function Upgrading.Callback_Multipliers()
    -- TODO: Refactor this. Wasteful table accesses. Share code with crafting.
    local mults = {
        global = ZKVLC.Config.GetValue("Upgrading_Mult_All", 1.0),
        common = ZKVLC.Config.GetValue("Upgrading_Mult_Common", 1.0),
        uncommon = ZKVLC.Config.GetValue("Upgrading_Mult_Uncommon", 1.0),
        rare = ZKVLC.Config.GetValue("Upgrading_Mult_Rare", 1.0),
        epic = ZKVLC.Config.GetValue("Upgrading_Mult_Epic", 1.0),
        legendary = ZKVLC.Config.GetValue("Upgrading_Mult_Legendary", 1.0),

        common_components = ZKVLC.Config.GetValue("Upgrading_Mult_Common_components", 1.0),
        uncommon_components = ZKVLC.Config.GetValue("Upgrading_Mult_Uncommon_components", 1.0),
        rare_components = ZKVLC.Config.GetValue("Upgrading_Mult_Rare_components", 1.0),
        epic_components = ZKVLC.Config.GetValue("Upgrading_Mult_Epic_components", 1.0),
        legendary_components = ZKVLC.Config.GetValue("Upgrading_Mult_Legendary_components", 1.0),
    }

    local function getComponentRarityMult( flatKey )
        flatKey = GetIngredientFlatKeyFromAmountFlatKey(flatKey)
        local ingredient = TweakDB:GetFlat(flatKey).value

        local rarity = utils.String.GetItemRarityFromKey(ingredient)
        local rarityMult = 1.0
        if rarity then
            rarityMult = mults[rarity .. "_components"]
        end
        return rarityMult
    end

    local function getRarityMult( flatKey, components )
        local rarity = utils.String.GetItemRarityFromKey(flatKey)
        local rarityMult = 1.0
        if rarity then
            if components then
                rarity = rarity .. "_components"
            end
            rarityMult = mults[rarity]
        end
        return rarityMult
    end

    local allSuccesses = true

    -- local function applyMultToComponent(flatKey, base)
    -- end

    local function applyMults( flatKey, base )
        local rarityMult = getRarityMult(flatKey)
        local final = base * mults["global"] * rarityMult

        -- utils.debug("applyMults", flatKey, base)

        local componentRarityMult = getComponentRarityMult(flatKey)
        final = final * componentRarityMult

        final = utils.Round(final, 0)
        local success = TweakDB:SetFlat(flatKey, final)
        if not success then
            utils.printError("Failed to SetFlat:", "'" .. flatKey .. "'", final)
            allSuccesses = false
        end
    end

    for flatKey, base in pairs(constants.Upgrading.CDPR_Defaults) do
        applyMults(flatKey, base)
    end

    return allSuccesses
end

function Upgrading:Init()
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Global", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_All", newValue)
        end
    )

    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Common_components", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Common_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Uncommon_components", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Uncommon_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Rare_components", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Rare_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Epic_components", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Epic_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Legendary_components", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Legendary_components", newValue)
        end
    )

    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Common", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Common", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Uncommon", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Uncommon", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Rare", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Rare", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Epic", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Epic", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Upgrading_Mult_Legendary", function( newValue )
            Upgrading.Callback_Common("Upgrading_Mult_Legendary", newValue)
        end
    )
end
