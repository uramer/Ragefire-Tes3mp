starteritems = {}

starteritems.itemList = {
    {
        refId = "gold_001",
        count = 50
    },
    {
        refId = "pick_apprentice_01",
        count = 1
    }
}

starteritems.AddItems = function(pid, items)
    if table.getn(items) == 0 then
        return
    end

    local inventory = Players[pid].data.inventory

    tes3mp.ClearInventoryChanges(pid)
    tes3mp.SetInventoryChangesAction(pid, enumerations.inventory.ADD)

    for _, item in pairs(items) do
        inventoryHelper.addItem(inventory, item.refId, item.count, -1, -1, "")
        tes3mp.AddItemChange(pid, item.refId, item.count, -1, -1, "")    
    end

    tes3mp.SendInventoryChanges(pid)
end

starteritems.OnPlayerEndCharGen = function(eventStatus, pid)
    starteritems.AddItems(pid, starteritems.itemList)
    Players[pid]:SaveToDrive()
end

customEventHooks.registerHandler("OnPlayerEndCharGen", starteritems.OnPlayerEndCharGen)