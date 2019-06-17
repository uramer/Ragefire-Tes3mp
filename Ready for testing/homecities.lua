-- home and feather pastebin: https://pastebin.com/khGdzMXd
-- Home Cities put into baseplayer:finishlogin
	 
homecities = {}

-- How often Biginner Tips get displayed in minutes
config.tutorialDuration = 200
 
-- How many minutes until a player can use /pet again
config.coolDownRefresh = 10
 
-- Feather Buff
config.featherDuration = 60
 
 -- How many minutes need to pass between uses of the /warp command by a player(divide by 60)
config.warpInterval = 600
 
-- How many minutes need to pass between uses of the /home command by a player(divide by 60)
config.homeInterval = 1200
 
-- How many seconds a player should spend with their controls disabled when using /home
config.homeDuration = 3
 
-- How many seconds need to pass between uses of the /meditate command by a player
config.meditateInterval = 60
 
-- How many seconds a player should spend with their controls disabled when using /meditate
config.meditateDuration = 5
 -- transport locations

--Transport Locations
--Great Hall
config.transportLocation = {}
-- Great Hall
config.transportLocation["Great Hall"] = {
    cell ="ToddTest",
    pos = { 2180, 2812, -702 },
    rot = { .2, 3.1, }
}
-- Balmora
config.transportLocation["Balmora"] = {
    cell ="-3, -2",
    pos = { -23043, -14457, 497 },
    rot = { .1, 5.55, }
}
-- Caldera
config.transportLocation["Caldera"] = {
    cell ="-2, 2",
    pos = { -10760, 19980, 1337 },
    rot = { .2, .93, }
}
-- Seyda Neen
config.transportLocation["Seyda Neen"] = {
    cell ="-2, -9",
    pos = { -10088, -71371, 152 },
    rot = { .2, .80, }
}
-- Suran
config.transportLocation["Suran"] = {
    cell ="6, -7",
    pos = { 54331, -51063, 161 },
    rot = { .1, 1.5, }
}
-- Mournhold
config.transportLocation["Mournhold, Temple Courtyard"] = {
    cell ="Mournhold, Temple Courtyard",
    pos = { 31.6, -2110.9, 415 },
    rot = { 0, 110, }
}
-- Fort Frostmoth
config.transportLocation["Fort Frostmoth"] = {
    cell ="-22, 17",
    pos = { -174447, 142723.29, 896.426 },
    rot = { 0, -140, }
}
-- MainQuest Holamayan Monastery
-- Entrance
config.transportLocation["Holamayan Monastery"] = {
    cell ="19, -4",
    pos = { 159116.125, -30523.29, 2010.426 },
    rot = { 0, 0, }
}
-- Exit
config.transportLocation["Azura's Coast Region"] = {
    cell ="19, -4",
    pos = { 158987.125, -31219.29, 2006.426 },
    rot = { 0, -2, }
}
-- Khuul
config.transportLocation["Khuul"] = {
    cell ="-9, 16",
    pos = { -67758, 139179, 136 },
    rot = { .5, -1.2, }
}
-- Gnisis
config.transportLocation["Gnisis"] = {
    cell ="-11, 11",
    pos = { -85624.372, 92566.6045, 1017 },
    rot = { 0, 0, }
}
-- Urshilaku Camp
config.transportLocation["Urshilaku Camp"] = {
    cell ="-4, 18",
    pos = { -26876.372, 151333.6045, 710 },
    rot = { .2, 1, }
}
-- Dagon Fel
config.transportLocation["Dagon Fel"] = {
    cell ="7, 22",
    pos = { 62868, 184255, 82 },
    rot = { 0, 1.5, }
}
-- Vos
config.transportLocation["Vos"] = {
    cell ="11, 14",
    pos = { 92821, 116591, 1429 },
    rot = { .25, 2.2, }
}
-- Tel Mora
config.transportLocation["Tel Mora"] = {
    cell ="13, 14",
    pos = { 106874, 117345, 173 },
    rot = { .25, 0, }
}
-- Tel Aruhn
config.transportLocation["Tel Aruhn"] = {
    cell ="15, 5",
    pos = { 126671, 46897, 684 },
    rot = { 0, 3.4, }
}
-- Sadrith Mora
config.transportLocation["Sadrith Mora"] = {
    cell ="17, 4",
    pos = { 146773, 35018, 525 },
    rot = { 0, 1.5, }
}
-- Tel Fyr
config.transportLocation["Tel Fyr"] = {
    cell ="15, 1",
    pos = { 123986, 15983, 501 },
    rot = { 0, 4.1, }
}
-- Molag Mar
config.transportLocation["Molag Mar"] = {
    cell ="13, -8",
    pos = { 110358, -62873, 2048 },
    rot = { 0, 3.6, }
}
-- Tel Branora
config.transportLocation["Tel Branora"] = {
    cell ="14, -13",
    pos = { 118646, -102913, 291 },
    rot = { 0, 3.85, }
}
-- Vivec
config.transportLocation["Vivec"] = {
    cell ="3, -10",
    pos = { 30481, -75197, 553 },
    rot = { .1, 2.65, }
}
-- Hla Oad
config.transportLocation["Hla Oad"] = {
    cell ="-6, -5",
    pos = { -46222, -38733, 202 },
    rot = { -.1, 2.05, }
}
-- Gnaar Mok
config.transportLocation["Gnaar Mok"] = {
    cell ="-8, 3",
    pos = { -58755, 26263, 82 },
    rot = { .1, 2.15, }
}
-- Ald-ruhn
config.transportLocation["Ald-ruhn"] = {
    cell ="-2, 6",
    pos = { -15325, 53268, 2176 },
    rot = { -.15, .9, }
}
-- Cavern of the Incarnate
config.transportLocation["Cavern of the Incarnate"] = {
    cell ="Cavern of the Incarnate",
    pos = { 28, -1375, -173 },
    rot = { 0, 0, }
}
-- Pelegiad
config.transportLocation["Pelagiad"] = {
    cell ="0, -7",
    pos = { 1532, -57174, 1429 },
    rot = { .1, 3.2, }
}	
-- Arena Spectators
config.transportLocation["Vivec Arena Pit"] = {
    cell ="Vivec, Arena Pit",
    pos = { 84, -188, 1850 },
    rot = { .1, 0.1, }
}	
-- Vivec Arena
config.transportLocation["Vivec Arena"] = {
    cell ="4, -11",
    pos = { 39124, -86911, 1792 },
    rot = { .1, 1.5, }
}	


