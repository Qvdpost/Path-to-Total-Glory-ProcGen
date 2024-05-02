dilemmas = {
    {
        name = 'pttg_EventGlory',
        choices = {'FIRST', 'SECOND'}, -- Can choose out of FIRST, SECOND, THRID and FOURTH
        dil_locs = {
            description = "Stories about your successes have spread far and wide. And as a result some offer tribute so that you may remember them when you have reached glory.",
            title = "Glory"
        },
        choice_locs = { -- Define for each of the choices
            FIRST = {title = "Accept their gifts in grace.", label = "Order" },
            SECOND = {title = "Demand more, you have earned it.", label = "Chaos" }
        }
    },
    {
        name = 'pttg_RandomStart',
        choices = {'FIRST', 'SECOND'}, -- Can choose out of FIRST, SECOND, THRID and FOURTH
        dil_locs = {
            description = "You can either play with your selected Faction Leader and their entourage, or have a selection of recruitable mercenaries to choose from and start with a clean slate.",
            title = "Mode"
        },
        choice_locs = { -- Define for each of the choices
            FIRST = {title = "Continue as is.", label = "Normal" },
            SECOND = {title = "Relinquish starting army and recruit a new selection.", label = "Random" }
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
    for _, choice in pairs(dilemma.choices) do
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
    for _, choice in pairs(dilemma.choices) do
        io.write(string.format("cdir_events_dilemma_choice_details_localised_choice_label_%s%s\t%s\n", dilemma.name, choice, dilemma.choice_locs[choice].label))
        io.write(string.format("cdir_events_dilemma_choice_details_localised_choice_title_%s%s\t%s\n", dilemma.name, choice, dilemma.choice_locs[choice].title))
    end
end

io.write("\n# Add the event to the pttg in your script: \n")
io.write("local pttg_events = core:get_static_object('pttg_event_pool')\n\n")
for _, dilemma in pairs(dilemmas) do
    io.write(string.format("function %s_callback(context)\n", dilemma.name))
    io.write("\t-- body of the callback; what should happen for each choice?\
    local choice = context:choice_key()\
\
    if choice == 'FIRST' then\
\
    elseif choice == 'SECOND' then\
\
    elseif choice == 'THIRD' then\
\
    else\
\
    end\n")
    io.write("end\n\n") 
end

for _, dilemma in pairs(dilemmas) do
    io.write("-- replace weight and any nils with values of your choosing.\n")
    io.write(string.format('pttg_events:add_event("%s", { weight = 10, acts = {upper=nil, lower=nil}, alignment = {upper=nil, lower=nil}, faction_set="all", callback=%s_callback })\n', dilemma.name, dilemma.name))
end
