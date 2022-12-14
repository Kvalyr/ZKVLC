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

    -- العربية
    local strings_AR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("ar-ar", strings_AR)

    -- ====================================================================================================================

    -- Čeština
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

    -- Español
    local strings_ES = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("es-es", strings_ES)

    -- ====================================================================================================================

    -- Español de Latinoamérica
    local strings_ESMX = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("es-mx", strings_ESMX)

    -- ====================================================================================================================

    -- Français
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

    -- 日本語
    local strings_JP = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("jp-jp", strings_JP)

    -- ====================================================================================================================

    -- 한국인
    local strings_KR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("kr-kr", strings_KR)

    -- ====================================================================================================================

    -- Português brasileiro
    local strings_PTBR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("pt-br", strings_PTBR)

    -- ====================================================================================================================

    -- Русский
    local strings_RU = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("ru-ru", strings_RU)

    -- ====================================================================================================================

    -- ชาวไทย
    local strings_TH = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("th-th", strings_TH)

    -- ====================================================================================================================

    -- Türkçe
    local strings_TR = {
        -- TODO: Using strings_EN as a reference, add translation strings here
    }
    AddStringsForLanguage("tr-tr", strings_TR)

    -- ====================================================================================================================

    -- Chinese (PRC)
    -- Translation submitted by Zo7lin @ NexusMods
    local strings_ZHCN = {
        ["zkvlc_settings.tab"] = "自定义成本",
         ["zkvlc_settings.category.general"] = "总体",
         ["zkvlc_settings.General.ProfileSwitcher.label"] = "开关配置文件",
         ["zkvlc_settings.General.ProfileSwitcher.tooltip"] = "选择用户配置，Kvalyr的自定义数值或游戏原版默认值\n注意:设置更改仅在“User”配置文件处于激活状态时保存",

         -- Crafting Settings
         ["zkvlc_settings.category.crafting"] = "制作资源倍数-组件",
         ["zkvlc_settings.category.crafting_equipment"] = "制作资源倍数-物品稀有度",

         ["zkvlc_settings.Crafting.Mult_All.label"] = "制作材料花费-总体",
         ["zkvlc_settings.Crafting.Mult_All.tooltip"] = "制造所需材料的倍数，下面的滑块进一步乘以此项",

         ["zkvlc_settings.Crafting.Mult_Common_components.label"] = "材料成本-普通组件",
         ["zkvlc_settings.Crafting.Mult_Common_components.tooltip"] = "所需的普通组件的倍数",

         ["zkvlc_settings.Crafting.Mult_Uncommon_components.label"] = "材料成本-精良组件",
         ["zkvlc_settings.Crafting.Mult_Uncommon_components.tooltip"] = "所需的精良组件的倍数",

         ["zkvlc_settings.Crafting.Mult_Rare_components.label"] = "材料成本-稀有组件",
         ["zkvlc_settings.Crafting.Mult_Rare_components.tooltip"] = "所需的稀有组件的倍数",

         ["zkvlc_settings.Crafting.Mult_Epic_components.label"] = "材料成本-史诗组件",
         ["zkvlc_settings.Crafting.Mult_Epic_components.tooltip"] = "所需的史诗组件的倍数",

         ["zkvlc_settings.Crafting.Mult_Legendary_components.label"] = "材料成本-传说组件",
         ["zkvlc_settings.Crafting.Mult_Legendary_components.tooltip"] = "所需的传说组件的倍数",

         -- Crafting - Equipment
         ["zkvlc_settings.Crafting.Mult_Common.label"] = "材料成本-普通装备",
         ["zkvlc_settings.Crafting.Mult_Common.tooltip"] = "所需的普通制作材料倍数",

         ["zkvlc_settings.Crafting.Mult_Uncommon.label"] = "材料成本-精良装备",
         ["zkvlc_settings.Crafting.Mult_Uncommon.tooltip"] = "所需的精良制作材料倍数",

         ["zkvlc_settings.Crafting.Mult_Rare.label"] = "材料成本-稀有装备",
         ["zkvlc_settings.Crafting.Mult_Rare.tooltip"] = "所需的稀有制作材料倍数",

         ["zkvlc_settings.Crafting.Mult_Epic.label"] = "材料成本-史诗装备",
         ["zkvlc_settings.Crafting.Mult_Epic.tooltip"] = "所需的史诗制作材料倍数",

         ["zkvlc_settings.Crafting.Mult_Legendary.label"] = "材料成本-传说装备",
         ["zkvlc_settings.Crafting.Mult_Legendary.tooltip"] = "所需的传说制作材料倍数",

         -- Upgrading Settings
         ["zkvlc_settings.category.upgrading"] = "升级资源倍数-组件",

         ["zkvlc_settings.Upgrading.Mult_Common_components.label"] = "材料成本-普通组件",
         ["zkvlc_settings.Upgrading.Mult_Common_components.tooltip"] = "所需普通升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Uncommon_components.label"] = "材料成本-精良组件",
         ["zkvlc_settings.Upgrading.Mult_Uncommon_components.tooltip"] = "所需精良升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Rare_components.label"] = "材料成本-稀有组件",
         ["zkvlc_settings.Upgrading.Mult_Rare_components.tooltip"] = "所需稀有升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Epic_components.label"] = "材料成本-史诗组件",
         ["zkvlc_settings.Upgrading.Mult_Epic_components.tooltip"] = "所需史诗升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Legendary_components.label"] = "材料成本-传说组件",
         ["zkvlc_settings.Upgrading.Mult_Legendary_components.tooltip"] = "所需传说升级材料的倍数",

         -- Upgrading - Equipment
         ["zkvlc_settings.category.upgrading_equipment"] = "升级资源倍数-物品稀有度",

         ["zkvlc_settings.Upgrading.Mult_All.label"] = "升级材料成本-总体",
         ["zkvlc_settings.Upgrading.Mult_All.tooltip"] = "升级所需材料的倍数，下面的滑块进一步增加此项",

         ["zkvlc_settings.Upgrading.Mult_Common.label"] = "材料成本-普通装备",
         ["zkvlc_settings.Upgrading.Mult_Common.tooltip"] = "所需普通升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Uncommon.label"] = "材料成本-精良装备",
         ["zkvlc_settings.Upgrading.Mult_Uncommon.tooltip"] = "所需精良升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Rare.label"] = "材料成本-稀有装备",
         ["zkvlc_settings.Upgrading.Mult_Rare.tooltip"] = "所需稀有升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Epic.label"] = "材料成本-史诗装备",
         ["zkvlc_settings.Upgrading.Mult_Epic.tooltip"] = "所需史诗升级材料的倍数",

         ["zkvlc_settings.Upgrading.Mult_Legendary.label"] = "材料成本-传说装备",
         ["zkvlc_settings.Upgrading.Mult_Legendary.tooltip"] = "所需传说升级材料的倍数",

         -- Upgrading Caps
         ["zkvlc_settings.category.upgrading_caps"] = "升级成本上限",
         ["zkvlc_settings.category.upgrading_caps_iconic"] = "升级成本上限(不朽武器)",

         ["zkvlc_settings.Upgrading.Cap_Total.label"] = "升级成本上限——所有材料",
         ["zkvlc_settings.Upgrading.Cap_Total.tooltip"] = "升级物品的成本通常因随着每次升级而增加；此设置控制升级的成本何时停止增加（如：如设为5，则成本在5次升级后保持不变）",

         ["zkvlc_settings.Upgrading.Cap_Common.label"] = "升级成本上限——普通材料",
         ["zkvlc_settings.Upgrading.Cap_Common.tooltip"] = "升级物品的成本通常因随着每次升级而增加；此设置控制升级的成本何时停止增加（如：如设为5，则成本在5次升级后保持不变）",

         ["zkvlc_settings.Upgrading.Cap_Uncommon.label"] = "升级成本上限——精良材料",
         ["zkvlc_settings.Upgrading.Cap_Uncommon.tooltip"] = "升级物品的成本通常因随着每次升级而增加；此设置控制升级的成本何时停止增加（如：如设为5，则成本在5次升级后保持不变）",

         ["zkvlc_settings.Upgrading.Cap_Rare.label"] = "升级成本上限——稀有材料",
         ["zkvlc_settings.Upgrading.Cap_Rare.tooltip"] = "升级物品的成本通常因随着每次升级而增加；此设置控制升级的成本何时停止增加（如：如设为5，则成本在5次升级后保持不变）",

         ["zkvlc_settings.Upgrading.Cap_Epic.label"] = "升级成本上限——史诗材料",
         ["zkvlc_settings.Upgrading.Cap_Epic.tooltip"] = "升级物品的成本通常因随着每次升级而增加；此设置控制升级的成本何时停止增加（如：如设为5，则成本在5次升级后保持不变）",

         ["zkvlc_settings.Upgrading.Cap_Legendary.label"] = "升级成本上限——传说材料",
         ["zkvlc_settings.Upgrading.Cap_Legendary.tooltip"] = "升级物品的成本通常因随着每次升级而增加；此设置控制升级的成本何时停止增加（如：如设为5，则成本在5次升级后保持不变）",

         -- Capacity Settings
         ["zkvlc_settings.category.capacity_limits"] = "容量限制",
         ["zkvlc_settings.category.capacity_limits_grenades"] = "容量限制-手雷",
         ["zkvlc_settings.category.capacity_limits_healing"] = "容量限制-医疗品",
         ["zkvlc_settings.category.capacity_limits_ammo"] = "容量限制-弹药",

         ["zkvlc_settings.Capacity.Limit.label"] = "物品容量限制",
         ["zkvlc_settings.Capacity.Limit.tooltip"] = "控制物品容量限制的主开关；如启用，则多余的物品将被丢弃",

         ["zkvlc_settings.Capacity.ScrapExcess.label"] = "分解多余物品",
         ["zkvlc_settings.Capacity.ScrapExcess.tooltip"] = "如你有“变废为宝”技能，则分解多余的物品（而不是丢弃它们）",

         ["zkvlc_settings.Capacity.Limit_Grenades.label"] = "手雷携带限制(所有类型)",
         ["zkvlc_settings.Capacity.Limit_Grenades.tooltip"] = "你能携带的每种类型和品质的手雷最大数量；设为-1则为无限",

         ["zkvlc_settings.Capacity.Limit_Injectors.label"] = "注射器携带限制(所有品质)",
         ["zkvlc_settings.Capacity.Limit_Injectors.tooltip"] = "每个品质的注射器所能携带的最大数量；设为-1则为无限",

         ["zkvlc_settings.Capacity.Limit_Inhalers.label"] = "吸入器携带限制(所有品质)",
         ["zkvlc_settings.Capacity.Limit_Inhalers.tooltip"] = "每个品质的吸入器所能携带的最大数量；设为-1则为无限",

         ["zkvlc_settings.Capacity.Limit_Ammo_Handgun.label"] = "手枪弹药限制",
         ["zkvlc_settings.Capacity.Limit_Ammo_Handgun.tooltip"] = "手枪弹药所能携带的最大数量；设为-1则为无限",

         ["zkvlc_settings.Capacity.Limit_Ammo_Rifle.label"] = "步枪弹药限制",
         ["zkvlc_settings.Capacity.Limit_Ammo_Rifle.tooltip"] = "步枪弹药所能携带的最大数量；设为-1则为无限",

         ["zkvlc_settings.Capacity.Limit_Ammo_Shotgun.label"] = "霰弹枪弹药限制",
         ["zkvlc_settings.Capacity.Limit_Ammo_Shotgun.tooltip"] = "霰弹枪弹药所能携带的最大数量；设为-1则为无限",

         ["zkvlc_settings.Capacity.Limit_Ammo_Sniper.label"] = "狙击步枪弹药限制",
         ["zkvlc_settings.Capacity.Limit_Ammo_Sniper.tooltip"] = "狙击步枪弹药所能携带的最大数量；设为-1则为无限",
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