-- config.lua just copy there

-- Home Cities
-- Spawn locations for different home cities, a custom addition by Snapjaw
config.homecitySpawns = {}
config.homecitySpawns["location A"] = {
    cell = "21, -10",
    pos = { -174500, -77588, 1071 },
    rot = { 0, 0 }
}
config.homecitySpawns["Balmora"] = {
    cell = "-3, -2",
    pos = { -23537, -16116, 505 },
    rot = { 0, 0 }
}
config.homecitySpawns["Caldera"] = {
    cell = "-2, 2",
    pos = { -12789.073242188, 20478.23046875, 1537 },
    rot = { 0, -75.636917 }
}
config.homecitySpawns["Seyda Neen"] = {
    cell = "-2, -9",
    pos = { -10088, -71371, 152 },
    rot = { .2, .80, }
}
config.homecitySpawns["Suran"] = {
    cell = "6, -7",
    pos = { 53369.47, -50588.0, 167.3029 },
    rot = { 0, -350 }
}
config.homecitySpawns["Fort Frostmoth"] = {
    cell = "-22, 17",
    pos = { -174447, 142723.29, 896.426 },
    rot = { 0, -140, }
}
config.homecitySpawns["Mournhold"] = {
    cell = "Mournhold, Temple Courtyard",
    pos = { 31.6, -2110.9, 415 },
    rot = { 0, 110, }
}
config.homecitySpawns["Sotha Sil"] = {
    cell ="Sotha Sil, Outer Flooded Halls",
    pos = { 3765.372, 61.6045, -63 },
    rot = { 0, 110, }
}
config.homecitySpawns["Khuul"] = {
    cell ="-9, 16",
    pos = { -67758, 139179, 136 },
    rot = { .5, -1.2, }
}
config.homecitySpawns["Gnisis"] = {
    cell ="-11, 11",
    pos = { -85624.372, 92566.6045, 1017 },
    rot = { 0, 0, }
}
config.homecitySpawns["Urshilaku Camp"] = {
    cell ="-4, 18",
    pos = { -26876.372, 151333.6045, 710 },
    rot = { .2, 1, }
}
config.homecitySpawns["Dagon Fel"] = {
    cell ="7, 22",
    pos = { 62868, 184255, 82 },
    rot = { 0, 1.5, }
}
config.homecitySpawns["Vos"] = {
    cell ="11, 14",
    pos = { 92821, 116591, 1429 },
    rot = { .25, 2.2, }
}
config.homecitySpawns["Tel Mora"] = {
    cell ="13, 14",
    pos = { 106874, 117345, 173 },
    rot = { .25, 0, }
}
config.homecitySpawns["Tel Aruhn"] = {
    cell ="15, 5",
    pos = { 126671, 46897, 684 },
    rot = { 0, 3.4, }
}
config.homecitySpawns["Sadrith Mora"] = {
    cell ="17, 4",
    pos = { 146773, 35018, 525 },
    rot = { 0, 1.5, }
}
config.homecitySpawns["Tel Fyr"] = {
    cell ="15, 1",
    pos = { 123986, 15983, 501 },
    rot = { 0, 4.1, }
}
config.homecitySpawns["Molag Mar"] = {
    cell ="13, -8",
    pos = { 110358, -62873, 2048 },
    rot = { 0, 3.6, }
}
config.homecitySpawns["Tel Branora"] = {
    cell ="14, -13",
    pos = { 118646, -102913, 291 },
    rot = { 0, 3.85, }
}
config.homecitySpawns["Vivec"] = {
    cell ="3, -10",
    pos = { 30481, -75197, 553 },
    rot = {.1, 2.65, }
}
config.homecitySpawns["Hla Oad"] = {
    cell ="-6, -5",
    pos = { -46235, -38759, 204 },
    rot = { -.1, 2.05, }
}
config.homecitySpawns["Gnaar Mok"] = {
    cell ="-8, 3",
    pos = { -58755, 26263, 82 },
    rot = { .1, 2.15, }
}
config.homecitySpawns["Ald-ruhn"] = {
    cell ="-2, 6",
    pos = { -15325, 53268, 2176 },
    rot = { .1, 2.15, }
}
config.homecitySpawns["Pelagiad"] = {
    cell ="0, -7",
    pos = { 1532, -57174, 1429 },
    rot = { .1, 2.15, }
}
config.homecitySpawns["Vivec Arena Pit"] = {
    cell ="Vivec, Arena Pit",
    pos = { 98, 227, 1844 },
    rot = { .0, 0.1, }
}
config.homecitySpawns["Vivec Arena"] = {
    cell ="4, -11",
    pos = { 39124, -86911, 1792 },
    rot = { .1, 1.5, }
}

