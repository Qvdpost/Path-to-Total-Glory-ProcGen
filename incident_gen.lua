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
    {
        name = 'pttg_medium_treasure',
        ui_image = 'wh2_treasure_hunt_2',
        inc_locs = {
            incidents_localised_description_ = "You find a magical item of decent quality. A great boon to your journey.",
            incidents_localised_title_ = "Treasure",
            incidents_button_text_ = "Claim"
        }
    },
    {
        name = 'pttg_large_treasure',
        ui_image = 'wh2_treasure_hunt_3',
        inc_locs = {
            incidents_localised_description_ = "You uncover a rare relic, a true blessing to receive.",
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
    },
    {
        name = 'pttg_WoM_increase',
        ui_image = 'faction',
        inc_locs = {
            incidents_localised_description_ = "You feel an increase in Winds of Magic at your disposal.",
            incidents_localised_title_ = "The Winds of Magic strengthen",
            incidents_button_text_ = "Continue"
        }
    },
    {
        name = 'pttg_WoM_decrease',
        ui_image = 'faction',
        inc_locs = {
            incidents_localised_description_ = "The power of the Winds of Magic is diminishing.",
            incidents_localised_title_ = "The Winds of Magic wane.",
            incidents_button_text_ = "Continue"
        }
    },
    {
        name = 'pttg_elite_battle_victory',
        ui_image = 'land_victory',
        inc_locs = {
            incidents_localised_description_ = "A hard fought battle against a formidable opponent.",
            incidents_localised_title_ = "Great Victory.",
            incidents_button_text_ = ""
        }
    },
    {
        name = 'pttg_boss_battle_victory',
        ui_image = 'land_victory',
        inc_locs = {
            incidents_localised_description_ = "Even against a formidable opponent, you emerge Victorious.",
            incidents_localised_title_ = "Epic Victory.",
            incidents_button_text_ = ""
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

for _, incident in pairs(incidents) do
    io.write("-- replace weight and any nils with values of your choosing.\n")
    io.write(string.format('pttg_events:add_event("%s", { weight = 10, acts = { [1] = true, [2] = true, [3] = true}, alignment = {upper=nil, lower=nil}, faction_set="all", callback=%s_callback })\n', dilemma.name, dilemma.name))
end
