rageExp = {}
rageExp.IDsToPoints = jsonInterface.load("rageExp.json")
rageExp.rageCustomVariables = { "rageExp", "rageExpProgress", "rageLevel", "ragePointsSpent", "ragePoints", "warriorFatigueRegen", "warriorBlockSkill", "warriorProficiency", "warriorWeaponMasteryChosen", "warriorAddStrength", "warriorShockingStrike", "warriorFreezingStrike", "warriorMagicResistance", "warriorAddAgility", "warriorPoisonResistance", "warriorMagickaRegen", "resistanceMasteryChosen", "warriorResistFrostMastery", "warriorResistFireMastery", "warriorArmorMasteryChosen", "warriorHeavyArmorMastery", "warriorMediumArmorMastery", "warriorResistanceMasteryChosen", "warriorHealthRegen", "nightbladeProficiency", "nightbladeFatigueRegen", "nightbladeSmokeScreen", "nightbladeShortbladeMastery", "nightbladeDarkStrength", "nightbladeAcrobatics" }
rageExp.rageCustomVariables2 = { "ragePointsMax" }
	
rageExp.Login = function(eventStatus, pid)

if eventStatus.validCustomHandlers then --check if some other script made this event obsolete

if Players[pid].data.customVariables["ragePointsMax"] == nil then Players[pid].data.customVariables["ragePointsMax"] = 100 end

for _, value in pairs(rageExp.rageCustomVariables) do
if Players[pid].data.customVariables[value] == nil then
	Players[pid].data.customVariables[value] = 0
end
end
end
end


rageExp.ProcessLatestKill = function(pid, refId)
	
    tes3mp.LogMessage(enumerations.log.INFO, "Running rageExp.ProcessLatestKill() for pid " .. pid .. ", refId " .. refId)

    if rageExp.IDsToPoints[refId] ~= nil then
		
        local basePoints = rageExp.IDsToPoints[refId].points
        local extraPoints = math.random(-basePoints / 10, basePoints / 10)
        local totalPoints = basePoints + extraPoints

		-- Add a bonus based on the player's current difficulty
		local difficulty = Players[pid].data.settings.difficulty

		if difficulty == "default" then
		difficulty = config.difficulty
		end

		totalPoints = totalPoints
		totalPoints = math.ceil(totalPoints)

        if totalPoints > 0 then
            Players[pid].data.customVariables.rageExp = Players[pid].data.customVariables.rageExp + totalPoints
            tes3mp.MessageBox(pid, -1, color.White .. "You have gained " .. color.LightGreen ..
                totalPoints .. color.White .. " experience")
        end
    end
	
	local currentRageLevel = Players[pid].data.customVariables.rageLevel
	local baseXp = 100
	local nextlevel = math.floor(baseXp *((currentRageLevel + 1) ^ 2.5) / 2)
	
	if Players[pid].data.customVariables.rageLevel == 0 and Players[pid].data.customVariables.rageExp >= nextlevel + 60 then
		Players[pid].data.customVariables.rageLevel = Players[pid].data.customVariables.rageLevel + 1
		Players[pid].data.customVariables.ragePoints = Players[pid].data.customVariables.ragePoints + 5
		logicHandler.RunConsoleCommandOnPlayer(pid, 'playsound "Conjuration Hit"')
		local levelMessage = Players[pid].data.customVariables.rageLevel
		tes3mp.MessageBox(pid,-1, color.White .. "You have gained a " .. color.Coral .. "RageLevel" .. color.White .. "!\n")
		tes3mp.SendMessage(pid, color.BlueViolet .. "Congratulations! You are now Rage Level " .. color.BlueViolet .. levelMessage  .. "!\n" ..
								color.White .. "Type " .. color.Gold .. "/rage " .. color.White .. "to bring up the " .. color.Coral .. "Rage " .. color.White .. "menu.\n",false)
	elseif Players[pid].data.customVariables.rageExp >= nextlevel and Players[pid].data.customVariables.rageLevel >= 1 then
		Players[pid].data.customVariables.rageLevel = Players[pid].data.customVariables.rageLevel + 1
		Players[pid].data.customVariables.ragePoints = Players[pid].data.customVariables.ragePoints + 5
		logicHandler.RunConsoleCommandOnPlayer(pid, 'playsound "Conjuration Hit"')
		local levelMessage = Players[pid].data.customVariables.rageLevel
		tes3mp.MessageBox(pid,-1, color.White .. "You have gained a " .. color.Coral .. "RageLevel" .. color.White .. "!\n")
		tes3mp.SendMessage(pid, color.BlueViolet .. "Congratulations! You are now Rage Level " .. color.BlueViolet .. levelMessage  .. "!\n",false)
	end
end



