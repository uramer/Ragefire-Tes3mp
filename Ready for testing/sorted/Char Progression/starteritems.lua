-- Unshared journal and starter items
-- use this: https://github.com/Atkana/tes3mp-scripts/tree/master/0.7/kanaStartingItems
-- or this: https://github.com/Boyos999/Boyos-Tes3mp-Scripts/tree/master/Starter%20Equipment
    --[[if config.shareJournal == false and WorldInstance.data.customVariables ~= nil then
        if WorldInstance.data.customVariables.deliveredCaiusPackage ~= false then
  local item = { refId = "bk_a1_1_caiuspackage", count = 1, charge = -1,enchantmentCharge = -1, soul = "" }
			inventoryHelper.addItem(self.data.inventory, item.refId, item.count, item.charge, 
				item.enchantmentCharge, item.soul)
            local item2 = { refId = "gold_001", count = 30, charge = -1,
				enchantmentCharge = -1, soul = "" }
			inventoryHelper.addItem(self.data.inventory, item2.refId, item2.count, item.charge, 
				item.enchantmentCharge, item.soul)
			local item3 = { refId = "pick_apprentice_01", count = 1, charge = -1,
				enchantmentCharge = -1, soul = "" }
			inventoryHelper.addItem(self.data.inventory, item3.refId, item3.count, item.charge, 
				item.enchantmentCharge, item.soul)
			self:LoadItemChanges({item, item1, item2, item3}, enumerations.inventory.ADD)
			--tes3mp.MessageBox(self.pid, -1, "Multiplayer skips over the original character generation.")

        end
	end ]]--

starteritems = {}


starteritems.OnPlayerEndCharGen = function(eventStatus, pid)
local self = Players[pid]
    if Players[pid] ~= nil and Players[pid]:IsLoggedIn() then
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'additem "gold_001"50')
		logicHandler.RunConsoleCommandOnPlayer(self.pid, 'additem "pick_apprentice_01"1')
        Players[pid]:SaveEquipment()
        Players[pid].currentCustomMenu = "appearance"
        menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
    end
end
-- calls also the choose homecity menus etc .. 

customEventHooks.registerHandler("OnPlayerEndCharGen", starteritems.OnPlayerEndCharGen)