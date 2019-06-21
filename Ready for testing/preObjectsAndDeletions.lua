
-- 
-- work with decorateHelp later

preObjectsAndDeletions = {}


jsonInterface = require("jsonInterface")
preexistingObjects = jsonInterface.load("preObjects.json")
refNumDeletionsByCell = jsonInterface.load("refNumDeletionsByCell.json") -- check if this overrides


preObjectsAndDeletions.FixCell = function(eventStatus, pid)
 
 cellDescription = tes3mp.GetCell(pid)
 
    if refNumDeletionsByCell[cellDescription] ~= nil then

        tes3mp.ClearObjectList()
        tes3mp.SetObjectListPid(pid)
        tes3mp.SetObjectListCell(cellDescription)

        for arrayIndex, refNum in pairs(refNumDeletionsByCell[cellDescription]) do
            tes3mp.SetObjectRefNum(refNum)
            tes3mp.SetObjectMpNum(0)
            tes3mp.SetObjectRefId("")
            tes3mp.AddObject()
        end

        tes3mp.SendObjectDelete()
    end
end

preObjectsAndDeletions.AddPreexistingObjects = function(eventStatus, pid, cellDescription)

    if Players[pid].LoadedCells == nil then Players[pid].LoadedCells = {} end
    if WorldInstance.data.LoadedCells == nil then WorldInstance.data.LoadedCells = {} end

    if preexistingObjects[cellDescription] ~= nil then

        if tableHelper.containsValue(Players[pid].LoadedCells, cellDescription) == false then
            if WorldInstance.data.LoadedCells[cellDescription] == nil then
            
                WorldInstance.data.LoadedCells[cellDescription] = {}
                
                local objectsToSpawn = {}
                local objectsToPlace = {}

                for arrayIndex, object in pairs(preexistingObjects[cellDescription]) do

                    if object.packetType == "spawn" then
                        table.insert(objectsToSpawn, object)
                    elseif object.packetType == "place" then
                        table.insert(objectsToPlace, object)
                    end
                end

                LoadedCells[cellDescription].forceActorListRequest = true

                local spawnedUniqueIndexes = logicHandler.CreateObjects(cellDescription, objectsToSpawn, "spawn")
                local placedUniqueIndexes = logicHandler.CreateObjects(cellDescription, objectsToPlace, "place")
                for _, uniqueIndex in pairs(spawnedUniqueIndexes) do
                    local mpNum = uniqueIndex:split("-")[2]
                    table.insert(WorldInstance.data.LoadedCells[cellDescription], {uniqueIndex = uniqueIndex, mpNum = mpNum})
                end

                for _, uniqueIndex in pairs(placedUniqueIndexes) do
                    local mpNum = uniqueIndex:split("-")[2]
                    table.insert(WorldInstance.data.LoadedCells[cellDescription], {uniqueIndex = uniqueIndex, mpNum = mpNum})
                end
             
                table.insert(Players[pid].LoadedCells, cellDescription)
            end
        end
    end
end

--[[
preObjectsAndDeletions.AddPreexistingObjects = function(eventStatus, pid, cellDescription)

if Players[pid].LoadedCells == nil then Players[pid].LoadedCells = {} end
if WorldInstance.data.LoadedCells == nil then WorldInstance.data.LoadedCells = {} end

if preexistingObjects[cellDescription] ~= nil then

if tableHelper.containsValue(Players[pid].LoadedCells, cellDescription) == false then
	if WorldInstance.data.LoadedCells[cellDescription] == nil then
	
		WorldInstance.data.LoadedCells[cellDescription] = {}
		
-- only send preObjects to players entering cell later logicHandler line 419 change to false
	 		for arrayIndex, object in pairs(preexistingObjects[cellDescription]) do
		
			local uniqueIndex, mpNum = preObjectsAndDeletions.SpawnHelperForOne(pid, cellDescription, object.location, object.refId, object.packetType)
			 print("\n LOADED CELL \n")
			table.insert(WorldInstance.data.LoadedCells[cellDescription], {uniqueIndex = uniqueIndex, mpNum = mpNum})
			end
	 
			LoadedCells[cellDescription].forceActorListRequest = true
			table.insert(Players[pid].LoadedCells, cellDescription)]]--
	--[[else -- no respawn since celldata gets respawn automatically
		print("\n RELOADED CELL \n")
		for _, object in pairs(WorldInstance,LoadedCells[cellDescription]) do
			preObjectsAndDeletions.RespawnHelperForOne(pid, object.uniqueIndex, object.mpNum, cellDescription)
		end
			table.insert(Players[pid].LoadedCells, cellDescription)]]--
			--[[
	end
end
end
end
]]--
preObjectsAndDeletions.RespawnHelperForOne = function(pid, uniqueIndex, mpNum, cellDescription)
--respawn object for player
				local pid = pid
				local refId = LoadedCells[cellDescription].data.objectData[uniqueIndex].refId
				local location = LoadedCells[cellDescription].data.objectData[uniqueIndex].location
				tes3mp.ClearObjectList()
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

				if packetType == "place" then
					tes3mp.SendObjectPlace(false)
				elseif packetType == "spawn" then
					tes3mp.SendObjectSpawn(false)
				end