-- home command 
homecities.finish = function(eventStatus, pid)
self = Players[pid]
	if self.data.homecity ~= nil and config.homecitySpawns[self.data.homecity] ~= nil then

	 local homecitySpawn = config.homecitySpawns[self.data.homecity]
		  tes3mp.SetCell(self.pid, homecitySpawn.cell)
				tes3mp.SendCell(self.pid)
			 if config.defaultSpawnPos ~= nil and config.defaultSpawnRot ~= nil then
				tes3mp.SetPos(self.pid, homecitySpawn.pos[1], homecitySpawn.pos[2], homecitySpawn.pos[3])
				tes3mp.SetRot(self.pid, homecitySpawn.rot[1], homecitySpawn.rot[2])
				tes3mp.SendPos(self.pid)
			end   

	elseif config.defaultSpawnCell ~= nil then

				tes3mp.SetCell(self.pid, config.defaultSpawnCell)
				tes3mp.SendCell(self.pid)

				if config.defaultSpawnPos ~= nil and config.defaultSpawnRot ~= nil then
					tes3mp.SetPos(self.pid, config.defaultSpawnPos[1], config.defaultSpawnPos[2], config.defaultSpawnPos[3])
					tes3mp.SetRot(self.pid, config.defaultSpawnRot[1], config.defaultSpawnRot[2])
					tes3mp.SendPos(self.pid)
				end
			

		--baseplayer resurrect
	elseif config.respawnAtTribunalTemple == true then
			currentResurrectType = enumerations.resurrect.TRIBUNAL_TEMPLE
	----------------------------------------------------------------------------
	elseif self.data.homecity ~= nil and config.homecitySpawns[self.data.homecity] ~= nil then

			currentResurrectType = enumerations.resurrect.REGULAR
			local homecitySpawn = config.homecitySpawns[self.data.homecity]

			tes3mp.SetCell(self.pid, homecitySpawn.cell)
			tes3mp.SendCell(self.pid)

			if homecitySpawn.pos ~= nil and homecitySpawn.rot ~= nil then
				tes3mp.SetPos(self.pid, homecitySpawn.pos[1], homecitySpawn.pos[2], homecitySpawn.pos[3])
				tes3mp.SetRot(self.pid, homecitySpawn.rot[1], homecitySpawn.rot[2])
				tes3mp.SendPos(self.pid)
				logicHandler.RunConsoleCommandOnPlayer(self.pid, "tm")
				logicHandler.RunConsoleCommandOnPlayer(self.pid, "tvm")
			end
			
	end
		
		-- feather buff handle
		logicHandler.RunConsoleCommandOnPlayer(self.pid, "removespell home_feather")
		logicHandler.RunConsoleCommandOnPlayer(self.pid, "removespell hide")
		if self.data.customVariables.currentRageLevel == nil then
			self.data.customVariables.currentRageLevel = 1
		end
	
