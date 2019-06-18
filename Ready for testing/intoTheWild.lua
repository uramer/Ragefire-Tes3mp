intoTheWild = {}

intoTheWild.cellchange = function(eventStatus, pid)
	if Players[pid].lastCell ~= nil then
	print("last cell was".. Players[pid].lastCell)
		if tableHelper.containsValue(config.homecitySpawns,Players[pid].lastCell,true) and tes3mp.IsInExterior(pid) then
			print("should print message")
			tes3mp.MessageBox(pid, -1, color.Orange.."You are heading into the Wild.\n"..color.White.." Be careful off the road.")
		else
		 print("didnt work")
		end
	end	
		Players[pid].lastCell = tes3mp.GetCell(pid)
end


customEventHooks.registerHandler("OnPlayerCellChange", intoTheWild.cellchange)