end

preObjectsAndDeletions.SpawnHelperForOne = function(pid, cellDescription, location, refId, packetType)
	
			local mpNum = WorldInstance:GetCurrentMpNum() + 1
			local uniqueIndex =  0 .. "-" .. mpNum


			-- Is this a generated record? If so, add a link to it in the cell it
			-- has been placed in
			if logicHandler.IsGeneratedRecord(refId) then
				local recordStore = logicHandler.GetRecordStoreByRecordId(refId)

				if recordStore ~= nil then
					LoadedCells[cellDescription]:AddLinkToRecord(recordStore.storeType, refId, uniqueIndex)

					-- Do any of the visitors to this cell lack the generated record?
					-- If so, send it to them
					for _, visitorPid in pairs(LoadedCells[cellDescription].visitors) do
						recordStore:LoadGeneratedRecords(visitorPid, recordStore.data.generatedRecords, { refId })
					end
				else
					tes3mp.LogMessage(enumerations.log.ERROR, "Attempt at creating object based on non-existent generated record")
					return
				end
			end

			WorldInstance:SetCurrentMpNum(mpNum)
			tes3mp.SetCurrentMpNum(mpNum)

			LoadedCells[cellDescription]:InitializeObjectData(uniqueIndex, refId)
			LoadedCells[cellDescription].data.objectData[uniqueIndex].location = location

			if packetType == "place" then
				table.insert(LoadedCells[cellDescription].data.packets.place, uniqueIndex)
			elseif packetType == "spawn" then
				table.insert(LoadedCells[cellDescription].data.packets.spawn, uniqueIndex)
				table.insert(LoadedCells[cellDescription].data.packets.actorList, uniqueIndex)
			end

			LoadedCells[cellDescription]:QuicksaveToDrive()

			-- Are there any players on the server? If so, initialize the object
			-- list for the first one we find and just send the corresponding packet
			-- to everyone
			if tableHelper.getCount(Players) > 0 then

				local pid = pid
				tes3mp.ClearObjectList()
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

				if packetType == "place" then
					tes3mp.SendObjectPlace(false)
				elseif packetType == "spawn" then
					tes3mp.SendObjectSpawn(false)
				end
			end

			return uniqueIndex, mpNum
	
end


preObjectsAndDeletions.DeleteCommand = function(pid, cmd)
			-- Enables deletemode- activate object to delete it
			Players[pid].data.deletemode = true
			tes3mp.SendMessage(pid, "Entering deletemode.\n")
			
end

preObjectsAndDeletions.OffDeleteCommand = function(pid, cmd)
			-- Disables deletemode
			Players[pid].data.deletemode = false
			tes3mp.SendMessage(pid, "leaving deletemode.\n")
end

preObjectsAndDeletions.OnObjectActivate = function(eventStatus, pid, cellDescription, objects, players)
            if Players[pid].data.deletemode ~= nil and Players[pid].data.deletemode == true then -- disables all activations and adds them to refnumdeletions
                isValid = false
                
                refNumDeletionsByCell = jsonInterface.load("refNumDeletionsByCell.json")
				
				local CurrentCell = tes3mp.GetCell(pid)
				
				-- got ObjectUniqueIndex above
				if refNumDeletionsByCell[CurrentCell] == nil then refNumDeletionsByCell[CurrentCell] = {} end
				local index = 0
                table.insert(refNumDeletionsByCell[CurrentCell], tonumber(tes3mp.GetObjectRefNum(index)))

                -- note: objectUniqueIndex will be null if you select a player in deletemode!
                
                jsonInterface.save("refNumDeletionsByCell.json", refNumDeletionsByCell)
                tes3mp.SendMessage(pid, "Deleted refNum: " .. tes3mp.GetObjectRefNum(index) .. "\n", false)
	end
