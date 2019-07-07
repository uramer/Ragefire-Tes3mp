rageExp = {}
rageExp.IDsToPoints = jsonInterface.load("rageExp.json")
rageExp.rageCustomVariables = {
    "rageExp", "rageExpProgress", "rageLevel", "ragePointsSpent", "ragePoints", "warriorFatigueRegen",
    "warriorBlockSkill", "warriorProficiency", "warriorWeaponMasteryChosen", "warriorAddStrength",
    "warriorShockingStrike", "warriorFreezingStrike", "warriorMagicResistance", "warriorAddAgility",
    "warriorPoisonResistance", "warriorMagickaRegen", "resistanceMasteryChosen", "warriorResistFrostMastery",
    "warriorResistFireMastery", "warriorArmorMasteryChosen", "warriorHeavyArmorMastery", "warriorMediumArmorMastery",
    "warriorResistanceMasteryChosen", "warriorHealthRegen", "nightbladeProficiency", "nightbladeFatigueRegen",
    "nightbladeSmokeScreen", "nightbladeShortbladeMastery", "nightbladeDarkStrength", "nightbladeAcrobatics"
}
rageExp.rageCustomVariables2 = { "ragePointsMax" }
	
rageExp.Login = function(eventStatus, pid)

    if eventStatus.validCustomHandlers then --check if some other script made this event obsolete

        if Players[pid].data.customVariables["ragePointsMax"] == nil then
            Players[pid].data.customVariables["ragePointsMax"] = 100
        end

        for _, value in pairs(rageExp.rageCustomVariables) do
            if Players[pid].data.customVariables[value] == nil then
                Players[pid].data.customVariables[value] = 0
            end
        end

    end
end

rageExp.GetDifficulty = function(pid)
    local difficulty = Players[pid].data.settings.difficulty

    if difficulty == "default" then
        difficulty = config.difficulty
    end

    return difficulty
end

rageExp.GetPoints = function(refId, pid)
    if rageExp.IDsToPoints[refId] == nil then
        return nil
    end

    local difficulty = rageExp.GetDifficulty(pid)
		
    local basePoints = rageExp.IDsToPoints[refId].points
    local extraPoints = math.random(-basePoints / 10, basePoints / 10)
    local totalPoints = basePoints + extraPoints

    return math.ceil(totalPoints)
end

local BASE_XP= 100

rageExp.TotalLevelXp = function(level)
    local xp =  math.floor( BASE_XP * ( ( level + 1 ) ^ 2.5 ) * 0.5 )

    if level == 0 then
        xp = xp + 60
    end

    if level == 1 then
        xp = xp - 60
    end

    return xp
end

rageExp.ProcessLatestKill = function(pid, refId, partySize)
    if partySize == nil then
        partySize = 1
    end
	
    tes3mp.LogMessage(enumerations.log.INFO, "Running rageExp.ProcessLatestKill() for pid " .. pid .. ", refId " .. refId)

    local customVars = Players[pid].data.customVariables

    totalPoints = rageExp.getPoints(refId, pid)

    if totalPoints ~= nil and totalPoints > 0 then
        totalPoints = totalPoints * rageExp.PartySizeCoefficient(partySize)
        customVars.rageExp = customVars.rageExp + totalPoints

        tes3mp.MessageBox(
            pid, -1,
            color.White .. "You have gained " .. color.LightGreen .. totalPoints .. color.White .. " experience"
        )
    end
    
    if customVars.rageExp >= rageExp.TotalLevelXp(customVars.rageLevel + 1) then
        customVars.rageLevel = customVars.rageLevel + 1
        customVars.ragePoints = customVars.ragePoints + 5
        
        tes3mp.PlaySpeech(pid, "fx/magic/conjH.wav") --Conjuration Hit sound
        
        tes3mp.MessageBox(pid,-1, color.White .. "You have gained a " .. color.Coral .. "RageLevel" .. color.White .. "!\n")
        
        tes3mp.SendMessage(
            pid,
            color.BlueViolet .. "Congratulations! You are now Rage Level " .. customVars.rageLevel  .. "!\n" ..
                color.White .. "Type " .. color.Gold .. "/rage " .. color.White .. "to bring up the " ..
                color.Coral .. "Rage " ..color.White .. "menu.\n",
            false
        )
    end
end

local PENALTY_FOR_2 = 0.25
local PENALTY_FOR_INF = 0.75

