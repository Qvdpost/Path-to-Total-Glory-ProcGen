require "input/faction_to_military_group"
require "input/units_to_military_grouping"
require "input/playable_factions"
require "input/recruitable_agents"
require "input/faction_agent_permissions"
require "input/agent_to_unit"
require "input/pttg_faction_agent_permissions"
require "input/pttg_factions"

local faction_to_agents = {}

for faction, _ in pairs(playable_factions) do
    faction_to_agents[faction] = {}
end

for faction, _ in pairs(pttg_factions) do
    faction_to_agents[faction] = {}
end

for _, perm in pairs(faction_agent_permissions) do
    if playable_factions[perm.faction] then
        if not faction_to_agents[perm.faction][perm.type] then
            faction_to_agents[perm.faction][perm.type] = {perm.subtype}
        else
            table.insert(faction_to_agents[perm.faction][perm.type], perm.subtype)
        end
    end
end

for _, perm in pairs(pttg_faction_agent_permissions) do
    if pttg_factions[perm.faction] then
        if not faction_to_agents[perm.faction][perm.type] then
            faction_to_agents[perm.faction][perm.type] = {perm.subtype}
        else
            table.insert(faction_to_agents[perm.faction][perm.type], perm.subtype)
        end
    end
end

file = io.open("output/agents.lua", "w")
io.output(file)

io.write("local agents = {\n")
for faction, agent_types in pairs(faction_to_agents) do
    for agent_type, agent_subtypes in pairs(agent_types) do
        for _, subtype in pairs(agent_subtypes) do
            if recruitable_agents[subtype] then
                io.write(string.format('\t{ faction="%s", type="%s", subtype="%s", unit="%s" },\n', faction, agent_type, subtype, agent_to_unit[subtype]))
            end
        end
    end
end
io.write("}\n")



-- file = io.open("output/agent_units.lua", "w")
-- io.output(file)

-- io.write("local agent_units = {\n")
-- for _, perm in pairs(faction_agent_permissions) do
--     if playable_factions[perm.faction] then
--         io.write(string.format('\t{ "%s", "core", 1, { military_groupings = {"agents"}, category = "com", tier = 4, cost = 4 }},\n', agent_to_unit[perm.subtype]))
--     end
-- end
-- io.write("}\n")