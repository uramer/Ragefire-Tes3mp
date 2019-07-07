-- use https://github.com/Boyos999/Boyos-Tes3mp-Scripts/tree/master/Player%20Packet%20Helper 
-- onfinishlogin


racialbonuses = {}

racialbonuses.SendSpells = function(pid, remove, add)
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

racialbonuses.raceData = {
    ["argonian"] = {
        remove = {"argonian breathing", "immune to poison"},
        add = {"resist_poison_20", "argonian_breathing", "argonian_power"}
    },
    ["khajiit"] = {
        remove = {"eye of night"},
        add = {"eye of night", "khajiit_power"}
    },
    ["Dark Elf"] = {
        remove = {"ancestor guardian", "resist fire_75"},
        add = {"ancestor guardian", "resist fire_50"}
    },
    ["breton"] = {
        remove = {"resist magicka_50"},
        add = {"resist magicka_35"}
    },
    ["nord"] = {
        remove = {"resist shock_50", "immune to frost"},
        add = {"resist frost_75"}
    },
    ["wood elf"] = {
        remove = {},
        add = {"bosmer_marksman"}
    },
    ["high elf"] = {
        remove = {"weakness fire_50", "weakness magicka_50"},
        add = {"weakness_fire_25", "weakness_magicka_25"}
    }
}

racialbonuses.OnPlayerAutherized = function(eventStatus, pid)
    local pid = Players[pid].pid

    local raceName = Players[pid].data.character.race
    local race = racialbonuses.raceData[raceName]
    
    if race ~= nil then
        racialbonuses.SendSpells(pid, race.remove, race.add)
    end
end

customEventHooks.registerHandler("OnPlayerAutherized", racialbonuses.OnPlayerAutherized)