end



--saveme.lua
-- elseif cmd[1] == "creat" and cmd[2] ~= nil and moderator then
-- saveme.exactRef(pid, cmd[2])
saveme = {}
            
--Rank A Creatures   
creatA = {}
creatA[1]="golden_saint_a"  
creatA[2]="dremora_lord_b"		
creatA[3]="ogrim_titan_b"	
creatA[4]="atronach_flame_b"	
creatA[5]="skeleton_archer_b"	
creatA[6]="skeleton_wizard_a"	
creatA[7]="skeleton_champion_b" 
creatA[8]="skeleton_archer_b"
creatA[9]="winged_twilight_b"
creatA[10]="kwama forager"
creatA[11]="aaakwamawarrior"
creatA[12]="mudcrab"
creatA[13]="aaanixhoundpup"
creatA[14]="rat"
creatA[15]="aascampling"
creatA[16]="scrib"
creatA[17]="aadwarfskeleton"
creatA[18]="aaaspriggansapling"
creatA[19]="aaasteamceuntrion"
creatA[20]="aaawolfpup"
creatA[21]="aaawolfpupred"
creatA[22]="aaacorprusstalker"   

       
--Rank B Creatures
creatB = {}
creatB[1]="aabAlit"
creatB[2]="aabGhost"
creatB[3]="aabDurzogWild"
creatB[4]="aabCorpusStalker"
creatB[5]="aabGoblinMedium"
creatB[6]="aabGoblinScout"
creatB[7]="aabGoblinWorker"
creatB[8]="aabKwamaWarrior"
creatB[9]="aabYoungOgrim"
creatB[10]="aabScribLarge"
creatB[11]="aabSkeleton"
creatB[12]="aabYoungWingedTwilight"
creatB[13]="aabWolfBlack" 
creatB[14]="aabWolfRed"


--Rank C Creatures
creatC = {}
creatC[1]="aacBoar"
creatC[2]="aacBonewolf"


--Rank D Creautres
creatD = {}
creatD[1]="aadGiantFish"
creatD[2]="aadGiantGuar"
creatD[3]="aadGoldenSaint"
creatD[4]="aaSkeletonChampLarge"

--Solsteim Creatures
--Rank A
creatSolsteima = {}
creatSolsteima[1]="aaabearcub"
creatSolsteima[2]="aaasnowbear"
creatSolsteima[3]="aaaspriggansapling"
creatSolsteima[4]="aaarieklingrunt"
creatSolsteima[5]="aaawolfpup"
creatSolsteima[6]="aaawolfpupred"
creatSolsteima[7]="aaabosssprigganmother" --SprigganMotherBoss



saveme.save = function(pid, cmd)
cmd2 = cmd[2]
preTable = {}

--create or read json

		preTable = jsonInterface.load("preObjects.json")

	
--create table for this point
local cell = tes3mp.GetCell(pid)

local locref = ""

if cmd2 =="a" then
  local rando = math.random(22)
  locref = creatA[rando]
elseif cmd2 =="b" then
  local rando = math.random(14)
  locref = creatB[rando]
elseif cmd2 =="c" then
  local rando = math.random(2)
  locref = creatC[rando]
elseif cmd2 =="d" then
  local rando = math.random(4)
  locref = creatD[rando]
elseif cmd2 =="solsteimaa" then
  local rando = math.random(6)
  locref = creatSolsteima[rando]
else
  locref = "aaaAlitBaby"
end


local loc = {
        packetType = "spawn",
        refId = locref,
        location = { posX = tes3mp.GetPosX(pid), posY = tes3mp.GetPosY(pid), posZ = tes3mp.GetPosZ(pid), rotX = tes3mp.GetRotX(pid), rotY = 0, rotZ= tes3mp.GetRotZ(pid) }
        }

if preTable[cell] ~= nil then
else
preTable[cell] = {}
end


