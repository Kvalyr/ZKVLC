-- ====================================================================================================================
-- Loot, Crafting & Upgrading Overhaul (ZKVLC) by Kvalyr for CP2077
-- =========================================================
:: Adds the following features ::
♦ Configurable carry-capacity limits for Ammo, Grenades & Healing Items
♦ Configurable multipliers for crafting/upgrading costs
♦ Configurable caps for upgrading (i.e.; stop costs increasing after X upgrades). Separate caps for Iconic equipment.

:: Detailed Info - Carry Limits ::
♦ Carry Limits: If enabled, excess grenades/injectors/inhalers will be dropped or scrapped depending on your settings and perks.


:: Detailed Info - Crafting Multipliers ::
♦ These multipliers control how many materials it costs to craft items.
♦ The 'global' slider is a multiplier applied to all crafting materials costs.
♦ There are individual sliders for different component qualities (Common, Uncommon, etc.)
♦ The sliders in the Item Rarity section allow you to further adjust the costs depending on the quality of the item being crafted
♦ Sliders can be set to '0' to make crafting free


:: Detailed Info - Upgrading Multipliers ::
♦ These multipliers control how many materials it costs to upgrade items.
♦ The 'global' slider is a multiplier applied to all upgrade materials costs.
♦ There are individual sliders for different component qualities (Common, Uncommon, etc.)
♦ The sliders in the Item Rarity section allow you to further adjust the costs depending on the quality of the item being upgraded
♦ Sliders can be set to '0' to make upgrading free


:: Detailed Info - Upgrading Cost Caps ::
♦ The cost of upgrading an item normally increases for each upgrade. These settings allow you to set a 'cap' on how high these costs go.
    • i.e.; A cap of '5' means that the costs stop increasing and stay the same after 5 upgrades to the same item, preventing the costs from becoming unmanageable if you try to keep an early-game item upgraded to higher levels.
    • A cap of '50' means that the costs just increase with each upgrade level as they do in CP2077 normally
♦ There are sliders to control caps on different upgrade materials. This lets you, for example, leave common materials uncapped but stop the cost in Legendary components from increasing with each upgrade by setting it to '1'.

:: Configuration ::
♦ There is a configuration UI using 'Native Settings UI'.
♦ The mod makes no balance changes by default! - You can customize everything yourself
♦ There is a profile of my preferred balance settings that you can switch to. Details below.


:: Kvalyr Profile - 'Hardcore' Balance ::
♦ My personal balance profile is included. You can use it by clicking the 'Kvalyr Profile' button in the settings menu.
    • In this profile, you can carry no more than 2 of any type of grenade and no more than 3 of each healing item type.
    • This means you might actually engage with crafting grenades and healing items instead of always having 100+ of them sitting in your inventory to spam in any given fight.

    • Crafting/upgrading costs are increased, particularly for Common/Uncommon components - As these are ridiculously plentiful in the game; and even moreso when automatically scrapping excess consumables.

    • Upgrade costs for non-iconic weapons are capped at 10 upgrades to retain the "level-scaling looter shooter" gameplay intended by CDPR, while still making it feasible to hold onto a weapon you *really* like.
    • Upgrade costs for iconic weapons are capped at 5 upgrades to simulate V gaining some 'familiarity' with them over time. This gives an incentive to keep upgrading them into higher levels, without the costs becoming ridiculous.
    • Rarer materials (Rare to Legendary) are capped at fewer upgrades for both Iconic and Non-Iconic items as they tend to excessively bottleneck upgrades with their scarcity in the game.



:: Known Issues ::
♦ Attempting to craft Grenades or Healing items when at limit gives a "MAX AMMO REACHED" message instead of something more appropriate


:: Future Plans ::
♦ Iterating on the balance of my settings profile with more playtesting
♦ More granular limits on grenades (slider per type)
    • Possibly setting a 'total' cap for grenades with configurable discard/scrap order for lower-quality grenades
♦ Configurable player carry weight
♦ Configurable item scrapping results
♦ Expand profile system so that one can easily add balance profiles shared by other users
♦ Crafting/Upgrading Perks Adjustments


:: Requirements ::
♦ Cyberpunk 2077 v1.61
♦ Cyber Engine Tweaks (latest version) ( https://www.nexusmods.com/cyberpunk2077/mods/107 )
♦ redscript (latest version) ( https://www.nexusmods.com/cyberpunk2077/mods/1511 )
♦ Native Settings UI (latest version) ( https://www.nexusmods.com/cyberpunk2077/mods/3518 )
♦ cybercmd ( https://www.nexusmods.com/cyberpunk2077/mods/5176 )


:: Installation ::
♦ Install all requirements (above)
♦ Install the mod manually by extracting the bin, archive and r6 folders to your CP2077 main folder. (Drag and drop from the .zip)
♦ Vortex installation is not supported. It might work, it might not. I don't use Vortex myself and can't help you with it.


:: Other Recommended Mods ::
The following mods play well with this one:
♦ Toxicity by rmk1234 ( https://www.nexusmods.com/cyberpunk2077/mods/4317 )
♦ Crafting Quality of Life by rmk1234 ( https://www.nexusmods.com/cyberpunk2077/mods/4453 )
♦ Smart Scrapper by djkovrik ( https://www.nexusmods.com/cyberpunk2077/mods/2687 )
    • Note: Smart Scrapper's auto-scrapping of grenades & healing items will override the behaviour of this mod.


:: Compatibility & Technical details ::
I try to make my mods as compatible with others as I can, but I can't maintain an exhaustive list of which ones are(n't) compatible.
You'll need to use your own best judgment and see what happens.

The following methods are replaced in redscript:
♦ CraftingSystem.GetItemFinalUpgradeCost()

The following methods are wrapped in redscript:
♦ CraftingSystem.CanItemBeCrafted()
♦ CraftingSystem.GetMaxCraftingAmount()
♦ FullscreenVendorGameController.GetMaxQuantity()
♦ PlayerPuppet.OnItemAddedToInventory()


:: Mods by Kvalyr ::
Loot, Crafting & Upgrading Overhaul - ZKVLC ( https://www.nexusmods.com/cyberpunk2077/mods/6766/ )
Finisher & Takedown Overhaul - ZKVTD ( https://www.nexusmods.com/cyberpunk2077/mods/6508 )
Increased Blood - ZKV_MoreBlood ( https://www.nexusmods.com/cyberpunk2077/mods/6548 )


::  Credits ::
♦ The developers of Cyber Engine Tweaks, redscript & Native Settings UI
♦ The CP2077 modding discord members for answering questions


:: Translations ::
♦ None yet! Please see i18n/i18n_strings.lua and submit translations on GitHub if you'd like to!


:: Source Code ::
GitHub link to follow
