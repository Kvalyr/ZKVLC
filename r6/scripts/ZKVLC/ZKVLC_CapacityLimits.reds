public static func ZKVLog(const str: script_ref<String>) -> Void {
  LogChannel(n"DEBUG", "ZKVLC: " + str);
}


public final func ZKVLC_TweakDB_GetShouldLimit() -> Bool
{
    let should: Bool = TweakDBInterface.GetBool(TDBID.Create(s"ZKVLC.Config:CapacityLimiter.limit"), false);
    // ZKVLog("ZKVLC_TweakDB_GetShouldLimit():" + should);
    return should;
}


public final func ZKVLC_TweakDB_GetShouldScrap() -> Bool
{
    let should: Bool = ZKVLC_TweakDB_GetShouldLimit() && TweakDBInterface.GetBool(TDBID.Create(s"ZKVLC.Config:CapacityLimiter.scrapExcess"), false);
    // ZKVLog("ZKVLC_TweakDB_GetShouldScrap():" + should);
    return should;
}


public final func ZKVLC_TweakDB_GetLimitForItemType(itemType: String) -> Int32
{
    let limit: Int32 = -1;
    limit = TweakDBInterface.GetInt(TDBID.Create(s"ZKVLC.Config:CapacityLimiter.limit_" + itemType), -1);
    // ZKVLog("ZKVLC_TweakDB_GetLimitForItemType(): itemType: " + itemType + ", limit: " + limit);
    return limit;
}


public static func ZKVLC_ShouldBeLimitedConsumable(data: wref<gameItemData>, quality: gamedataQuality) -> Bool {
    let type: gamedataItemType = data.GetItemType();
    let limitStr: String;
    let limit: Int32;

    if Equals(type, gamedataItemType.Gad_Grenade)
    {
        // ZKVLog("ZKVLC_ShouldBeScrappedConsumable() - Item is grenade: " + TDBID.ToStringDEBUG(tdbid));
        switch quality
        {
            case gamedataQuality.Rare: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Uncommon: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Common: return ZKVLC_TweakDB_GetShouldLimit();
        };
    };

    if Equals(type, gamedataItemType.Con_Injector)
    {
        // ZKVLog("ZKVLC_ShouldBeScrappedConsumable() - Item is injector: " + TDBID.ToStringDEBUG(tdbid));
        switch quality
        {
            case gamedataQuality.Rare: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Uncommon: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Common: return ZKVLC_TweakDB_GetShouldLimit();
        };
    };

    if Equals(type, gamedataItemType.Con_Inhaler)
    {
        // ZKVLog("ZKVLC_ShouldBeScrappedConsumable() - Item is inhaler: " + TDBID.ToStringDEBUG(tdbid));
        switch quality {
            case gamedataQuality.Epic: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Rare: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Uncommon: return ZKVLC_TweakDB_GetShouldLimit();
        };
    };

    return false;
}


public static final func ZKVLC_GetLimitForItem(itemData: wref<gameItemData>, quality: gamedataQuality) -> Int32
{
    if !ZKVLC_ShouldBeLimitedConsumable(itemData, quality)
    {
        return -1;
    }

    let type: gamedataItemType = itemData.GetItemType();
    let limitStr: String;

    // TODO: quality

    switch type
    {
        case gamedataItemType.Gad_Grenade:
            return ZKVLC_TweakDB_GetLimitForItemType(s"grenades");

        case gamedataItemType.Con_Injector:
            return ZKVLC_TweakDB_GetLimitForItemType(s"injectors");

        case gamedataItemType.Con_Inhaler:
            return ZKVLC_TweakDB_GetLimitForItemType(s"inhalers");
    }

    return -1;
}




@addMethod(PlayerPuppet)
public final func CanAutomaticallyDisassembleJunk() -> Bool
{
    return GameInstance.GetStatsSystem(this.GetGame()).GetStatValue(Cast<StatsObjectID>(this.GetEntityID()), gamedataStatType.CanAutomaticallyDisassembleJunk) > 0.00;
}


