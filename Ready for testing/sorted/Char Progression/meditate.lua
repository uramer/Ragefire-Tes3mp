--meditate pastebin: https://pastebin.com/vz4DQFaT
--meditate command

meditate = {}

meditate.config = {
    meditateInterval = 60,
    meditateDuration = 5,
    healthRegain = 0.25,
    fatigueRegain = 0.25,
    magickaRegain = 0.25
}

meditate.cmd = function(pid, cmd)
    if Players[pid].data.customVariables.meditateTutorial == nil or Players[pid].data.customVariables.meditateTutorial == false then
        Players[pid].currentCustomMenu = "meditate tutorial"
        menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
        Players[pid].data.customVariables.meditateTutorial = true

    elseif Players[pid].data.customVariables.meditateTutorial == true then
        local currentTime = os.time()

        if Players[pid].data.customVariables.lastMeditate == nil or
            currentTime >= Players[pid].data.customVariables.lastMeditate + meditate.config.meditateInterval 
        then

            Players[pid].data.customVariables.lastMeditate = currentTime
            logicHandler.RunConsoleCommandOnPlayer(pid, "disableplayercontrols")
            logicHandler.RunConsoleCommandOnPlayer(pid, "forcesneak")

            tes3mp.SendMessage(pid, color.LightGreen .. "You stand still, meditating.\n", false)

            Players[pid].meditateTimerId = tes3mp.CreateTimerEx(
                "OnMeditateTimeExpiration",
                time.seconds(meditate.config.meditateDuration),
                "i",
                pid
            )
            tes3mp.StartTimer(Players[pid].meditateTimerId)

            Players[pid].meditateReminderTimerId = tes3mp.CreateTimerEx(
                "OnMeditateReminderTimeExpiration",
                time.seconds(meditate.config.meditateInterval + 5 - meditate.config.meditateDuration),
                "i",
                pid
            )
            tes3mp.StartTimer(Players[pid].meditateReminderTimerId)

            if Players[pid].data.character.race == "wood elf" then
                logicHandler.RunConsoleCommandOnPlayer(pid, "addspell hide")
            end

        else
            local remainingSeconds = Players[pid].data.customVariables.lastMeditate +
                meditate.config.meditateInterval - currentTime
            local message = color.Grey .. "Sorry! You can't meditate again for another "

            if remainingSeconds > 1 then
                message = message .. remainingSeconds .. " seconds"
            else
                message = message .. " second"
            end

            message = message .. "\n"
            tes3mp.SendMessage(pid, message, false)
        end
    end

end


customCommandHooks.registerCommand("med", meditate.cmd)
customCommandHooks.registerCommand("meditate", meditate.cmd)

function OnMeditateTimeExpiration(pid)

    if Players[pid] ~= nil and Players[pid].meditateTimerId ~= nil then
        local healthCurrent = tes3mp.GetHealthCurrent(pid)
        local healthBase = tes3mp.GetHealthBase(pid)
        Players[pid].data.stats.healthCurrent = healthCurrent + healthBase * meditate.config.healthRegain

        local fatigueCurrent = tes3mp.GetFatigueCurrent(pid)
        local fatigueBase = tes3mp.GetFatigueBase(pid)
        Players[pid].data.stats.fatigueCurrent = fatigueCurrent + fatigueBase * meditate.config.fatigueRegain

        local magickaCurrent = tes3mp.GetMagickaCurrent(pid)
        Players[pid].data.stats.magickaCurrent = magickaCurrent        

        tes3mp.LogMessage(2, "Birthsign of " .. Players[pid].accountName .. " is " .. Players[pid].data.character.birthsign)

        if Players[pid].data.character.birthsign ~= "wombburned" then
            tes3mp.LogAppend(2, "- Regaining magicka")

            local magickaBase = tes3mp.GetMagickaBase(pid)
            Players[pid].data.stats.magickaCurrent = magickaCurrent + magickaBase *  meditate.config.magickaRegain
        end

        Players[pid]:LoadStatsDynamic()

        Players[pid].meditateTimerId = nil
        logicHandler.RunConsoleCommandOnPlayer(pid, "enableplayercontrols")
        logicHandler.RunConsoleCommandOnPlayer(pid, "clearforcesneak")
		logicHandler.RunConsoleCommandOnPlayer(pid, "removespell hide")
        tes3mp.SendMessage(pid, color.LightGreen .. "You feel refreshed as your thoughts clear.\n", false)
    end
end

function OnMeditateReminderTimeExpiration(pid)
    if Players[pid] ~= nil then
        Players[pid]:Message( color.DarkGray .. "You can now meditate again.\n")
        Players[pid].meditateReminderTimerId = nil
    end
end

return meditate