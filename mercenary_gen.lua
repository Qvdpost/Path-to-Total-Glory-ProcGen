require "output/mercenaries_input"

file = io.open("output/mercenaries.txt", "w")
io.output(file)
io.write("# campaign_group_rituals_tables\n")
for _, mercenary in pairs(mercenaries) do
    if mercenary.ritual.key then
        io.write(string.format("pttg_main_crafting_all	%s		0	false\n", 
            mercenary.ritual.key))
    end
end


io.write("\n# mercenary_pool_to_groups_junctions_tables\n")
for _, mercenary in pairs(mercenaries) do
    io.write(string.format("<unique_id>	pttg_%s	0	pttg_raise_dead_pool			\n", 
        mercenary.key))
end

io.write("\n# mercenary_unit_groups_tables\n")
for _, mercenary in pairs(mercenaries) do
    io.write(string.format("pttg_%s	0.0000	0	%s	false	0.0000\n", 
        mercenary.key, mercenary.key))
end
io.write("\n# mortuary_cult_categories_to_rituals_tables\n")
for _, mercenary in pairs(mercenaries) do
    if mercenary.ritual.key then
        io.write(string.format("pttg_crafting_units	%s\n", 
            mercenary.ritual.key))
    end
end
io.write("\n# resource_cost_pooled_resource_junctions_tables\n")
for _, mercenary in pairs(mercenaries) do
    if mercenary.ritual.key then
        io.write(string.format("pttg_glory_point_factor	%s	-%s	absolute	default\n", 
            mercenary.ritual.key, mercenary.ritual.glory_cost))
    end
end
io.write("\n# resource_costs_tables\n")
for _, mercenary in pairs(mercenaries) do
    if mercenary.ritual.key then
        io.write(string.format("%s	0	RITUAL	RITUAL	ARMY_UPKEEP	BACKGROUND_INCOME\n", 
            mercenary.ritual.key))
    end
end
io.write("\n# ritual_payload_spawn_mercenaries_tables\n")
for _, mercenary in pairs(mercenaries) do
    if mercenary.ritual.key then
        io.write(string.format("<unique_id>	%s	%s	false\n", 
            mercenary.ritual.key, mercenary.key))
    end
end
io.write("\n# ritual_payloads_tables\n")
for _, mercenary in pairs(mercenaries) do
    if mercenary.ritual.key then
        io.write(string.format("%s	false	\n", 
            mercenary.ritual.key))
    end
end
io.write("\n# rituals_tables\n")
for _, mercenary in pairs(mercenaries) do
    if mercenary.ritual.key then
        io.write(string.format("%s	0	%s	9999	CRAFTING_RITUAL	0	0			0		%s				0	0				default	\n", 
            mercenary.ritual.key, mercenary.ritual.key, mercenary.ritual.key))
    end
end

function table_to_string(tbl)
    if not tbl then
        return "{}"
    end
    if not tbl or type(tbl) ~= 'table' then
        return tostring(tbl)
    end
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

io.write("\n# Add the mercenary to pttg in your script: \n")
io.write("local pttg_merc_pool = core:get_static_object('pttg_merc_pool')\n\n")
io.write("local mercenaries = {\n")
for _, mercenary in pairs(mercenaries) do
    io.write(string.format('\t{"%s", "%s", %s, { military_groupings = {%s}, category = "%s", tier = %s, cost = %s, require_dlc = %s }},\n', 
        mercenary.key, mercenary.group, mercenary.weight, '"'..table.concat(mercenary.military_groupings, '","')..'"', mercenary.category, mercenary.tier, mercenary.cost, table_to_string(mercenary.require_dlc))
    )
end
io.write("}\n")
io.write("pttg_merc_pool:add_unit_list(mercenaries)\n")
