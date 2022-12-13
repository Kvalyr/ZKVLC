
public static func ZKVLog(const str: script_ref<String>) -> Void {
  LogChannel(n"DEBUG", "ZKVLC: " + str);
}

/*
// TODO:
// Option: Capped upgrade costs - Capped by factor of player Level?
// DONE:
// Option: Capped upgrade costs (by number of times upgraded)
// Option: Capped upgrade costs by material type
// Option: Iconics-only for all of above ^
*/

// ZKVLC - Loot, Crafting & Upgrading Overhaul for CP2077 by Kvalyr

public final static func ZKVLC_GetIngredientQuality(ingredient: IngredientData) -> gamedataQuality
{
    // let itemRecord: ref<Item_Record> = ingredient.id
    // let ingredientQuality: gamedataQuality;
    // let ingredientRecords: array<wref<RecipeElement_Record>>;

    // ingredientQuality = RPGManager.GetItemQualityFromRecord(TweakDBInterface.GetItemRecord(ingredient.id.GetID()));
    return RPGManager.GetItemQualityFromRecord(TweakDBInterface.GetItemRecord(ingredient.id.GetID()));
}


public final static func ZKVLC_Upgrades_GetCapForIngredientByQuality(ingredient: IngredientData, upgradeNumber: Int32, totalUpgradeCountCap: Int32, isIconic: Bool) -> Int32
{
    let ingredientQuality: gamedataQuality;
    let totalUpgradeCountCap: Int32 = 50;
    let quantityMultCap: Int32 = 50;
    let finalMult: Int32 = 50;
    let tdbid: String;// = s"ZKVLC.Config:Upgrading.Cap:Common";

    ingredientQuality = ZKVLC_GetIngredientQuality(ingredient);

    switch ingredientQuality {
        case gamedataQuality.Common:
            tdbid = s"ZKVLC.Config:Upgrading.Cap:Common";
            break;
        case gamedataQuality.Uncommon:
            tdbid = s"ZKVLC.Config:Upgrading.Cap:Uncommon";
            break;
        case gamedataQuality.Rare:
            tdbid = s"ZKVLC.Config:Upgrading.Cap:Rare";
            break;
        case gamedataQuality.Epic:
            tdbid = s"ZKVLC.Config:Upgrading.Cap:Epic";
            break;
        case gamedataQuality.Legendary:
            tdbid = s"ZKVLC.Config:Upgrading.Cap:Legendary";
            break;
        default:
    };

    if isIconic
    {
        tdbid = tdbid + "_Iconic";
        totalUpgradeCountCap = TweakDBInterface.GetInt(t"ZKVLC.Config:Upgrading.Cap:Total_Iconic", 50);
    }
    else
    {
        totalUpgradeCountCap = TweakDBInterface.GetInt(t"ZKVLC.Config:Upgrading.Cap:Total", 50);
    }
    quantityMultCap = TweakDBInterface.GetInt(TDBID.Create(tdbid), 50);

    quantityMultCap = Max(quantityMultCap, 0);
    totalUpgradeCountCap = Max(totalUpgradeCountCap, 0);

    finalMult = Min(quantityMultCap, totalUpgradeCountCap);
    finalMult = Min(finalMult, upgradeNumber);
    ZKVLog("ZKVLC_Upgrades_GetCapForIngredientByQuality: " + ToString(ingredientQuality) + ", isIconic: " + isIconic + ", upgradeNumber: " + upgradeNumber + ", quantityMultCap: " + quantityMultCap + ", totalUpgradeCountCap: " + totalUpgradeCountCap + ", finalMult: " + finalMult);

    return finalMult;
}


@replaceMethod(CraftingSystem)
public final const func GetItemFinalUpgradeCost(itemData: wref<gameItemData>) -> array<IngredientData>
{
    let i: Int32;
    let ingredients: array<IngredientData>;
    let tempStat: Float;
    let statsSystem: ref<StatsSystem> = GameInstance.GetStatsSystem(this.GetGameInstance());
    let upgradeNumber: Float = itemData.GetStatValueByType(gamedataStatType.WasItemUpgraded);

    let totalUpgradeCountCap: Int32 = 4; // Cap for upgrade costs by # of times upgraded - All materials // TODO: TDB
    let upgradeCountCapByIngredientQuality: Int32 = 4;
    let upgradeNumberActual: Int32;
    let isIconic: Bool = RPGManager.IsItemIconic(itemData);

    upgradeNumber += 1.00;
    ingredients = this.GetItemBaseUpgradeCost(itemData.GetItemType(), RPGManager.GetItemQuality(itemData));
    i = 0;
    while i < ArraySize(ingredients)
    {
        upgradeNumberActual = ZKVLC_Upgrades_GetCapForIngredientByQuality(ingredients[i], Cast<Int32>(upgradeNumber), totalUpgradeCountCap, isIconic);
        // ZKVLog("GetItemFinalUpgradeCost - upgradeNumber: " + upgradeNumber + ", upgradeNumberActual: " + upgradeNumberActual);
        ingredients[i].quantity = ingredients[i].quantity * upgradeNumberActual;
        ingredients[i].baseQuantity = ingredients[i].quantity;
        i += 1;
    };
    tempStat = statsSystem.GetStatValue(Cast<StatsObjectID>(this.m_playerCraftBook.GetOwner().GetEntityID()), gamedataStatType.UpgradingCostReduction);
    if tempStat > 0.00
    {
        i = 0;
        while i < ArraySize(ingredients)
        {
            ingredients[i].quantity = Cast<Int32>(Cast<Float>(ingredients[i].quantity) * (1.00 - tempStat));
            i += 1;
        };
    };
    return ingredients;
}