public final func ZKVLC_DisassembleItems(executor: wref<GameObject>, itemID: ItemID, quantity: Int32) -> Void {
    let i: Int32 = 0;
    while i < quantity{
        ItemActionsHelper.ProcessItemAction(executor.GetGame(), executor, RPGManager.GetItemData(executor.GetGame(), executor, itemID), ItemActionsHelper.GetDisassembleAction(itemID).GetID(), true);
        i += 1;
    };
}


public final func ZKVLC_DropItems(executor: wref<GameObject>, itemID: ItemID, quantity: Int32) -> Void {
    let i: Int32 = 0;
    while i < quantity{
        ItemActionsHelper.ProcessItemAction(executor.GetGame(), executor, RPGManager.GetItemData(executor.GetGame(), executor, itemID), ItemActionsHelper.GetDropAction(itemID).GetID(), true);
        i += 1;
    };
}


// Runs when item added to inventory
@wrapMethod(PlayerPuppet)
protected cb func OnItemAddedToInventory(evt: ref<ItemAddedEvent>) -> Bool {
    let result: Bool = wrappedMethod(evt);
    if !ZKVLC_TweakDB_GetShouldLimit()
    {
        return result;
    }
    let itemData: wref<gameItemData> = evt.itemData;
    let tweakDbId: TweakDBID = ItemID.GetTDBID(itemData.GetID());
    let quality: gamedataQuality = RPGManager.GetItemDataQuality(itemData);
    let quantityHeld: Int32 = GameInstance.GetTransactionSystem(this.GetGame()).GetItemQuantity(this, evt.itemID);
    let excess: Int32;
    let itemLimit: Int32 = ZKVLC_GetLimitForItem(itemData, quality);
    let shouldScrap: Bool = ZKVLC_TweakDB_GetShouldScrap();

     if itemData.HasTag(n"Quest")
    {
        // ZKVLog("OnItemAddedToInventory() - Item has quest tag");
        return result;
    };

    if !ZKVLC_ShouldBeLimitedConsumable(itemData, quality)
    {
        return result;
    }

    if itemLimit < 0
    {
        return result;
    }
    excess = quantityHeld - itemLimit;

    ZKVLog("OnItemAddedToInventory(): " + TDBID.ToStringDEBUG(tweakDbId) + ", quantityHeld: " + quantityHeld + ", itemLimit: " + itemLimit + ", excess: " + excess);

    if excess > 0
    {
        excess = Abs(excess);

        ZKVLog("OnItemAddedToInventory() - Quantity held exceeds limit:" + TDBID.ToStringDEBUG(tweakDbId) + ", quantityHeld: " + quantityHeld + ", itemLimit: " + itemLimit);

        if shouldScrap && this.CanAutomaticallyDisassembleJunk()
        {
            ZKVLog("OnItemAddedToInventory() - Scrapping excess items:" + TDBID.ToStringDEBUG(tweakDbId) + ", quantityHeld: " + quantityHeld + ", excess: " + excess);
            ZKVLC_DisassembleItems(this, evt.itemID, excess);
        }
        else
        {
            ZKVLog("OnItemAddedToInventory() - Dropping excess items:" + TDBID.ToStringDEBUG(tweakDbId) + ", quantityHeld: " + quantityHeld + ", excess: " + excess);
            ZKVLC_DropItems(this, evt.itemID, excess);
        };
    }
    return result;
}


@wrapMethod(CraftingSystem)
public final const func GetMaxCraftingAmount(itemData: wref<gameItemData>) -> Int32 {
    let result: Int32 = wrappedMethod(itemData);
    let currentQuantity: Int32;
    let consumableCap: Int32;
    let tags: array<CName>;
    let transactionSystem: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGameInstance());

    if (result < 1)
    {
        return result;
    }

    let quality: gamedataQuality = RPGManager.GetItemDataQuality(itemData);
    let itemLimit: Int32 = ZKVLC_GetLimitForItem(itemData, quality);

    ZKVLog("GetMaxCraftingAmount(): " + TDBID.ToStringDEBUG(ItemID.GetTDBID(itemData.GetID())) + ", currentQuantity: " + currentQuantity + ", itemLimit: " + itemLimit);

    // If we don't have a limit for this item, just do nothing and return the wrapped method's result
    if itemLimit < 0
    {
        return result;
    }

    currentQuantity = transactionSystem.GetItemQuantity(this.m_playerCraftBook.GetOwner(), itemData.GetID());

    if currentQuantity >= itemLimit
    {
        return 0;
    }

    return itemLimit - currentQuantity;
}