end
	
function OnHomeTimeExpiration(pid)
    if Players[pid] ~= nil and Players[pid].homeTimerId ~= nil then

        local homecity = Players[pid].data.homecity
        local homecitySpawn = config.homecitySpawns[homecity]

        Players[pid].homeTimerId = nil
        logicHandler.RunConsoleCommandOnPlayer(pid, "enableplayercontrols")
        logicHandler.RunConsoleCommandOnPlayer(pid, 'PlaySound "Mysticism Cast"')
        logicHandler.RunConsoleCommandOnPlayer(pid, "addspell home_feather")
        tes3mp.SendMessage(pid, color.LightGreen .. "You have received a " .. color.LightGreen .. "100 " .. color.LightGreen ..
        "point " .. color.BlueViolet .. "feather " .. color.LightGreen .. "buff for " .. color.LightGreen .. "60 " .. color.LightGreen .. "seconds.\n", false)
         tes3mp.SetCell(pid, homecitySpawn.cell)
            tes3mp.SendCell(pid)

            if config.defaultSpawnPos ~= nil and config.defaultSpawnRot ~= nil then
                tes3mp.SetPos(pid, homecitySpawn.pos[1], homecitySpawn.pos[2], homecitySpawn.pos[3])
                tes3mp.SetRot(pid, homecitySpawn.rot[1], homecitySpawn.rot[2])
                tes3mp.SendPos(pid)
        end
    end
end 

function OnHomeReminderTimeExpiration(pid)
	if Players[pid] ~= nil then
    Players[pid]:Message( color.DarkGray .. "You can now use " .. color.Gold .. "/home " .. color.DarkGray .. "again.\n")
	end
end

function OnFeatherTimeExpiration(pid)
    if Players[pid] ~= nil and Players[pid].featherTimerId ~= nil then

    Players[pid].featherTimerId = nil
    logicHandler.RunConsoleCommandOnPlayer(pid, "removespell home_feather")
    tes3mp.SendMessage(pid, color.Gray .. "Your " .. color.BlueViolet .. "feather " .. color.Gray ..
        "buff has worn off.\n", false)
    end
end


homecities.OnFinishLogin = function(eventStatus, pid)
-- feather buff

if eventStatus.validCustomHandlers then --check if some other script made this event obsolete
self = Players[pid]
		logicHandler.RunConsoleCommandOnPlayer(self.pid, "removespell home_feather")
		logicHandler.RunConsoleCommandOnPlayer(self.pid, "removespell hide")
		if self.data.customVariables.currentRageLevel == nil then
			self.data.customVariables.currentRageLevel = 1
		end
end
end		
		
