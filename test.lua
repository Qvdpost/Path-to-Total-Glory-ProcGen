require "input/playable_factions"

local faction_mili_groups = {}
for faction, _ in pairs(playable_factions) do
    faction_mili_groups[faction] = true
end

function faction_mili_groups:contains_any_of(tbl) 
    for _, key in pairs(tbl) do
        if self[key] then
            return true
        end
    end
    return false
end

print(tostring(faction_mili_groups:contains_any_of({'wh_dlc05_wef_wood_elves'})))