@wrapMethod(CraftingSystem)
public final const func CanItemBeCrafted(itemData: wref<gameItemData>) -> Bool {
    let result: Bool = wrappedMethod(itemData);
    if result
    {
        let currentQuantity: Int32;
        let consumableCap: Int32;
        let tags: array<CName>;
        let transactionSystem: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGameInstance());
        let quality: gamedataQuality = RPGManager.GetItemDataQuality(itemData);
        let itemLimit: Int32 = ZKVLC_GetLimitForItem(itemData, quality);

        ZKVLog("CanItemBeCrafted() 1: " + TDBID.ToStringDEBUG(ItemID.GetTDBID(itemData.GetID())) + ", itemLimit: " + itemLimit);

        // If we don't have a limit for this item, just do nothing and return the wrapped method's result
        if itemLimit < 0
        {
            return result;
        }

        currentQuantity = transactionSystem.GetItemQuantity(this.m_playerCraftBook.GetOwner(), itemData.GetID());

        // ZKVLog("CanItemBeCrafted() 2: " + TDBID.ToStringDEBUG(ItemID.GetTDBID(itemData.GetID())) + ", currentQuantity: " + currentQuantity + ", itemLimit: " + itemLimit);

        if currentQuantity >= itemLimit
        {
            return false;
        }
    };
    return result;
}


// @replaceMethod(CraftingLogicController)
// protected cb func OnHoldFinished(evt: ref<ProgressBarFinishedProccess>) -> Bool {
//     // let result: Bool = wrappedMethod(itemData);
//     let quantity: Int32;
//     ZKVLog("CraftingLogicController.OnHoldFinished()");
//     if !this.m_isPanelOpen
//     {
//         ZKVLog("CraftingLogicController.OnHoldFinished(): !this.m_isPanelOpen");
//         return false;
//     };
//     if this.m_selectedRecipe.id.TagsContains(n"Grenade") || this.m_selectedRecipe.id.TagsContains(n"Consumable") || this.m_selectedRecipe.id.TagsContains(n"Ammo") || Equals(InventoryItemData.GetItemType(this.m_selectedRecipe.inventoryItem), gamedataItemType.Gen_CraftingMaterial)
//     {
//         quantity = this.m_craftingSystem.GetMaxCraftingAmount(InventoryItemData.GetGameItemData(this.m_selectedItemData));
//         ZKVLog("CraftingLogicController.OnHoldFinished(): TagsContains() - quantity: " + quantity);
//         if this.m_selectedRecipe.id.TagsContains(n"Ammo") && quantity == 0
//         {
//             return false;
//         };
//         if quantity > 1
//         {
//             this.OpenQuantityPicker(this.m_selectedItemData, quantity);
//             return true;
//         };
//     };
//     if this.m_selectedRecipe.id.TagsContains(n"Ammo")
//     {
//         ZKVLog("CraftingLogicController.OnHoldFinished(): Ammo");
//         this.CraftItem(this.m_selectedRecipe, 1);
//     }
//     else
//     {
//         ZKVLog("CraftingLogicController.OnHoldFinished(): NONAmmo");
//         this.CraftItem(this.m_selectedRecipe, this.m_selectedRecipe.amount);
//     };
// }


// @wrapMethod(FullscreenVendorGameController)
// private final func GetMaxQuantity(item: wref<UIInventoryItem>, opt isPlayerItem: Bool) -> Int32 {
//     let result: Int32 = wrappedMethod(item, isPlayerItem);

//     let tags: array<CName>;
//     let vendorQuantity: Int32 = item.GetQuantity();
//     tags = item.GetItemRecord().Tags();

//     // TODO: This is probably wrong
//     if !(ArrayContains(tags, n"Ammo") || ArrayContains(tags, n"Injector") || ArrayContains(tags, n"Inhaler") || ArrayContains(tags, n"Grenade"))
//     {
//         return vendorQuantity;
//     };

//     return result;
// }