homecities.cmd = function(pid, cmd)

					if Players[pid].data.customVariables.homeTutorial == nil or Players[pid].data.customVariables.homeTutorial == false then
						Players[pid].currentCustomMenu = "home tutorial"
						menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
						Players[pid].data.customVariables.homeTutorial = true


					elseif Players[pid].data.customVariables.homeTutorial == true then

						local currentTime = os.time()

						if Players[pid].data.customVariables.lastHome == nil or
							currentTime >= Players[pid].data.customVariables.lastHome + config.homeInterval then


							Players[pid].data.customVariables.lastHome = currentTime
							logicHandler.RunConsoleCommandOnPlayer(pid, "disableplayercontrols")

							tes3mp.SendMessage(pid, color.DarkGray .. "Returning home in " .. color.DarkGray .."3 " .. color.DarkGray .. "seconds.\n", false)

							Players[pid].homeTimerId = tes3mp.CreateTimerEx("OnHomeTimeExpiration", time.seconds(config.homeDuration), "i", pid)
							tes3mp.StartTimer(Players[pid].homeTimerId)
							--
							Players[pid].featherTimerId = tes3mp.CreateTimerEx("OnFeatherTimeExpiration", time.seconds(config.featherDuration), "i", pid)
							tes3mp.StartTimer(Players[pid].featherTimerId)

							--
							Players[pid].homeReminderTimerId = tes3mp.CreateTimerEx("OnHomeReminderTimeExpiration", time.seconds(config.homeInterval + 5 - config.homeDuration), "i", pid)
							tes3mp.StartTimer(Players[pid].homeReminderTimerId)

						else
							local remainingMinutes = math.floor((Players[pid].data.customVariables.lastHome + config.homeInterval - currentTime) / 60)
							local message = color.DarkGray .. "You cannot use " .. color.Gold .. "/home " .. color.DarkGray .. "again for another "

							if remainingMinutes > 1 then
								message = message .. color.Gold .. remainingMinutes .. color.DarkGray .. " minutes."
							else
								message = message .. " minute."
							end

							message = message .. "\n"
							tes3mp.SendMessage(pid, message, false)
						end
					end

end
	

		
homecities.teleportAfterRegister = function(eventStatus, pid)

--if eventStatus.validCustomHandlers then --leave it out this time since we using this function again with "nil"
-- Home Cities
self = Players[pid]
	  if self.data.homecity ~= nil and config.homecitySpawns[self.data.homecity] ~= nil then

        local homecitySpawn = config.homecitySpawns[self.data.homecity]

			tes3mp.SetCell(self.pid, homecitySpawn.cell)
			tes3mp.SendCell(self.pid)

			 if config.defaultSpawnPos ~= nil and config.defaultSpawnRot ~= nil then
            tes3mp.SetPos(self.pid, homecitySpawn.pos[1], homecitySpawn.pos[2], homecitySpawn.pos[3])
            tes3mp.SetRot(self.pid, homecitySpawn.rot[1], homecitySpawn.rot[2])
            tes3mp.SendPos(self.pid)
			end   

		elseif config.defaultSpawnCell ~= nil then

			tes3mp.SetCell(self.pid, config.defaultSpawnCell)
			tes3mp.SendCell(self.pid)

			if config.defaultSpawnPos ~= nil and config.defaultSpawnRot ~= nil then
				tes3mp.SetPos(self.pid, config.defaultSpawnPos[1], config.defaultSpawnPos[2], config.defaultSpawnPos[3])
				tes3mp.SetRot(self.pid, config.defaultSpawnRot[1], config.defaultSpawnRot[2])
				tes3mp.SendPos(self.pid)
			end
		end
end


customEventHooks.registerHandler("OnPlayerResurrect", homecities.finish)
customCommandHooks.registerCommand("home", homecities.cmd)
customEventHooks.registerHandler("OnPlayerFinishLogin", homecities.OnFinishLogin)
customEventHooks.registerHandler("OnPlayerEndCharGen", homecities.teleportAfterRegister)


