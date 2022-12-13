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
local Crafting = {}
ZKVLC:AddModule("Crafting", Crafting)

function Crafting.Callback_Common( configKey, newValue )
    if newValue == nil then
        newValue = utils.Config.GetValue(configKey, nil)
        if newValue == nil then
            utils.warning("Failed to get value for configKey:", configKey)
            return false
        end
    else
        utils.Config.SetValue(configKey, newValue)
    end
    return Crafting.Callback_Multipliers()
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

function Crafting.Callback_Multipliers()
    -- TODO: Refactor this. Wasteful table accesses. Share code with upgrading.
    local mults = {
        global = ZKVLC.Config.GetValue("Crafting_Mult_All", 1.0),
        common = ZKVLC.Config.GetValue("Crafting_Mult_Common", 1.0),
        uncommon = ZKVLC.Config.GetValue("Crafting_Mult_Uncommon", 1.0),
        rare = ZKVLC.Config.GetValue("Crafting_Mult_Rare", 1.0),
        epic = ZKVLC.Config.GetValue("Crafting_Mult_Epic", 1.0),
        legendary = ZKVLC.Config.GetValue("Crafting_Mult_Legendary", 1.0),

        common_components = ZKVLC.Config.GetValue("Crafting_Mult_Common_components", 1.0),
        uncommon_components = ZKVLC.Config.GetValue("Crafting_Mult_Uncommon_components", 1.0),
        rare_components = ZKVLC.Config.GetValue("Crafting_Mult_Rare_components", 1.0),
        epic_components = ZKVLC.Config.GetValue("Crafting_Mult_Epic_components", 1.0),
        legendary_components = ZKVLC.Config.GetValue("Crafting_Mult_Legendary_components", 1.0),
    }

    local function getComponentRarityMult( flatKey )
        flatKey = GetIngredientFlatKeyFromAmountFlatKey(flatKey)
        local ingredient = TweakDB:GetFlat(flatKey).value

        local rarity = utils.String.GetItemRarityFromKey(ingredient)
        -- utils.debug("getComponentRarityMult", flatKey, ingredient, rarity)
        local rarityMult = 1.0
        if rarity then
            rarityMult = mults[rarity .. "_components"]
        end
        return rarityMult
    end

    local function getRarityMult( flatKey )
        local rarity = utils.String.GetItemRarityFromKey(flatKey)
        local rarityMult = 1.0
        if rarity then
            rarityMult = mults[rarity]
        end
        return rarityMult
    end

    local allSuccesses = true

    local function applyMults( flatKey, base )
        local rarityMult = getRarityMult(flatKey)
        local final = base * mults["global"] * rarityMult

        local componentRarityMult = getComponentRarityMult(flatKey)
        final = final * componentRarityMult

        final = utils.Round(final, 0)
        local success = TweakDB:SetFlat(flatKey, final)
        if not success then
            utils.printError("Failed to SetFlat:", "'" .. flatKey .. "'", final)
            allSuccesses = false
        end
    end

    for flatKey, base in pairs(constants.Crafting.CDPR_Defaults) do
        applyMults(flatKey, base)
    end

    return allSuccesses
end

function Crafting:Init()
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Global", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_All", newValue)
        end
    )

    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Common_components", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Common_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Uncommon_components", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Uncommon_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Rare_components", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Rare_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Epic_components", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Epic_components", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Legendary_components", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Legendary_components", newValue)
        end
    )

    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Common", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Common", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Uncommon", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Uncommon", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Rare", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Rare", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Epic", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Epic", newValue)
        end
    )
    utils.Config.AddCallback(
        "Callback_Crafting_Mult_Legendary", function( newValue )
            Crafting.Callback_Common("Crafting_Mult_Legendary", newValue)
        end
    )
end
