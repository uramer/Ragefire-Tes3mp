--[[
    This needs to be moved elsewhere, as it has nothing to do with crafting tutorials:

    elseif refId == "divayth fyr" and Players[pid].data["banned"] == nil then 
		Players[pid].data.banned = 0
	elseif refId == "calvario" then
		logicHandler.RunConsoleCommandOnPlayer(pid, 'journal "B3_ZainabBride" 20')
		logicHandler.RunConsoleCommandOnPlayer(pid, 'journal "B3_ZainabBride" 25')
    end
]]


tutorialKills = {}

tutorialkills.messageBoxText = color.White .. "View " .. color.LightGreen .. "chat " .. color.White .. "window to see a new tip."

tutorialKills.ShowMessageBox = function(pid)
    tes3mp.MessageBox(
        pid, -1,
        tutorialkills.messageBoxText
    )
end

tutorialkills.handlers = {
    ["skeleton entrance"] = function(pid)
        Players[pid].data.bonemeal = 0
        tes3mp.SendMessage(pid,
            color.Yellow .. "Beginner Tip: " .. color.Gray .. "Bonemeal " ..
                color.Yellow .. " can be used to craft ertain types of armor.\n" .. 
                color.White .. "Type " .. color.Gold .. "/craft " .. color.White .. "to access the crafting menu.\n",
            false
        )
    end,
    
    ["guar_feral"] = function(pid)
        Players[pid].data.guarhide = 0
		tes3mp.SendMessage(
            pid,
            color.Yellow .. "Beginner Tip: Use Guar Hides to make " .. color.Gray .. "leather.\n" ..
                color.White .. "Type " .. color.Gold .. "/leather " .. color.White .. "to access the " .. 
                color.Gray .. "leather " .. color.White .. "menu.\n",
            false
        )
    end,

    ["alit"] = function(pid)
        Players[pid].data.alithide = 0
		tes3mp.SendMessage(
            pid,
            color.Yellow .. "Beginner Tip: Use Alit Hides to make " ..  color.Gray .."leather.\n" ..
                color.White .. "Type " .. color.Gold .. "/leather " .. color.White ..
                "to access the " .. color.Coral .. "leather " .. color.White .. "menu.\n",
            false
        )
    end,
    
    ["centurion_spider"] = function(pid)
        Players[pid].data.centurionspider = 0
        tes3mp.SendMessage(
            pid,
            color.Yellow .. "Beginner Tip: Use scrap metal to " .. color.Gray .. "craft " ..
                color.Yellow .. "Dwarven Armor.\n",
            false
        )
    end,

    ["kagouti"] = function(pid)
        Players[pid].data.kagouti = 0
		tes3mp.SendMessage(
            pid,
            color.Yellow .. "Beginner Tip: Use Kagouti Hides  to make " .. color.Gray .. "leather.\n" .. 
		        color.White .. "Type " .. color.Gold .. "/leather " .. color.White .. "to access the " .. 
                color.Coral .. "leather " .. color.White .. "menu.\n",
            false
        )
    end
}


tutorialKills.ProcessLatestKill = function(pid, refId)
    local handler = tutorialKills.handlers[refId]
    if handler ~= nil then
        handler(pid)
        tutorialKills.ShowMessageBox(pid)
    end
end

tutorialKills.OnActorDeath = function(eventStatus, pid, cellDescription)
    local uniqueIndex = tes3mp.GetActorRefNum(0) .. "-" .. tes3mp.GetActorMpNum(0)
    local objectData = LoadedCells[cellDescription].data.objectData[uniqueIndex]
	if tes3mp.DoesActorHavePlayerKiller(0) then
        if objectData ~= nil then
                local refId = objectData.refId
                tutorialKills.ProcessLatestKill(pid, refId)
        end
	end

end

customEventHooks.registerHandler("OnActorDeath", tutorialKills.OnActorDeath)