--[[
-- config.lua just copy there

-- Home Cities
-- Spawn locations for different home cities, a custom addition by Snapjaw
config.homecitySpawns = {}
config.homecitySpawns["location A"] = {
    cell = "21, -10",
    pos = { -174500, -77588, 1071 },
    rot = { 0, 0 }
}
config.homecitySpawns["Balmora"] = {
    cell = "-3, -2",
    pos = { -23537, -16116, 505 },
    rot = { 0, 0 }
}
config.homecitySpawns["Caldera"] = {
    cell = "-2, 2",
    pos = { -12789.073242188, 20478.23046875, 1537 },
    rot = { 0, -75.636917 }
}
config.homecitySpawns["Seyda Neen"] = {
    cell = "-2, -9",
    pos = { -11173.67, -70825.265625, 228 },
    rot = { 0.0627148, -0.624551 }
}
config.homecitySpawns["Suran"] = {
    cell = "6, -7",
    pos = { 53369.47, -50588.0, 167.3029 },
    rot = { 0, -350 }
}
config.homecitySpawns["Fort Frostmoth"] = {
    cell = "-22, 17",
    pos = { -174447, 142723.29, 896.426 },
    rot = { 0, -140, }
}
config.homecitySpawns["Mournhold"] = {
    cell = "Mournhold, Temple Courtyard",
    pos = { 31.6, -2110.9, 415 },
    rot = { 0, 110, }
}
config.homecitySpawns["Sotha Sil"] = {
    cell ="Sotha Sil, Outer Flooded Halls",
    pos = { 3765.372, 61.6045, -63 },
    rot = { 0, 110, }
}
config.homecitySpawns["Khuul"] = {
    cell ="-9, 16",
    pos = { -67758, 139179, 136 },
    rot = { .5, -1.2, }
}
config.homecitySpawns["Gnisis"] = {
    cell ="-11, 11",
    pos = { -85624.372, 92566.6045, 1017 },
    rot = { 0, 0, }
}
config.homecitySpawns["Urshilaku Camp"] = {
    cell ="-4, 18",
    pos = { -26876.372, 151333.6045, 710 },
    rot = { .2, 1, }
}
config.homecitySpawns["Dagon Fel"] = {
    cell ="7, 22",
    pos = { 62868, 184255, 82 },
    rot = { 0, 1.5, }
}
config.homecitySpawns["Vos"] = {
    cell ="11, 14",
    pos = { 92821, 116591, 1429 },
    rot = { .25, 2.2, }
}
config.homecitySpawns["Tel Mora"] = {
    cell ="13, 14",
    pos = { 106874, 117345, 173 },
    rot = { .25, 0, }
}
config.homecitySpawns["Tel Aruhn"] = {
    cell ="15, 5",
    pos = { 126671, 46897, 684 },
    rot = { 0, 3.4, }
}
config.homecitySpawns["Sadrith Mora"] = {
    cell ="17, 4",
    pos = { 146773, 35018, 525 },
    rot = { 0, 1.5, }
}
config.homecitySpawns["Tel Fyr"] = {
    cell ="15, 1",
    pos = { 123986, 15983, 501 },
    rot = { 0, 4.1, }
}
config.homecitySpawns["Molag Mar"] = {
    cell ="13, -8",
    pos = { 110358, -62873, 2048 },
    rot = { 0, 3.6, }
}
config.homecitySpawns["Tel Branora"] = {
    cell ="14, -13",
    pos = { 118646, -102913, 291 },
    rot = { 0, 3.85, }
}
config.homecitySpawns["Vivec"] = {
    cell ="3, -10",
    pos = { 30481, -75197, 553 },
    rot = {.1, 2.65, }
}
config.homecitySpawns["Hla Oad"] = {
    cell ="-6, -5",
    pos = { -46235, -38759, 204 },
    rot = { -.1, 2.05, }
}
config.homecitySpawns["Gnaar Mok"] = {
    cell ="-8, 3",
    pos = { -58755, 26263, 82 },
    rot = { .1, 2.15, }
}
config.homecitySpawns["Ald-ruhn"] = {
    cell ="-2, 6",
    pos = { -15325, 53268, 2176 },
    rot = { .1, 2.15, }
}
config.homecitySpawns["Pelagiad"] = {
    cell ="0, -7",
    pos = { 1532, -57174, 1429 },
    rot = { .1, 2.15, }
}
config.homecitySpawns["Vivec Arena Pit"] = {
    cell ="Vivec, Arena Pit",
    pos = { 98, 227, 1844 },
    rot = { .0, 0.1, }
}
config.homecitySpawns["Vivec Arena"] = {
    cell ="4, -11",
    pos = { 39124, -86911, 1792 },
    rot = { .1, 1.5, }
}

-- home command 
]]