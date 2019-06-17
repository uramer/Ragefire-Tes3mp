Add to custom folder

Add to customScripts.lua

```
require("custom/abilityCommands")
require("custom/bloodmoonStop")
require("custom/cells_cmd")
require("custom/channels")
require("custom/charProgression/birthSigns")
require("custom/charProgression/racialBonuses")
require("custom/collisionFix")
require("custom/creatureLoot")
require("custom/donorCommands")
require("custom/dungeonCreation")
require("custom/groupParty")
require("custom/homecities")
require("custom/jersServerMarket")
require("custom/kickPing")
require("custom/legendaryItems")
require("custom/mainQuestRequiredKills")
require("custom/meditate")
require("custom/mercantileFix")
require("custom/onActivateChanges")
require("custom.OriginalStart")
require("custom/preObjectsAndDeletions")
require("custom/rage_cmd")
require("custom/rageExp")
require("custom/responding")
require("custom/russiannames")
require("custom/setStronghold")
require("custom/soulTax")
require("custom/tutorialKills")
require("custom/someMenus")
require("custom/starterItems")
require("custom/warpTimer")
```

Do the two "addbyHand" files

add the recordstore and jsons to /data/


add menus 
(change "chargen" menu to teleport at the end)
(remove endchargen from "chargen" menu)

```
{ "help", "defaultCrafting", "advancedExample", "rage", "crafting", "fletching", "shopItems", "cannotLoot", "changeLog", "charGen", "charGenClothes", "charGenWeapons", "chatMenu", "crafting", "craftingRecipes", "defaultCrafting", "fletchingRecipes", "help", "helpRagefire", "leatherMenu", "leatherRecipeMenu", "legendaryItemsMenu", "mainQuest", "menuguilds", "menuquest", "tailoring", "teleportMenu", "transporters", "tutorial", "rageTreeWarrior", "rageTreeNightBlade", "newCrafting", "craftingRecipeLearning" }
```


Add to the mix
```

kanaBank = require("custom/kanaBank")
decorateHelp = require("custom/decorateHelp")
kanaFurniture = require("custom/kanaFurniture")
kanaHousing = require("custom/kanaHousing")
CellReset = require("custom/CellReset") -- (change to delete loadedCells and kills) (add exemptions list from kanaHousing)
require("custom/preObjectsAndDeletions") -- (load after cellreset)


kanaRevive -- needs customHooks
JerTheBears MarketPlace (ported) (add cell to cellreset blacklist)

boyos notewriting
boyos dungeonloot
rework menus with boyos playerPacketHelper
```