rageExp.PartySizeCoefficient = function(partySize)
    if partySize == 1 then
        return 1
    end

    local penalty = ( PENALTY_FOR_INF * partySize - 2 * ( PENALTY_FOR_2 - PENALTY_FOR_INF ) ) / partySize

    return 1 - penalty
end

rageExp.OnActorDeath = function(eventStatus, pid, cellDescription)

    if eventStatus.validCustomHandlers then --check if some other script made this event obsolete

        local uniqueIndex = tes3mp.GetActorRefNum(0) .. "-" .. tes3mp.GetActorMpNum(0)

        if tes3mp.DoesActorHavePlayerKiller(0) then
            local killerPid = tes3mp.GetActorKillerPid(0)
            
            if LoadedCells[cellDescription].data.objectData[uniqueIndex] ~= nil then
                local refId = LoadedCells[cellDescription].data.objectData[uniqueIndex].refId

                if GroupParty.IsParty(killerPid) then
                    local CurrentCell = tes3mp.GetCell(killerPid)
                    local partyId = GroupParty.WhichParty(killerPid)
                    
                    for i, p in pairs(Partytable[partyId].player) do
                        if tes3mp.GetCell(p.pd) == CurrentCell then
                            rageExp.ProcessLatestKill(p.pd, refId, GroupParty.HowMuchPlayersInParty(partyId))
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
		
rageExp.Cmd = function(pid, cmd)
    local customVars = Players[pid].data.customVariables

    local nextLevelXp = rageExp.TotalLevelXp(customVars.rageLevel + 1)
    local currentLevelXp = rageExp.TotalLevelXp(customVars.rageLevel)

    customVars.rageExpProgress = customVars.rageExp - currentLevelXp
    customVars.rageExpRequired = nextLevelXp - currentLevelXp
    customVars.rageExpPercentage = math.floor(customVars.rageExpProgress / customVars.rageExpRequired * 100)

    Players[pid].currentCustomMenu = "warrior tree"
    menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)		
end

rageExp.SendSpells = function(pid, remove, add)
    if table.getn(remove) > 0 then
        tes3mp.ClearSpellbookChanges(pid)
        tes3mp.SetSpellbookChangesAction(pid, enumerations.spellbook.REMOVE)

        for _, spellId in pairs(remove) do
            tableHelper.removeValue(Players[pid].data.spellbook, spellId)
            tes3mp.AddSpell(pid, spellId)
        end

        tes3mp.SendSpellbookChanges(pid)
    end

    if table.getn(add) > 0 then
        tes3mp.ClearSpellbookChanges(pid)
        tes3mp.SetSpellbookChangesAction(pid, enumerations.spellbook.ADD)

        for _, spellId in pairs(add) do
            tableHelper.removeValue(Players[pid].data.spellbook, spellId)
            table.insert(Players[pid].data.spellbook, spellId)
            tes3mp.AddSpell(pid, spellId)
        end

        tes3mp.SendSpellbookChanges(pid)
    end

    tableHelper.cleanNils(Players[pid].data.spellbook)
end


rageExp.CommandNight = function(pid, cmd)
    local list = {}

    if Players[pid].data.customVariables.stealthHunterInTheNight == 1 then
        table.insert(list, "hunter_in_the_night")
    end

    if Players[pid].data.character.race == "khajiit" then
        table.insert(list, "eye_of_night")
    end

    if table.getn(list) > 0 then
        if cmd[2] == "off" then
            rageExp.SendSpells(pid, list, {})
        elseif cmd[2] == "on" then
            rageExp.SendSpells(pid, {}, list)
        end
    end
end

local WATER_BREATHING_LIST = {"argonian_breathing"}

rageExp.CommandWater = function(pid, cmd)
    if Players[pid].data.character.race ~= "argonian"
        return
    end
    
    if cmd[2] == "on" and  then
        rageExp.SendSpells(pid, {}, WATER_BREATHING_LIST)
    elseif cmd[2] == "off" then
        rageExp.SendSpells(pid, WATER_BREATHING_LIST, {})
    end
end


customCommandHooks.registerCommand("night", rageExp.CommandNight)
customCommandHooks.registerCommand("water", rageExp.CommandWater)			
customCommandHooks.registerCommand("rage", rageExp.Cmd)
customCommandHooks.registerCommand("help", rageExp.Commands.Help)

customEventHooks.registerHandler("OnActorDeath", rageExp.OnActorDeath)
customEventHooks.registerHandler("OnPlayerFinishLogin", rageExp.Login)
customEventHooks.registerHandler("OnPlayerEndCharGen", rageExp.Login)

return rageExp