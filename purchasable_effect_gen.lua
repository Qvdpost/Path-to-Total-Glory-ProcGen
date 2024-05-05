require "output/mercenaries_input"

pur_fects = {
    -- {
    --     key = '',
    --     effect_bundle_key = "",
    --     custom_effects = {
    --         {
    --             effect_key = "",
    --             effect_scope = "",
    --             effect_value = ""
    --         },
    --     },
    --     effect_locs = {
    --         effect_bundles_localised_description_ = "",
    --         effect_bundles_localised_title_ = "",
    --     },
    --     purchasable_effect_locs = {
    --         unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
    --     }
    -- },
    {
        key = 'pttg_rest_durability',
        effect_bundle_key = "pttg_rest_durability",
        custom_effects = {
            {
                effect_key = "wh_main_effect_character_stat_physical_resistance",
                effect_scope = "character_to_character_own",
                effect_value = "40"
            },
            {
                effect_key = "wh_main_effect_character_stat_magic_resistance",
                effect_scope = "character_to_character_own",
                effect_value = "60"
            },
        },
        effect_locs = {
            effect_bundles_localised_description_ = "Thicker skin, better steel, more powerful magics, anything to make this unit more durable against their attackers.",
            effect_bundles_localised_title_ = "Extreme Durability",
        },
        purchasable_effect_locs = {
            unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
        }
    },
    {
        key = 'pttg_rest_weapon_strength',
        effect_bundle_key = "pttg_rest_weapon_strength",
        custom_effects = {
            {
                effect_key = "wh_main_effect_character_stat_weapon_strength",
                effect_scope = "character_to_character_own",
                effect_value = "50"
            },
            {
                effect_key = "wh_main_effect_force_stat_melee_attack",
                effect_scope = "character_to_character_own",
                effect_value = "10"
            },
            {
                effect_key = "wh_main_effect_character_stat_charge_bonus_add",
                effect_scope = "character_to_character_own",
                effect_value = "20"
            }
        },
        effect_locs = {
            effect_bundles_localised_description_ = "Slash, stab, crush, maul all are effective strategies and now they will hit that much harder.",
            effect_bundles_localised_title_ = "Extra Powerful",
        },
        purchasable_effect_locs = {
            unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
        }
    },
    {
        key = 'pttg_rest_missile_upgrade',
        effect_bundle_key = "pttg_rest_missile_upgrade",
        custom_effects = {
            {
                effect_key = "wh_main_effect_character_stat_reload_time_reduction",
                effect_scope = "character_to_character_own",
                effect_value = "25"
            },
            {
                effect_key = "wh_main_effect_character_stat_missile_damage",
                effect_scope = "character_to_character_own",
                effect_value = "50"
            },
            {
                effect_key = "wh_main_effect_character_stat_range",
                effect_scope = "character_to_character_own",
                effect_value = "20"
            },
        },
        effect_locs = {
            effect_bundles_localised_description_ = "Take aim, Fire! Whether it be arrow, bullet or cannon ball, you make sure your troops hit what they aim for with devestating result.",
            effect_bundles_localised_title_ = "Exemplar Accuracy",
        },
        purchasable_effect_locs = {
            unit_purchasable_effect_lock_reasons_description_ = "This is not the right time."
        }
    }
}

file = io.open("output/purchasable_effects.txt", "w")
io.output(file)
io.write("# effect_bundles_tables\n")
for _, pur_fect in pairs(pur_fects) do
    io.write(string.format("%s	%s	%s	none	1		true	false	true\n", pur_fect.effect_bundle_key, pur_fect.effect_locs.effect_bundles_localised_description_, pur_fect.effect_locs.effect_bundles_localised_title_))
end

io.write("\n# effect_bundles_to_effects_junctions_tables.loc\n")
for _, pur_fect in pairs(pur_fects) do
    for _, effect in pairs(pur_fect.custom_effects) do
        io.write(string.format("%s	%s	%s	%s	start_turn_completed\n", pur_fect.effect_bundle_key, effect.effect_key, effect.effect_scope, effect.effect_value))
    end
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
    for key, val in pairs(pur_fect.purchasable_effect_locs) do
        io.write(string.format("%s%s\t%s\n", 
            key, pur_fect.key, val))
    end
    for key, val in pairs(pur_fect.effect_locs) do
        io.write(string.format("%s%s\t%s\n", 
            key, pur_fect.effect_bundle_key, val))
    end
end