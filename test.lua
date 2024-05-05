require "output/faction_to_agents"
require "input/playable_factions"

function mysplit (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end
agent_type = nil
for faction_key, _ in pairs(playable_factions) do
    print(faction_key)
    local subgroups = {}
    local subkeys = {}
    
    local agents = {}

    if agent_type then
        agents = self.faction_to_agents[faction_key][agent_type]
    else
        for _, agent_type in pairs({"champion", "dignitary", "engineer", "runesmith", "spy", "wizard"}) do
            for _, agent in pairs(faction_to_agents[faction_key][agent_type] or {}) do
                table.insert(agents, agent)
            end
        end
    end

    for _, subtype in pairs(agents) do

        local parts = mysplit(subtype, '_')

        local joined = ""
        for i = 4, math.max(#parts - 2, 4) do
            joined = joined..'_'..(parts[i] or "")
        end

        if subgroups[joined] then
            table.insert(subgroups[joined], subtype)
        else
            subgroups[joined] = { subtype }
            table.insert(subkeys, joined)
        end
    end



    local test = {}

    for i = 1, 100 do
        local random_characters = subgroups[subkeys[math.random(#subkeys)]]
        local random_character = random_characters[math.random(#random_characters)]

        if test[random_character] then
            test[random_character] = test[random_character] + 1
        else
            test[random_character] = 1
        end
    end

    for key, val in pairs(test) do
        print(key, val)
    end
end