--save table to json
table.insert(preTable[cell],loc)
jsonInterface.save("preObjects.json", preTable, config.playerKeyOrder )

logicHandler.CreateObjectAtLocation(cell, loc.location, locref, "spawn")

tes3mp.SendMessage(pid,"saved bro\n"..cell,false)
end


saveme.save2 = function(pid, cmd)
cmd2 = cmd[2]
cmd3 = cmd[3]
preTable = {}

--create or read json

		preTable = jsonInterface.load("preObjects.json")

	
--create table for this point
local cell = tes3mp.GetCell(pid)

local locref = ""

if cmd2 =="a" then
  local rando = tonumber(cmd3)
  locref = creatA[rando]
elseif cmd2 =="b" then
  local rando = tonumber(cmd3)
  locref = creatB[rando]
elseif cmd2 =="c" then
  local rando = tonumber(cmd3)
  locref = creatC[rando]
elseif cmd2 =="d" then
  local rando = tonumber(cmd3)
  locref = creatD[rando]
elseif cmd2 =="solsteima" then
  local rando = tonumber(cmd3)
  locref = creatSolsteima[rando]
else
  locref = "aaaAlitBaby"
end


local loc = {
        packetType = "spawn",
        refId = locref,
        location = { posX = tes3mp.GetPosX(pid), posY = tes3mp.GetPosY(pid), posZ = tes3mp.GetPosZ(pid), rotX = tes3mp.GetRotX(pid), rotY = 0, rotZ= tes3mp.GetRotZ(pid) }
        }

if preTable[cell] ~= nil then
else
preTable[cell] = {}
end


--save table to json
table.insert(preTable[cell],loc)
jsonInterface.save("preObjects.json", preTable, config.playerKeyOrder )
logicHandler.CreateObjectAtLocation(cell, loc.location, locref, "spawn")
tes3mp.SendMessage(pid,"saved bro\n"..cell,false)
end



saveme.exactRef = function(pid, cmd)

local preTable = {}

	if cmd[2] == ("spawn" or "place") and cmd[3] ~= nil then

		--read json

			preTable = jsonInterface.load("preObjects.json")
			
			
		--create table for this point

			local cell = tes3mp.GetCell(pid)


			local locoloco = {
					packetType = cmd[2],
					refId = cmd[3],
					location = { posX = tes3mp.GetPosX(pid), posY = tes3mp.GetPosY(pid), posZ = tes3mp.GetPosZ(pid), rotX = tes3mp.GetRotX(pid), rotY = 0, rotZ= tes3mp.GetRotZ(pid) }
					}
			
		-- create cell key if not exists
			if preTable[cell] == nil then preTable[cell] = {} end 
			
			

		--save table to json
			table.insert(preTable[cell],locoloco)
			jsonInterface.save("preObjects.json", preTable, config.playerKeyOrder)

		-- create object to see it
			logicHandler.CreateObjectAtLocation(cell, locoloco.location, locoloco.refId, locoloco.packetType)
			
		-- save this command for the "again" command
			Players[pid].LastCommand = {[1] = cmd[1], [2] = cmd[3], [3] = cmd[3]}
			
		-- finish
			tes3mp.SendMessage(pid,"saved bro\n",false)
	else
		tes3mp.SendMessage(pid,"that was wrong\n",false)
	end

end

saveme.exactRefAgain = function(pid, cmd)
	if Players[pid].LastCommand ~= nil then
	 -- just do 
	 saveme.exactRef(pid, Players[pid].LastCommand)
	end
end


customCommandHooks.registerCommand("save1", saveme.save2)
customCommandHooks.registerCommand("save2", saveme.save)
customCommandHooks.registerCommand("ref", saveme.exactRef)
customCommandHooks.registerCommand("again", saveme.exactRefAgain)
customCommandHooks.registerCommand("delete", preObjectsAndDeletions.DeleteCommand)
customCommandHooks.registerCommand("delete", preObjectsAndDeletions.OffDeleteCommand)
customEventHooks.registerHandler("OnObjectActivate", preObjectsAndDeletions.OnObjectActivate)
customEventHooks.registerHandler("OnCellLoad", preObjectsAndDeletions.AddPreexistingObjects)
customEventHooks.registerHandler("OnPlayerCellChange", preObjectsAndDeletions.FixCell)
