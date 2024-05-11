dilemmas = {
    {
        name = 'pttg_EventGlory',
        dil_locs = {
            description = "Stories about your successes have spread far and wide. And as a result some offer tribute so that you may remember them when you have reached glory.",
            title = "Glory"
        },
        choice_locs = { -- Define for each of the choices e.g FIRST, SECOND... EIGTH
            FIRST = {title = "Accept their gifts in grace.", label = "Order" },
            SECOND = {title = "Demand more, you have earned it.", label = "Chaos" }
        }
    },
}

file = io.open("output/dilemmas.txt", "w")
io.output(file)
io.write("# dilemmas_tables\n")
for _, dilemma in pairs(dilemmas) do
    io.write(string.format("%s\tfalse\t\t\tfaction\tfalse\tEvent\n", dilemma.name))
end

io.write("\n# cdir_events_dilemma_option_junctions_tables\n")
for _, dilemma in pairs(dilemmas) do
    io.write(string.format("%s\tGEN_TARGET_NONE\n", dilemma.name))
    io.write(string.format("%s\tVAR_CHANCE\t100\n", dilemma.name))
end

io.write("\n# cdir_events_dilemma_choice_details_tables\n")
for _, dilemma in pairs(dilemmas) do
    for choice, _ in pairs(dilemma.choice_locs) do
        io.write(string.format("%s\t%s\n", choice, dilemma.name))
    end
end

io.write("\n# dilemmas.loc\n")
for _, dilemma in pairs(dilemmas) do
    io.write(string.format("dilemmas_localised_description_%s\t%s\n", dilemma.name, dilemma.dil_locs.description))
    io.write(string.format("dilemmas_localised_title_%s\t%s\n", dilemma.name, dilemma.dil_locs.title))
end

io.write("\n# cdir_events_dilemma_choice_details.loc\n")
for _, dilemma in pairs(dilemmas) do
    for choice, loc in pairs(dilemma.choice_locs) do
        io.write(string.format("cdir_events_dilemma_choice_details_localised_choice_label_%s%s\t%s\n", dilemma.name, choice, loc.label))
        io.write(string.format("cdir_events_dilemma_choice_details_localised_choice_title_%s%s\t%s\n", dilemma.name, choice, loc.title))
    end
end

io.write("\n# Add the event to the pttg in your script: \n")
io.write("local pttg_events = core:get_static_object('pttg_event_pool')\n\n")
for _, dilemma in pairs(dilemmas) do
    io.write(string.format("function %s_callback(context)\n", dilemma.name))
    io.write("\t-- body of the callback; what should happen for each choice?\
    local choice = context:choice_key()\n\n")
    for key, val in pairs(dilemma.choice_locs) do
        io.write(string.format("\tif choice == '%s' then -- %s\n\n\tend\n", key, val.label))
    end
    io.write("end\n\n")
    io.write(string.format("function %s_eligibility_callback(context)\n", dilemma.name))
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
for _, dilemma in pairs(dilemmas) do
    io.write(string.format('pttg_events:add_event("%s", { weight = 10, , callback=%s_callback, eligibility_callback=%s_eligibility_callback })\n', dilemma.name, dilemma.name, dilemma.name))
end
