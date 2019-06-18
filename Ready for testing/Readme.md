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

``` Logic Handler changes
Replace CreateObjectAtLocation() and CreateObjectAtPlayer() with:

-- Create objects with newly assigned uniqueIndexes in a particular cell,
-- where the objectsToCreate parameter is an array of tables with refId
-- and location keys and packetType is either "spawn" or "place"
logicHandler.CreateObjects = function(cellDescription, objectsToCreate, packetType)


    local uniqueIndexes = {}
    local generatedRecordIdsPerType = {}
    local unloadCellAtEnd = false
    local shouldSendPacket = false


    -- If the desired cell is not loaded, load it temporarily
    if LoadedCells[cellDescription] == nil then
        logicHandler.LoadCell(cellDescription)
        unloadCellAtEnd = true
    end


    local cell = LoadedCells[cellDescription]


    -- Only send a packet if there are players on the server to send it to
    if tableHelper.getCount(Players) > 0 then
        shouldSendPacket = true
        tes3mp.ClearObjectList()
    end


    for _, object in pairs(objectsToCreate) do


        local refId = object.refId
        local location = object.location


        local mpNum = WorldInstance:GetCurrentMpNum() + 1
        local uniqueIndex =  0 .. "-" .. mpNum
        local isValid = true


        -- Is this object based on a a generated record? If so, it needs special
        -- handling here and further below
        if logicHandler.IsGeneratedRecord(refId) then
            
            local recordType = logicHandler.GetRecordTypeByRecordId(refId)


            if RecordStores[recordType] ~= nil then


                -- Add a link to this generated record in the cell it is being placed in
                cell:AddLinkToRecord(recordType, refId, uniqueIndex)


                if generatedRecordIdsPerType[recordType] == nil then
                    generatedRecordIdsPerType[recordType] = {}
                end


                if shouldSendPacket and not tableHelper.containsValue(generatedRecordIdsPerType[recordType], refId) then
                    table.insert(generatedRecordIdsPerType[recordType], refId)
                end
            else
                isValid = false
                tes3mp.LogMessage(enumerations.log.ERROR, "Attempt at creating object " .. refId ..
                    " based on non-existent generated record")
            end
        end


        if isValid then


            table.insert(uniqueIndexes, uniqueIndex)
            WorldInstance:SetCurrentMpNum(mpNum)
            tes3mp.SetCurrentMpNum(mpNum)


            cell:InitializeObjectData(uniqueIndex, refId)
            cell.data.objectData[uniqueIndex].location = location


            if packetType == "place" then
                table.insert(cell.data.packets.place, uniqueIndex)
            elseif packetType == "spawn" then
                table.insert(cell.data.packets.spawn, uniqueIndex)
                table.insert(cell.data.packets.actorList, uniqueIndex)
            end


            -- Are there any players on the server? If so, initialize the object
            -- list for the first one we find and just send the corresponding packet
            -- to everyone
            if shouldSendPacket then


                local pid = tableHelper.getAnyValue(Players).pid
                tes3mp.SetObjectListPid(pid)
                tes3mp.SetObjectListCell(cellDescription)
                tes3mp.SetObjectRefId(refId)
                tes3mp.SetObjectRefNum(0)
                tes3mp.SetObjectMpNum(mpNum)
                tes3mp.SetObjectCharge(-1)
                tes3mp.SetObjectEnchantmentCharge(-1)
                tes3mp.SetObjectPosition(location.posX, location.posY, location.posZ)
                tes3mp.SetObjectRotation(location.rotX, location.rotY, location.rotZ)
                tes3mp.AddObject()
            end
        end
    end


    if shouldSendPacket then


        -- Ensure the visitors to this cell have the records they need for the
        -- objects we've created
        for _, recordType in pairs(config.recordStoreLoadOrder) do
            if generatedRecordIdsPerType[recordType] ~= nil then


                local recordStore = RecordStores[recordType]


                if recordStore ~= nil then


                    local idArray = generatedRecordIdsPerType[recordType]


                    for _, visitorPid in pairs(cell.visitors) do
                        recordStore:LoadGeneratedRecords(visitorPid, recordStore.data.generatedRecords, idArray)
                    end
                end
            end
        end


        if packetType == "place" then
            tes3mp.SendObjectPlace(true)
        elseif packetType == "spawn" then
            tes3mp.SendObjectSpawn(true)
        end
    end


    cell:Save()


    if unloadCellAtEnd then
        logicHandler.UnloadCell(cellDescription)
    end


    return uniqueIndexes
end


logicHandler.CreateObjectAtLocation = function(cellDescription, location, refId, packetType)


    local objects = {}
    table.insert(objects, { location = location, refId = refId, packetType = packetType })


    local objectUniqueIndex = logicHandler.CreateObjects(cellDescription, objects, packetType)[1]
    return objectUniqueIndex
end


logicHandler.CreateObjectAtPlayer = function(pid, refId, packetType)


    local cell = tes3mp.GetCell(pid)
    local location = {
        posX = tes3mp.GetPosX(pid), posY = tes3mp.GetPosY(pid), posZ = tes3mp.GetPosZ(pid),
        rotX = tes3mp.GetRotX(pid), rotY = 0, rotZ = tes3mp.GetRotZ(pid)
    }


    local objectUniqueIndex = logicHandler.CreateObjectAtLocation(cell, location, refId, packetType)[1]
    return objectUniqueIndex
end


Replace GetRecordStoreByRecordId() with:


logicHandler.GetRecordTypeByRecordId = function(recordId)


    local isGenerated = logicHandler.IsGeneratedRecord(recordId)


    if isGenerated then
        local recordType = string.match(recordId, "_(%a+)_")


        if RecordStores[recordType] ~= nil then
            return recordType
        end
    end


    for _, storeType in pairs(config.recordStoreLoadOrder) do


        if isGenerated and RecordStores[storeType].data.generatedRecords[recordId] ~= nil then
            return storeType
        elseif RecordStores[storeType].data.permanentRecords[recordId] ~= nil then
            return storeType
        end
    end


    return nil
end


logicHandler.GetRecordStoreByRecordId = function(recordId)


    local recordType = logicHandler.GetRecordTypeByRecordId(recordId)
    return RecordStores[recordType]
end
