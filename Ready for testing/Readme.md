Add to custom folder

Add to customScripts.lua

```
require("custom/abilityCommands")
require("custom/bloodmoonstop")
require("custom/cells_cmd")
require("custom/collisionfix")
require("custom/creatureLoot")
require("custom/donorcommands")
require("custom/dungeoncreation")
require("custom/homecities")
require("custom/kickping")
require("custom/legendaryItems")
require("custom/meditate")
require("custom/onactivatechanges")
-- require("custom/preObjectsAndDeletions") -- preObjects.json -- refNumDeletionsByCell.json
require("custom/racialbonuses")
require("custom/rage_cmd")
require("custom/russiannames")
require("custom/soultax")
require("custom/tutorialKills")
require("custom/rageExp") -- rageExp.json
require("custom/channels")
require("custom/GroupParty")
require("custom/MainQuestRequiredKills")
require("custom/mercantileFix")
require("custom/responding")
require("custom/setstronghold")
require("custom/someMenus")
require("custom/starteritems")
require("custom/warptimer")
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
