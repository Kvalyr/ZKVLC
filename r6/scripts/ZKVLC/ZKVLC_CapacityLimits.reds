public static func ZKVLog(const str: script_ref<String>) -> Void {
  LogChannel(n"DEBUG", "ZKVLC: " + str);
}

// @addMethod(PlayerPuppet)
// public func ZKVLC_HasExcludedQuestActive() -> Bool {
//     let journalManager: wref<JournalManager> = GameInstance.GetJournalManager(this.GetGame());
//     let trackedObjective: wref<JournalQuestObjective> = journalManager.GetTrackedEntry() as JournalQuestObjective;
//     return
//         // Starting tutorial
//         Equals(trackedObjective.GetId(), "01a_pick_weapon") ||
//         Equals(trackedObjective.GetId(), "01c_pick_up_reanimator") ||
//         Equals(trackedObjective.GetId(), "03_pick_up_katana") ||
//     false;
// }

// Game.AddToInventory("Items.GrenadeFragRegular", 1)

public final func ZKVLC_TweakDB_GetShouldLimit() -> Bool
{
    return TweakDBInterface.GetBool(TDBID.Create(s"ZKVLC.Config:CapacityLimiter.limit"), false);
}
public final func ZKVLC_TweakDB_GetShouldScrap() -> Bool
{
    return TweakDBInterface.GetBool(TDBID.Create(s"ZKVLC.Config:CapacityLimiter.scrapExcess"), false);
}

public final func ZKVLC_TweakDB_GetLimitForItemType(itemType: String) -> Int32
{
    return TweakDBInterface.GetInt(TDBID.Create(s"ZKVLC.Config:CapacityLimiter.limit_" + itemType), -1);
}



