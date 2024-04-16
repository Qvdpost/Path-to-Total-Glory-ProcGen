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
            incidents_localised_description_ = "An item of low quality. Not much, but perhaps of use.",
            incidents_localised_title_ = "Loot",
            incidents_button_text_ = "Claim"
        }
    },
    {
        name = 'pttg_medium_treasure',
        ui_image = 'wh2_treasure_hunt_2',
        inc_locs = {
            incidents_localised_description_ = "A decent magical item. A great boon to your journey.",
            incidents_localised_title_ = "Treasure",
            incidents_button_text_ = "Claim"
        }
    },
    {
        name = 'pttg_large_treasure',
        ui_image = 'wh2_treasure_hunt_3',
        inc_locs = {
            incidents_localised_description_ = "A rare relic, a true blessing to receive.",
            incidents_localised_title_ = "Relic",
            incidents_button_text_ = "Claim"
        }
    },
    {
        name = 'pttg_boss_treasure',
        ui_image = 'wh2_treasure_hunt_4',
        inc_locs = {
            incidents_localised_description_ = "A veritable hoard of treasure. But alas, you can't take all.",
            incidents_localised_title_ = "Hoard",
            incidents_button_text_ = "Claim"
        }
    }
}

file = io.open("incidents.txt", "w")
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



io.write("\n# Add the event to pttg in your script: \n")
io.write("local pttg_events = core:get_static_object('pttg_event_pool')\n\n")
for _, incident in pairs(incidents) do
    io.write(string.format("function %s_callback(context)\n", incident.name))
    io.write("\t-- body of the callback.\n")
    io.write("end\n\n") 
end

-- for _, incident in pairs(incidents) do
--     io.write("-- replace weight and any nils with values of your choosing.\n")
--     io.write(string.format('pttg_events:add_event("%s", { weight = 10, acts = {upper=nil, lower=nil}, alignment = {upper=nil, lower=nil}, faction_set="all", callback=%s_callback })\n', dilemma.name, dilemma.name))
-- end
