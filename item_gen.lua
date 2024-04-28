local items = { 
    -- {
    --     key = "pttg_glorious_weapon",
    --     type = "",
    --     category = "",
    --     uniqueness = nil,
    --     faction_set = "all",
    --     set_key = nil,
    --     set_icon = 'ui/skins/default/icon_item_set.png',
    --     set_effects = {
    --         {
    --             key = nil,
    --             scope = nil,
    --             value = nil
    --         }
    --     },
    --     effects = {
    --         { 
    --             key = nil, scope = nil, value = nil
    --         }
    --     },
    --     locs = {
    --         ancillaries_onscreen_name = "",
    --         ancillaries_colour_text = "",
    --         ancillaries_explanation_text = ""
    --     },
    --     -- If the item should be craftable at The Merchant
    --     crafting_ritual = {
    --         key = nil,
    --         cost = nil,
    --         locs = {
    --             campaign_group_rituals_unlock_text_ = "",
    --             rituals_display_name_ = "",
    --             rituals_description_ = ""
    --         }
    --     },
    --     -- Optional
    --     custom_effects = {
    --         {
    --             effect=nil, bonus_value_id=nil, unit_ability=nil, icon=nil, priority=nil, icon_negative=nil, category='battle', pos_val_good=true,
    --             locs = {
    --                 crafting = ""
    --             }
    --         }
    --     },
    --     -- Optional
    --     custom_abilities = {
    --         {
    --             key=nil, req_enabling=false, icon_name=nil, type=nil, uniqueness='wh_main_anc_group_common', source_type=nil, 
    --             locs = {
    --                 effects_description_nat_woc_crafting_enable_ = "",
    --                 unit_abilities_onscreen_name_ = "",
    --                 unit_abilities_tooltip_text_ = "",
    --                 special_ability_phases_onscreen_name_ = ""
    --             }
    --         }
    --     }
    -- }
    {
        key = "pttg_glorious_weapon",
        type = "wh_main_anc_weapon",
        category = "weapon",
        uniqueness = 75,
        faction_set = "all",
        set_key = nil,
        set_icon = 'ui/skins/default/icon_item_set.png',
        set_effects = {
            {
                key = nil,
                scope = nil,
                value = nil
            }
        },
        effects = {
            { 
                key = "wh_main_effect_character_stat_weapon_strength", scope = "character_to_character_own", value = 8
            },
            { 
                key = "wh2_main_effect_character_stat_enable_flaming_attacks", scope = "character_to_character_own", value = 1
            }
        },
        locs = {
            ancillaries_onscreen_name_ = "Blade of Glory",
            ancillaries_colour_text_ = "A glorious blade. The very first.",
            ancillaries_explanation_text_ = "This explains the glorious blade. Wow."
        },
        -- If the item should be craftable at The Merchant
        crafting_ritual = {
            key = "pttg_ritual_glorious_weapon",
            cost = 75,
            locs = {
                campaign_group_rituals_unlock_text_ = "Buy",
                rituals_display_name_ = "Blade of Glory",
                rituals_description_ = "A glorious Blade."
            }
        },
        -- Optional
        custom_effects = {
            {
                effect=nil, bonus_value_id=nil, unit_ability=nil, icon=nil, priority=nil, icon_negative=nil, category='battle', pos_val_good=true,
                locs = {
                    crafting = ""
                }
            }
        },
        -- Optional
        custom_abilities = {
            {
                key=nil, req_enabling=false, icon_name=nil, type=nil, uniqueness='wh_main_anc_group_common', source_type=nil, 
                locs = {
                    effects_description_nat_woc_crafting_enable_ = "",
                    unit_abilities_onscreen_name_ = "",
                    unit_abilities_tooltip_text_ = "",
                    special_ability_phases_onscreen_name_ = ""
                }
            }
        }
    }
}

file = io.open("items.txt", "w")
io.output(file)
io.write("# ancillaries_tables\n")
for _, item in pairs(items) do
    io.write(string.format("%s	%s		true	false	false	0	0	9999			false	false	false	%s	16	30	30	50	true			%s	0		false	false	false	%s\n", 
                            item.key, item.type, item.category, item.uniqueness, item.faction_set))
end

io.write("\n# ancillary_info_tables\n")
for _, item in pairs(items) do
    io.write(string.format("%s\n", item.key))
end

io.write("\n# ancillary_set_ancillary_junctions_tables\n")
for _, item in pairs(items) do
    if item.set_key then
        io.write(string.format("%s\t%s\n", item.key, item.set_key))
    end
end

io.write("\n# ancillary_set_effect_junctions_tables\n")
for _, item in pairs(items) do
    if item.set_key then
        for _, set_effect in pairs(item.set_effects) do
            io.write(string.format("%s\t%s\t%s\n", set_effect.key, item.set_key, set_effect.scope, set_effect.value))
        end
    end
end

io.write("\n# ancillary_sets_tables\n")
for _, item in pairs(items) do
    if item.set_key then
        io.write(string.format("%s\t%s\n", item.key, item.set_icon))
    end
end