rageExp.ProcessLatestKillinParty = function(pid, refId, nerfFactor)
	
    tes3mp.LogMessage(enumerations.log.INFO, "Running rageExp.ProcessLatestKill() for pid " .. pid .. ", refId " .. refId)

    if rageExp.IDsToPoints[refId] ~= nil then
		
        local basePoints = rageExp.IDsToPoints[refId].points
        local extraPoints = math.random(-basePoints / 10, basePoints / 10)
        local totalPoints = basePoints + extraPoints

		-- Add a bonus based on the player's current difficulty
		local difficulty = Players[pid].data.settings.difficulty

		if difficulty == "default" then
		difficulty = config.difficulty
		end

		totalPoints = totalPoints / 1.35
		totalPoints = math.ceil(totalPoints)
		
		
		
		
        if totalPoints > 0 then
            Players[pid].data.customVariables.rageExp = Players[pid].data.customVariables.rageExp + totalPoints
            tes3mp.MessageBox(pid, -1, color.White .. "You have gained " .. color.LightGreen ..
                totalPoints .. color.White .. " group experience")
        end
    end
	
	local currentRageLevel = Players[pid].data.customVariables.rageLevel
	local baseXp = 100
	local nextlevel = math.floor(baseXp *((currentRageLevel + 1) ^ 2.5) / 2)
	
	if Players[pid].data.customVariables.rageLevel == 0 and Players[pid].data.customVariables.rageExp >= nextlevel + 60 then
		Players[pid].data.customVariables.rageLevel = Players[pid].data.customVariables.rageLevel + 1
		Players[pid].data.customVariables.ragePoints = Players[pid].data.customVariables.ragePoints + 5
		local levelMessage = Players[pid].data.customVariables.rageLevel
		tes3mp.MessageBox(pid,-1, color.White .. "You have gained a " .. color.Coral .. "RageLevel" .. color.White .. "!\n")
		tes3mp.SendMessage(pid, color.BlueViolet .. "Congratulations! You are now Rage Level " .. color.BlueViolet .. levelMessage  .. "!\n" ..
								color.White .. "Type " .. color.Gold .. "/rage " .. color.White .. "to bring up the " .. color.Coral .. "Rage " .. color.White .. "menu.\n",false)
	elseif Players[pid].data.customVariables.rageExp >= nextlevel and Players[pid].data.customVariables.rageLevel >= 1 then
		Players[pid].data.customVariables.rageLevel = Players[pid].data.customVariables.rageLevel + 1
		Players[pid].data.customVariables.ragePoints = Players[pid].data.customVariables.ragePoints + 5
		local levelMessage = Players[pid].data.customVariables.rageLevel
		tes3mp.MessageBox(pid,-1, color.White .. "You have gained a " .. color.Coral .. "RageLevel" .. color.White .. "!\n")
		tes3mp.SendMessage(pid, color.BlueViolet .. "Congratulations! You are now Rage Level " .. color.BlueViolet .. levelMessage  .. "!\n",false)
	end
end

rageExp.Decide = function(eventStatus, pid, cellDescription)

if eventStatus.validCustomHandlers then --check if some other script made this event obsolete

        local uniqueIndex = tes3mp.GetActorRefNum(0) .. "-" .. tes3mp.GetActorMpNum(0)

			if tes3mp.DoesActorHavePlayerKiller(0) then
				local killerPid = tes3mp.GetActorKillerPid(0)
				
			 if LoadedCells[cellDescription].data.objectData[uniqueIndex] ~= nil then
				local refId = LoadedCells[cellDescription].data.objectData[uniqueIndex].refId

				if GroupParty.IsParty(killerPid) then
					local CurrentCell = tes3mp.GetCell(killerPid)
					local partyId = GroupParty.WhichParty(killerPid)
					local nerfFactor = GroupParty.HowMuchPlayersInParty(partyId)
					for i, p in pairs(Partytable[partyId].player) do
						if tes3mp.GetCell(p.pd) == CurrentCell then
							rageExp.ProcessLatestKillinParty(p.pd, refId, nerfFactor)
						end
					end
				else
					rageExp.ProcessLatestKill(killerPid, refId)
				end
						
             end
			end
end
end

rageExp.Help = function(pid, cmd)
        -- Check "scripts/menu/help.lua" if you want to change the contents of the help menus
        Players[pid].currentCustomMenu = "ragefire help"
        menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
end
		