public static final func ZKVLC_GetLimitForItem(data: wref<gameItemData>, quality: gamedataQuality) -> Int32
{
    let type: gamedataItemType = data.GetItemType();
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
private func ZKVLC_ShouldBeLimitedConsumable(data: wref<gameItemData>, quality: gamedataQuality) -> Bool {
    let type: gamedataItemType = data.GetItemType();
    let limitStr: String;
    let limit: Int32;

    // Don't scrap neuroblockers
    let tdbid: TweakDBID = ItemID.GetTDBID(data.GetID());
    if Equals(tdbid, t"Items.ripperdoc_med") || Equals(tdbid, t"Items.ripperdoc_med_uncommon") || Equals(tdbid, t"Items.ripperdoc_med_common") {
        return false;
    };

    if Equals(type, gamedataItemType.Gad_Grenade)
    {


        ZKVLog("ZKVLC_ShouldBeScrappedConsumable() - Item is grenade: " + TDBID.ToStringDEBUG(tdbid));
        switch quality
        {
            // case gamedataQuality.Rare: return this.zkvlc_scrapperGrenade.rare;
            // case gamedataQuality.Uncommon: return this.zkvlc_scrapperGrenade.uncommon;
            // case gamedataQuality.Common: return this.zkvlc_scrapperGrenade.common;
            case gamedataQuality.Rare: return true;
            case gamedataQuality.Uncommon: return true;
            case gamedataQuality.Common: return true;
        };
    };

    if Equals(type, gamedataItemType.Con_Injector)
    {
        ZKVLog("ZKVLC_ShouldBeScrappedConsumable() - Item is injector: " + TDBID.ToStringDEBUG(tdbid));
        switch quality
        {
            // case gamedataQuality.Rare: return this.zkvlc_scrapperBounceBack.rare;
            // case gamedataQuality.Uncommon: return this.zkvlc_scrapperBounceBack.uncommon;
            // case gamedataQuality.Common: return this.zkvlc_scrapperBounceBack.common;
            case gamedataQuality.Rare: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Uncommon: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Common: return ZKVLC_TweakDB_GetShouldLimit();
        };
    };

    if Equals(type, gamedataItemType.Con_Inhaler)
    {
        ZKVLog("ZKVLC_ShouldBeScrappedConsumable() - Item is inhaler: " + TDBID.ToStringDEBUG(tdbid));
        switch quality {
            // case gamedataQuality.Epic: return this.zkvlc_scrapperMaxDoc.epic;
            // case gamedataQuality.Rare: return this.zkvlc_scrapperMaxDoc.rare;
            // case gamedataQuality.Uncommon: return this.zkvlc_scrapperMaxDoc.uncommon;
            case gamedataQuality.Epic: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Rare: return ZKVLC_TweakDB_GetShouldLimit();
            case gamedataQuality.Uncommon: return ZKVLC_TweakDB_GetShouldLimit();
        };
    };

    return false;
}

// // Keep last bought item id
// @addField(PlayerPuppet)
// public let boughtItem: ItemID;

// // Save last bought item id
// @wrapMethod(Vendor)
// private final func PerformItemTransfer(buyer: wref<GameObject>, seller: wref<GameObject>, itemTransaction: SItemTransaction) -> Bool {
//   let player: ref<PlayerPuppet> = buyer as PlayerPuppet;
//   if IsDefined(player) {
//     player.boughtItem = itemTransaction.itemStack.itemID;
//   };
//   return wrappedMethod(buyer, seller, itemTransaction);
// }



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
    wrappedMethod(evt);

    let itemData: wref<gameItemData> = evt.itemData;
    let tweakDbId: TweakDBID = ItemID.GetTDBID(itemData.GetID());
    let quality: gamedataQuality = RPGManager.GetItemDataQuality(itemData);
    let quantityHeld: Int32 = GameInstance.GetTransactionSystem(this.GetGame()).GetItemQuantity(this, evt.itemID);
    let itemLimit: Int32 = ZKVLC_GetLimitForItem(itemData, quality);
    let excess: Int32;
    let shouldScrap: Bool = ZKVLC_TweakDB_GetShouldScrap();

    // if this.ZKVLC_HasExcludedQuestActive()
    // {
    //     return;
    // }
    if itemData.HasTag(n"Quest")
    {
        ZKVLog("OnItemAddedToInventory() - Item has quest tag");
        return true;
    };

    if !this.ZKVLC_ShouldBeLimitedConsumable(itemData, quality)
    {
        return true;
    }

    // itemLimit = ZKVLC_GetLimitForItem(itemData, quality);
    if itemLimit < 0
    {
        return true;
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
}


@wrapMethod(CraftingSystem)
public final const func GetMaxCraftingAmount(itemData: wref<gameItemData>) -> Int32 {
    let currentQuantity: Int32;
    // let itemTweakDBID: TweakDBID;
    let consumableCap: Int32;
    let tags: array<CName>;
    let transactionSystem: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGameInstance());

    let result: Int32 = wrappedMethod(itemData);

    let quality: gamedataQuality = RPGManager.GetItemDataQuality(itemData);
    let itemLimit: Int32 = ZKVLC_GetLimitForItem(itemData, quality);

    // itemTweakDBID = ItemID.GetTDBID(itemData.GetID());
    // ZKVLog("GetMaxCraftingAmount(): " + TDBID.ToStringDEBUG(ItemID.GetTDBID(itemData.GetID())) + ", currentQuantity: " + currentQuantity + ", itemLimit: " + itemLimit);

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
        // let itemRecord: ref<Item_Record>;
        // let itemTweakDBID: TweakDBID;
        let consumableCap: Int32;
        let tags: array<CName>;
        let transactionSystem: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGameInstance());
        let quality: gamedataQuality = RPGManager.GetItemDataQuality(itemData);
        let itemLimit: Int32 = ZKVLC_GetLimitForItem(itemData, quality);

        currentQuantity = transactionSystem.GetItemQuantity(this.m_playerCraftBook.GetOwner(), itemData.GetID());
        // itemTweakDBID = ItemID.GetTDBID(itemData.GetID());
        // ZKVLog("CanItemBeCrafted(): " + TDBID.ToStringDEBUG(ItemID.GetTDBID(itemData.GetID())) + ", currentQuantity: " + currentQuantity + ", itemLimit: " + itemLimit);

        if currentQuantity >= itemLimit
        {
            return false;
        }
    };
    return result;
}


@wrapMethod(FullscreenVendorGameController)
private final func GetMaxQuantity(item: wref<UIInventoryItem>, opt isPlayerItem: Bool) -> Int32 {
    let result: Int32 = wrappedMethod(item, isPlayerItem);

    let tags: array<CName>;
    let vendorQuantity: Int32 = item.GetQuantity();
    tags = item.GetItemRecord().Tags();

    // TODO: This is probably wrong
    if !(ArrayContains(tags, n"Ammo") || ArrayContains(tags, n"Injector") || ArrayContains(tags, n"Inhaler") || ArrayContains(tags, n"Grenade"))
    {
        return vendorQuantity;
    };

    return result;
}