io.write("\n# ancillary_to_effects_tables\n")
for _, item in pairs(items) do
    for _, effect in pairs(item.effects) do
        if effect.key then
            io.write(string.format("%s\t%s\t%s\t%s\n", item.key, effect.key, effect.scope, effect.value))
        end
    end
end


io.write("\n# campaign_group_rituals\n")
for _, item in pairs(items) do
    for _, effect in pairs(item.effects) do
        if item.crafting_ritual.key then
            io.write(string.format("pttg_main_crafting_all	%s		0	false\n", item.crafting_ritual.key))
        end
    end
end

io.write("\n# effect_bonus_value_unit_ability_junctions_tables\n")
for _, item in pairs(items) do
    for _, effect in pairs(item.custom_effects) do
        if effect.effect then 
            io.write(string.format("%s	%s	%s\n", 
                effect.effect, effect.bonus_value_id, effect.unit_ability)
            )
        end
    end
end

--effect=nil, bonus_value_id=nil, unit_ability=nil, icon=nil, priority=nil, icon_negative=nil, category='battle', pos_val_good=true
io.write("\n# effects_tables\n")
for _, item in pairs(items) do
    for _, effect in pairs(item.custom_effects) do
        if effect.effect then
            io.write(string.format("%s	%s	%s	%s	%s	%s\n", 
                effect.effect, effect.icon, effect.priority, effect.icon_negative, effect.category, tostring(effect.pos_val_good))
            )
        end
    end
end

io.write("\n# mortuary_cult_categories_to_rituals_tables\n")
for _, item in pairs(items) do
    if item.crafting_ritual.key then
        io.write(string.format("pttg_crafting_merchandise	%s\n", item.crafting_ritual.key))
    end
end

io.write("\n# resource_cost_pooled_resource_junctions_tables\n")
for _, item in pairs(items) do
    if item.crafting_ritual.key then
        io.write(string.format("pttg_glory_point_factor	%s	-%s	absolute	default\n", item.crafting_ritual.key, item.crafting_ritual.cost))
    end
end

io.write("\n# resource_costs_tables\n")
for _, item in pairs(items) do
    if item.crafting_ritual.key then
        io.write(string.format("%s	-0	RITUAL	RITUAL	ARMY_UPKEEP	BACKGROUND_INCOME\n", item.crafting_ritual.key))
    end
end

-- io.write("\n# resource_costs_tables\n")
-- for _, item in pairs(items) do
--     io.write(string.format("%s\n", item.key))
-- end

io.write("\n# ritual_payload_ancillaries_tables\n")
for _, item in pairs(items) do
    if item.crafting_ritual.key then
        io.write(string.format("%s	%s\n", item.crafting_ritual.key, item.key))
    end
end

io.write("\n# ritual_payloads_tables\n")
for _, item in pairs(items) do
    if item.crafting_ritual.key then
        io.write(string.format("%s\n", item.crafting_ritual.key))
    end
end

io.write("\n# rituals_tables\n")
for _, item in pairs(items) do
    if item.crafting_ritual.key then
        io.write(string.format("%s	0	%s	9999	CRAFTING_RITUAL	0	0			0		%s				0	0				default	\n", 
                item.crafting_ritual.key, item.crafting_ritual.key, item.crafting_ritual.key)
        )
    end        
end

io.write("\n# unit_abilities_tables\n")
for _, item in pairs(items) do
    for _, ability in pairs(item.custom_abilities) do
        if ability.key then
            io.write(string.format("%s	%s	%s		%s		%s	true	false	%s		false\n", 
                ability.key, tostring(ability.req_enabling), ability.icon_name, ability.type, ability.uniqueness, ability.source_type)
            )
        end
    end
end

io.write("\n# ability_locs.loc\n")
for _, item in pairs(items) do
    for _, ability in pairs(item.custom_abilities) do
        if ability.key then
            for loc_key, loc in pairs(ability.locs) do
                io.write(string.format("%s%s\t%s\n", loc_key, ability.key, loc))
            end
        end
    end
end

io.write("\n# item_locs.loc\n")
for _, item in pairs(items) do
    for key, loc in pairs(item.locs) do
        io.write(string.format("%s%s\t%s\n", key, item.key, loc))
    end

    if item.crafting_ritual.key then
        for key, loc in pairs(item.crafting_ritual.locs) do
            io.write(string.format("%s%s\t%s\n", key, item.crafting_ritual.key, loc))
        end
    end
end


-- ["pttg_ritual_wh2_dlc10_dwf_anc_armour_gate_keepers_helm"] = { ["uniqueness"] = 75,["category"] = "armour",["faction_set"] = "anc_set_exclusive_dwarfs",}

io.write("\n# Add the item to the pttg in your script: \n")
io.write("local pttg_item_pool = core:get_static_object('pttg_item_pool');\n\n")

for _, item in pairs(items) do
    io.write("-- replace weight and any nils with values of your choosing.\n")
    io.write(string.format('pttg_item_pool:add_item("%s", { ["uniqueness"] = %s, ["category"] = "%s", ["faction_set"] = "%s", ["ritual"] = "%s"})\n', item.key, item.uniqueness, item.category, item.faction_set, item.crafting_ritual.key))
end
