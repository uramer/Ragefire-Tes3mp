-- use https://github.com/Boyos999/Boyos-Tes3mp-Scripts/tree/master/Player%20Packet%20Helper 
-- onfinishlogin


racialbonuses = {}

racialbonuses.use = function(eventStatus, pid)

local self = Players[pid]
-- Racial Bonuses
	if self.data.character.race == "argonian" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "argonian breathing"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "immune to poison"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "resist_poison_20"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "argonian_breathing"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "argonian_power"')
	end
	if self.data.character.race == "khajiit" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "eye of night"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "eye_of_night"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "khajiit_power"')
	end
	if self.data.character.race == "Dark Elf" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "ancestor guardian"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "ancestor_guardian"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "resist fire_75"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "resist fire_50"')
	end
	if self.data.character.race == "breton" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "resist magicka_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "resist_magicka_35"')
	end
	if self.data.character.race == "nord" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "resist shock_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "immune to frost"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "resist frost_75"')
	end
	if self.data.character.race == "wood elf" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "bosmer_marksman"')
	end
	if self.data.character.race == "high elf" then	
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "weakness fire_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "weakness magicka_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "weakness_fire_25"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "weakness_magicka_25"')
	end	
--[[ doubled ? 

-- Racial Bonuses	
	if self.data.character.race == "argonian" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "argonian breathing"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "argonian_breathing"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "argonian_power"')
	end
	if self.data.character.race == "khajiit" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "eye of night"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "eye_of_night"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "khajiit_power"')
	end
	if self.data.character.race == "Dark Elf" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "ancestor guardian"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "ancestor_guardian"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "resist fire_75"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "resist fire_50"')
	end
	if self.data.character.race == "breton" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "resist magicka_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "resist_magicka_35"')
	end
	if self.data.character.race == "nord" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "resist shock_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "immune to frost"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "resist frost_75"')
	end
	if self.data.character.race == "wood elf" then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "bosmer_marksman"')
	end
	if self.data.character.race == "high elf" then	
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "weakness fire_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'removespell "weakness magicka_50"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "weakness_fire_25"')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'addspell "weakness_magicka_25"')
	end	
-- End Racial Powers]]
end

customEventHooks.registerHandler("OnPlayerFinishLogin", racialbonuses.use)