require "output/mercenaries_input"

pur_fects = {
    -- {
    --     key = '',
    --     category = "",
    --     effect_bundle = "",
    --     custom_effect = {
    --         key = "",
    --         effect_key = "",
    --         effect_scope = "",
    --         effect_value = ""
    --     },
    --     locs = {
    --         effect_bundles_localised_description_ = "",
    --         effect_bundles_localised_title_ = "",
    --         unit_purchasable_effect_lock_reasons_description_ = ""
    --     }
    -- }
    -- {
    --     key = 'pttg_rest_training',
    --     effect_bundle_key = "pttg_rest_training",
    --     custom_effect = {
    --         effect_key = "wh3_main_effect_character_campaign_experience_mod",
    --         effect_scope = "character_to_character_own",
    --         effect_value = "0.0000"
    --     },
    --     locs = {
    --         effect_bundles_localised_description_ = "Through intense training, these troops have achieved teh pinnacle of their battle potential.",
    --         effect_bundles_localised_title_ = "Expert Training",
    --         unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
    --     }
    -- },
    {
        key = 'pttg_rest_physical_res',
        effect_bundle_key = "pttg_rest_physical_res",
        custom_effect = {
            effect_key = "wh_main_effect_character_stat_physical_resistance",
            effect_scope = "character_to_character_own",
            effect_value = "40"
        },
        locs = {
            effect_bundles_localised_description_ = "Thicker skin, better steel, more powerful magics, anything to make this unit more durable against their attackers.",
            effect_bundles_localised_title_ = "Extreme Durability",
            unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
        }
    },
    {
        key = 'pttg_rest_weapon_strength',
        effect_bundle_key = "pttg_rest_weapon_strength",
        custom_effect = {
            effect_key = "wh_main_effect_character_stat_weapon_strength",
            effect_scope = "character_to_character_own",
            effect_value = "80"
        },
        locs = {
            effect_bundles_localised_description_ = "Slash, stab, crush, maul all are effective strategies and now they will hit that much harder.",
            effect_bundles_localised_title_ = "Extra Powerful",
            unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
        }
    },
    {
        key = 'pttg_rest_magic_res',
        effect_bundle_key = "pttg_rest_magic_res",
        custom_effect = {
            effect_key = "wh_main_effect_character_stat_magic_resistance",
            effect_scope = "character_to_character_own",
            effect_value = "60"
        },
        locs = {
            effect_bundles_localised_description_ = "Either through powerful runes, magical rituals, or divine intervention, this unit will be unhindered by magical attacks.",
            effect_bundles_localised_title_ = "Exhume Magics",
            unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
        }
    },
}

file = io.open("output/purchasable_effects.txt", "w")
io.output(file)
io.write("# effect_bundles_tables\n")
for _, pur_fect in pairs(pur_fects) do
    io.write(string.format("%s	%s	%s	none	1		true	false	true\n", pur_fect.effect_bundle_key, pur_fect.locs.effect_bundles_localised_description_, pur_fect.locs.effect_bundles_localised_title_))
end

io.write("\n# effect_bundles_to_effects_junctions_tables.loc\n")
for _, pur_fect in pairs(pur_fects) do
    io.write(string.format("%s	%s	%s	%s	start_turn_completed\n", pur_fect.effect_bundle_key, pur_fect.custom_effect.effect_key, pur_fect.custom_effect.effect_scope, pur_fect.custom_effect.effect_value))
end

io.write("\n# unit_purchasable_effect_lock_reasons_tables.loc\n")
for _, pur_fect in pairs(pur_fects) do
    io.write(string.format("%s\n", pur_fect.key))
end

io.write("\n# unit_purchasable_effect_sets_tables.loc\n")
for _, pur_fect in pairs(pur_fects) do
    for _, merc in pairs(mercenaries) do
        io.write(string.format("%s	%s	true\n", merc.key, pur_fect.key))
    end
end

io.write("\n# unit_purchasable_effects_tables.loc\n")
for _, pur_fect in pairs(pur_fects) do
    io.write(string.format("%s	pttg_rest_train_merc_cost	%s	pttg_upgrade	\n", pur_fect.key, pur_fect.effect_bundle_key))
end

io.write("\n# purchasable_effects.loc\n")
for _, pur_fect in pairs(pur_fects) do
    for key, val in pairs(pur_fect.locs) do
        io.write(string.format("%s%s\t%s\n", 
            key, pur_fect.key, val))
    end
end