require "input/faction_to_military_group"
require "input/playable_factions"

file = io.open("output/faction_to_milis.lua", "w")
io.output(file)


io.write("local mercenaries = {\n")
for faction, _ in pairs(playable_factions) do
    print("Processing: "..faction)
    io.write(string.format('["%s"] = "%s",\n', faction, faction_to_mili_grouping[faction]))
end
io.write("}\n")