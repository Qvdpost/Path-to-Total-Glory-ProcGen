local army_templates = {
    {
        template_key = "",
        template_category = "", -- boss, elite or random
        faction = "",           -- faction the army belongs to. Suggested values are pttg_emp_empire and such factions (prefixed by pttg_) so that the player does not have to engage war with factions on the map.
        culture = "",
        subculture = "",
        alignment = "",        -- defines the eliigbility of encountering this type of army based on player alignment. Values may be "order", "chaos" or "neutral".
        acts = nil,            -- optional acts that constraint the spawning of this army template. The value may be a single number or an array of numbers that represent the acts in which the template will be used e.g. { 1, 2 } or 1
        general_subtype = "",  -- optional subtype from the agent_subtypes database
        agents = nil,          -- optional agent characters to be included in the army. Values can be either "random", "<agent_subtype>", or {"<agent_type", "<agent_type>"}. "Random" wil generate a random agent of any agent_type, the table of agent types will generate a random agent of that selection of agent_types and if a specific agent_subtype is provided that agent will be added to the army.
        mandatory_units = nil, -- an optional array of tables in the form of { {key="<main_unit_key>"}, ... }
        units = nil,           -- an optinoal array of units that make up the available pool for random army generation in the form of { {key="<main_unit_key>", weight=<number>}, ... }
    },
    {
        template_key = "pttg_boss_kholek_suneater",
        template_category = "boss",
        faction = "pttg_chs_chaos",
        culture = "wh_main_chs_chaos",
        subculture = "wh_main_sc_chs_chaos",
        alignment = "chaos",
        acts = 1,
        general_subtype = "wh_dlc01_chs_kholek_suneater",
        agents = { "random", "random" },
        mandatory_units = { { key = "wh_dlc01_chs_mon_dragon_ogre" }, { key = "wh_dlc01_chs_mon_dragon_ogre" } },
        units = nil,
    }
}

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


file = io.open("output/army_templates.lua", "w")
io.output(file)

io.write("local pttg_battle_templates = core.get_static_object('pttg_battle_templates')\n\n")


io.write("local bosses = {\n")
for _, template_info in pairs(army_templates) do
    if template_info.template_category == 'boss' then
        io.write(string.format(
        '\t%s = { general_subtype="%s", agents=%s, faction = "%s", culture = "%s", subculture = "%s", mandatory_units = %s, units = %s, alignment = "%s", act = %s },\n',
            template_info.template_key, template_info.general_subtype, table_to_string(template_info.agents),
            template_info.faction, template_info.culture, template_info.subculture,
            table_to_string(template_info.mandatory_units), table_to_string(template_info.units), template_info.alignment,
            table_to_string(template_info.acts)))
    end
end
io.write("}\n\n")

io.write("local elites = {\n")
for _, template_info in pairs(army_templates) do
    if template_info.template_category == 'elite' then
        io.write(string.format(
        '\t%s = { general_subtype="%s", agents=%s, faction = "%s", culture = "%s", subculture = "%s", mandatory_units = %s, units = %s, alignment = "%s", act = %s },\n',
            template_info.template_key, template_info.general_subtype, table_to_string(template_info.agents),
            template_info.faction, template_info.culture, template_info.subculture,
            table_to_string(template_info.mandatory_units), table_to_string(template_info.units), template_info.alignment,
            table_to_string(template_info.acts)))
    end
end
io.write("}\n\n")

io.write("local randoms = {\n")
for _, template_info in pairs(army_templates) do
    if template_info.template_category == 'random' then
        io.write(string.format(
        '\t%s = { general_subtype="%s", agents=%s, faction = "%s", culture = "%s", subculture = "%s", mandatory_units = %s, units = %s, alignment = "%s", act = %s },\n',
            template_info.template_key, template_info.general_subtype, table_to_string(template_info.agents),
            template_info.faction, template_info.culture, template_info.subculture,
            table_to_string(template_info.mandatory_units), table_to_string(template_info.units), template_info.alignment,
            table_to_string(template_info.acts)))
    end
end
io.write("}\n\n")

io.write('\
for template, template_info in pairs(randoms) do\
    pttg_battle_templates:add_template("random",\
        template, template_info)\
end\
\
for template, template_info in pairs(elites) do\
    pttg_battle_templates:add_template("elite",\
        template, template_info)\
end\
\
for template, template_info in pairs(bosses) do\
    pttg_battle_templates:add_template("boss",\
        template, template_info)\
end')
