incidents = {
    -- {
    --     name = '',
    --     ui_image = '',
    --     inc_locs = {
    --         incidents_localised_description_ = "",
    --         incidents_localised_title_ = "",
    --         incidents_button_text_ = ""
    --     }
    -- }
    {
        name = 'pttg_small_treasure',
        ui_image = 'wh2_treasure_hunt',
        inc_locs = {
            incidents_localised_description_ = "You come upon an item of low quality. Not much, but perhaps of use.",
            incidents_localised_title_ = "Loot",
            incidents_button_text_ = "Claim"
        }
    },
}

file = io.open("output/incidents.txt", "w")
io.output(file)
io.write("# incidents_tables\n")
for _, incident in pairs(incidents) do
    io.write(string.format("%s	false	%s	false	Event		false		0\n", 
        incident.name, incident.ui_image))
end


io.write("\n# incidents.loc\n")
for _, incident in pairs(incidents) do
    for key, val in pairs(incident.inc_locs) do
        io.write(string.format("%s%s\t%s\n", 
            key, incident.name, val))
    end
end



io.write("\n# Add the event to the pttg in your script: \n")
io.write("local pttg_events = core:get_static_object('pttg_event_pool')\n\n")
for _, incident in pairs(incidents) do
    io.write(string.format("function %s_callback(context)\n", incident.name))
    io.write("\t-- body of the callback; what should happen for each choice?\n\n")
    io.write("end\n\n")
    io.write(string.format("function %s_eligibility_callback(context)\n", incident.name))
    io.write("\t-- TODO: implement body of the callback; when is this event eligible for the player? e.g. acts, alignment, faction_set\
    \
    if context.act() ~= 1 then -- only triggers in act 1\
        return false\
    end\
\
    -- Only triggers if the player has a chaotic alignment (greater than 20), but not too chaotic (less than 100)\
    if context.alignment() < 20 or context.alignment > 100 then\
        return false\
    end\
\
    local faction_set='all' -- Allows to restrict the event to specific factions\
    if not context.faction():is_contained_in_faction_set(faction_set) then\
        return false\
    end\
\
    -- add in any restrictions you would like!\
    return true\
    end\n")
    io.write("end\n\n")
end



io.write("-- Adjust weight to make an event more or less likely to trigger.\n")
for _, incident in pairs(incidents) do
    io.write(string.format('pttg_events:add_event("%s", { weight = 10, , callback=%s_callback, eligibility_callback=%s_eligibility_callback })\n', incident.name, incident.name, incident.name))
end