rageExp.cmd = function(pid, cmd)
			local currentRageLevel = Players[pid].data.customVariables.rageLevel
			local baseXp = 100
			local nextLevel = math.floor(baseXp *((currentRageLevel + 1) ^ 2.5) / 2)
			local nextLevelTotal = math.floor(baseXp *((currentRageLevel) ^ 2.5) / 2)
			local expTowardsNextLevel = nextLevel - Players[pid].data.customVariables.rageExp
			local expForNextLevel = nextLevel - nextLevelTotal
			if currentRageLevel == 0 then
				Players[pid].data.customVariables.rageExpProgress = expForNextLevel - expTowardsNextLevel
				Players[pid].data.customVariables.rageExpRequired = nextLevel - nextLevelTotal + 60
				Players[pid].data.customVariables.rageExpPercentage = math.floor(Players[pid].data.customVariables.rageExpProgress / Players[pid].data.customVariables.rageExpRequired * 100)
				Players[pid].currentCustomMenu = "warrior tree"
				menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)		
			elseif currentRageLevel == 1 then
				Players[pid].data.customVariables.rageExpProgress = expForNextLevel - expTowardsNextLevel - 60
				Players[pid].data.customVariables.rageExpRequired = nextLevel - nextLevelTotal - 60
				Players[pid].data.customVariables.rageExpPercentage = math.floor(Players[pid].data.customVariables.rageExpProgress / Players[pid].data.customVariables.rageExpRequired * 100)
				Players[pid].currentCustomMenu = "warrior tree"
				menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
			else			
			Players[pid].data.customVariables.rageExpProgress = expForNextLevel - expTowardsNextLevel
			Players[pid].data.customVariables.rageExpRequired = nextLevel - nextLevelTotal
			Players[pid].data.customVariables.rageExpPercentage = math.floor(Players[pid].data.customVariables.rageExpProgress / Players[pid].data.customVariables.rageExpRequired * 100)
			Players[pid].currentCustomMenu = "warrior tree"
			menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
			end
end

rageExp.abilityCmd = function(pid, cmd)
--[[ Rage and Race Abilities ]]--

		if cmd[1] == "night" and cmd[2] == "off" and Players[pid].data.customVariables.stealthHunterInTheNight == 1 and Players[pid].data.character.race == "khajiit" then
			logicHandler.RunConsoleCommandOnPlayer(pid, "removespell hunter_in_the_night")
			logicHandler.RunConsoleCommandOnPlayer(pid, "removespell eye_of_night")

		elseif cmd[1] == "night" and cmd[2] == "off" and Players[pid].data.customVariables.stealthHunterInTheNight == 1 and Players[pid].data.character.race ~= "khajiit" then
			logicHandler.RunConsoleCommandOnPlayer(pid, "removespell hunter_in_the_night")

		elseif cmd[1] == "night" and cmd[2] == "off" and Players[pid].data.customVariables.stealthHunterInTheNight == 0 and Players[pid].data.character.race == "khajiit" then
			logicHandler.RunConsoleCommandOnPlayer(pid, "removespell eye_of_night")

		elseif cmd[1] == "night" and cmd[2] == "on" and Players[pid].data.customVariables.stealthHunterInTheNight == 1 and Players[pid].data.character.race == "khajiit" then
			logicHandler.RunConsoleCommandOnPlayer(pid, "addspell hunter_in_the_night")
			logicHandler.RunConsoleCommandOnPlayer(pid, "addspell eye_of_night")

		elseif cmd[1] == "night" and cmd[2] == "on" and Players[pid].data.customVariables.stealthHunterInTheNight == 1 and Players[pid].data.character.race ~= "khajiit" then
			logicHandler.RunConsoleCommandOnPlayer(pid, "addspell hunter_in_the_night")

		elseif cmd[1] == "night" and cmd[2] == "on" and Players[pid].data.customVariables.stealthHunterInTheNight == 0 and Players[pid].data.character.race == "khajiit" then
			logicHandler.RunConsoleCommandOnPlayer(pid, "addspell eye_of_night")

		elseif cmd[1] == "water" and cmd[2] == "on" and Players[pid].data.character.race == "argonian" then
			logicHandler.RunConsoleCommandOnPlayer(pid, 'addspell "argonian_breathing"')

		elseif cmd[1] == "water" and cmd[2] == "off" and Players[pid].data.character.race == "argonian" then
			logicHandler.RunConsoleCommandOnPlayer(pid, 'removespell "argonian_breathing"')		
		end
end
--[[ End Rage Abilities ]]--


customCommandHooks.registerCommand("night", rageExp.abilityCmd)
customCommandHooks.registerCommand("water", rageExp.abilityCmd)			
customCommandHooks.registerCommand("rage", rageExp.cmd)
customCommandHooks.registerCommand("help", rageExp.Help)
customEventHooks.registerHandler("OnActorDeath", rageExp.Decide)
customEventHooks.registerHandler("OnPlayerFinishLogin", rageExp.Login)
customEventHooks.registerHandler("OnPlayerEndCharGen", rageExp.Login)