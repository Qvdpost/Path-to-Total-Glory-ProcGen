--------------------------------------------------------------------------
            -- 517, 646
            failures = "grimgor, orion, azhag, tretch?, brt after repasnse, kemler, mannfred, ungrimm, gelt, thorgrim, durthu"
            unavailable_agent_subtypes = {
                "wh_main_grn_grimgor_ironhide",
                "wh_dlc05_wef_orion",
                "wh_main_grn_azhag_the_slaughterer",
                "wh_main_brt_louen_leoncouer",
                "wh_main_vmp_heinrich_kemmler",
                "wh_main_vmp_mannfred_von_carstein",
                "wh_main_dwf_ungrim_ironfist",
                "wh_main_emp_balthasar_gelt",
                "wh_main_dwf_thorgrim_grudgebearer",
                "wh_dlc05_wef_durthu",
                "wh_main_emp_karl_franz" -- I assume
            }
            core:remove_listener("tester")

            local factions = {
            ["wh3_dlc20_chs_festus"] = "pttg_chs_chaos",
            ["wh2_main_skv_clan_mors"] = "pttg_skv_skaven",
            ["wh2_dlc09_tmb_followers_of_nagash"] = "pttg_tmb_tomb_kings",
            ["wh_main_grn_greenskins"] = "pttg_grn_greenskins",
            ["wh2_main_def_hag_graef"] = "pttg_def_dark_elves",
            ["wh3_dlc20_chs_valkia"] = "pttg_chs_chaos",
            ["wh3_dlc23_chd_astragoth"] = "pttg_chd_chaos_dwarfs",
            ["wh_main_emp_empire"] = "pttg_emp_empire",
            ["wh_main_grn_orcs_of_the_bloody_hand"] = "pttg_grn_savage_orcs",
            ["wh_dlc05_wef_wood_elves"] = "pttg_wef_wood_elves",
            ["wh3_dlc20_chs_sigvald"] = "pttg_chs_chaos",
            ["wh3_dlc24_cth_the_celestial_court"] = "pttg_cth_cathay",
            ["wh2_dlc15_grn_broken_axe"] = "pttg_grn_greenskins",
            ["wh2_main_skv_clan_eshin"] = "pttg_skv_skaven",
            ["wh_main_emp_wissenland"] = "pttg_emp_empire",
            ["wh3_main_sla_seducers_of_slaanesh"] = "pttg_sla_slaanesh",
            ["wh2_main_hef_avelorn"] = "pttg_hef_high_elves",
            ["wh2_dlc15_grn_bonerattlaz"] = "pttg_grn_greenskins",
            ["wh3_main_chs_shadow_legion"] = "pttg_chs_chaos",
            ["wh2_dlc16_wef_drycha"] = "pttg_wef_wood_elves",
            ["wh2_dlc09_skv_clan_rictus"] = "pttg_skv_skaven",
            ["wh2_dlc14_brt_chevaliers_de_lyonesse"] = "pttg_brt_bretonnia",
            ["wh_main_brt_bretonnia"] = "pttg_brt_bretonnia",
            ["wh3_main_ogr_disciples_of_the_maw"] = "pttg_ogr_ogre_kingdoms",
            ["wh2_dlc17_dwf_thorek_ironbrow"] = "pttg_dwf_dwarfs",
            ["wh3_dlc24_ksl_daughters_of_the_forest"] = "pttg_ksl_kislev",
            ["wh3_main_ogr_goldtooth"] = "pttg_ogr_ogre_kingdoms",
            ["wh2_dlc15_hef_imrik"] = "pttg_hef_high_elves",
            ["wh2_dlc17_bst_malagor"] = "pttg_bst_beastmen",
            ["wh3_main_vmp_caravan_of_blue_roses"] = "pttg_vmp_vampire_counts",
            ["wh_main_chs_chaos"] = "pttg_chs_chaos",
            ["wh2_main_hef_nagarythe"] = "pttg_hef_high_elves",
            ["wh3_main_cth_the_western_provinces"] = "pttg_cth_cathay",
            ["wh_dlc03_bst_beastmen"] = "pttg_bst_beastmen",
            ["wh2_dlc13_lzd_spirits_of_the_jungle"] = "pttg_lzd_lizardmen",
            ["wh2_dlc11_vmp_the_barrow_legion"] = "pttg_vmp_vampire_counts",
            ["wh_main_vmp_vampire_counts"] = "pttg_vmp_vampire_counts",
            ["wh_main_dwf_karak_izor"] = "pttg_dwf_dwarfs",
            ["wh_dlc08_nor_norsca"] = "pttg_nor_norsca",
            ["wh3_main_cth_the_northern_provinces"] = "pttg_cth_cathay",
            ["wh2_dlc17_lzd_oxyotl"] = "pttg_lzd_lizardmen",
            ["wh3_dlc25_dwf_malakai"] = "pttg_dwf_dwarfs",
            ["wh3_dlc25_nur_epidemius"] = "pttg_nur_nurgle",
            ["wh3_main_kho_exiles_of_khorne"] = "pttg_kho_khorne",
            ["wh2_main_hef_order_of_loremasters"] = "pttg_hef_high_elves",
            ["wh2_main_lzd_itza"] = "pttg_lzd_lizardmen",
            ["wh2_twa03_def_rakarth"] = "pttg_def_dark_elves",
            ["wh3_dlc20_chs_azazel"] = "pttg_chs_chaos",
            ["wh3_main_nur_poxmakers_of_nurgle"] = "pttg_nur_nurgle",
            ["wh2_main_def_cult_of_pleasure"] = "pttg_def_dark_elves",
            ["wh2_dlc16_wef_sisters_of_twilight"] = "pttg_wef_wood_elves",
            ["wh2_dlc09_tmb_khemri"] = "pttg_tmb_tomb_kings",
            ["wh3_main_emp_cult_of_sigmar"] = "pttg_emp_empire",
            ["wh2_dlc11_cst_pirates_of_sartosa"] = "pttg_cst_vampire_coast",
            ["wh2_main_skv_clan_moulder"] = "pttg_skv_skaven",
            ["wh2_dlc11_cst_noctilus"] = "pttg_cst_vampire_coast",
            ["wh2_main_def_naggarond"] = "pttg_def_dark_elves",
            ["wh3_dlc20_chs_kholek"] = "pttg_chs_chaos",
            ["wh3_dlc20_chs_vilitch"] = "pttg_chs_chaos",
            ["wh_main_dwf_karak_kadrin"] = "pttg_dwf_dwarfs",
            ["wh3_main_dwf_the_ancestral_throng"] = "pttg_dwf_dwarfs",
            ["wh2_dlc13_emp_golden_order"] = "pttg_emp_empire",
            ["wh3_dlc25_nur_tamurkhan"] = "pttg_nur_nurgle",
            ["wh_main_grn_crooked_moon"] = "pttg_grn_greenskins",
            ["wh2_dlc11_cst_vampire_coast"] = "pttg_cst_vampire_coast",
            ["wh2_main_hef_yvresse"] = "pttg_hef_high_elves",
            ["wh2_dlc13_emp_the_huntmarshals_expedition"] = "pttg_emp_empire",
            ["wh_main_brt_carcassonne"] = "pttg_brt_bretonnia",
            ["wh_main_dwf_dwarfs"] = "pttg_dwf_dwarfs",
            ["wh3_dlc23_chd_zhatan"] = "pttg_chd_chaos_dwarfs",
            ["wh2_dlc11_cst_the_drowned"] = "pttg_cst_vampire_coast",
            ["wh2_dlc11_def_the_blessed_dread"] = "pttg_def_dark_elves",
            ["wh3_main_ksl_the_ice_court"] = "pttg_ksl_kislev",
            ["wh2_main_lzd_tlaqua"] = "pttg_lzd_lizardmen",
            ["wh3_main_ksl_the_great_orthodoxy"] = "pttg_ksl_kislev",
            ["wh2_main_def_har_ganeth"] = "pttg_def_dark_elves",
            ["wh_dlc05_wef_argwylon"] = "pttg_wef_wood_elves",
            ["wh_dlc05_bst_morghur_herd"] = "pttg_bst_beastmen",
            ["wh2_main_lzd_hexoatl"] = "pttg_lzd_lizardmen",
            ["wh2_dlc17_bst_taurox"] = "pttg_bst_beastmen",
            ["wh3_dlc24_tze_the_deceivers"] = "pttg_tze_tzeentch",
            ["wh2_dlc12_lzd_cult_of_sotek"] = "pttg_lzd_lizardmen",
            ["wh_main_vmp_schwartzhafen"] = "pttg_vmp_vampire_counts",
            ["wh2_main_hef_eataine"] = "pttg_hef_high_elves",
            ["wh2_dlc09_tmb_lybaras"] = "pttg_tmb_tomb_kings",
            ["wh2_main_skv_clan_skryre"] = "pttg_skv_skaven",
            ["wh3_main_tze_oracles_of_tzeentch"] = "pttg_tze_tzeentch",
            ["wh2_dlc09_tmb_exiles_of_nehek"] = "pttg_tmb_tomb_kings",
            ["wh3_main_ksl_ursun_revivalists"] = "pttg_ksl_kislev",
            ["wh3_dlc23_chd_legion_of_azgorh"] = "pttg_chd_chaos_dwarfs",
            ["wh2_main_skv_clan_pestilens"] = "pttg_skv_skaven",
            ["wh2_main_lzd_last_defenders"] = "pttg_lzd_lizardmen",
            ["wh_main_brt_bordeleaux"] = "pttg_brt_bretonnia",
            ["wh_dlc08_nor_wintertooth"] = "pttg_nor_norsca",
        }
        local playable_factions = {
            "wh3_dlc20_chs_festus",
            "wh2_main_skv_clan_mors",
            "wh2_dlc09_tmb_followers_of_nagash",
            "wh_main_grn_greenskins",
            "wh2_main_def_hag_graef",
            "wh3_dlc20_chs_valkia",
            "wh3_dlc23_chd_astragoth",
            -- "wh_main_emp_empire",
            "wh_main_grn_orcs_of_the_bloody_hand",
            "wh_dlc05_wef_wood_elves",
            "wh3_dlc20_chs_sigvald",
            "wh3_dlc24_cth_the_celestial_court",
            "wh2_dlc15_grn_broken_axe",
            "wh2_main_skv_clan_eshin",
            "wh_main_emp_wissenland",
            "wh3_main_sla_seducers_of_slaanesh",
            "wh2_main_hef_avelorn",
            "wh2_dlc15_grn_bonerattlaz",
            "wh3_main_chs_shadow_legion",
            "wh2_dlc16_wef_drycha",
            "wh2_dlc09_skv_clan_rictus",
            "wh2_dlc14_brt_chevaliers_de_lyonesse",
            "wh_main_brt_bretonnia",
            "wh3_main_ogr_disciples_of_the_maw",
            "wh2_dlc17_dwf_thorek_ironbrow",
            "wh3_dlc24_ksl_daughters_of_the_forest",
            "wh3_main_ogr_goldtooth",
            "wh2_dlc15_hef_imrik",
            "wh2_dlc17_bst_malagor",
            "wh3_main_vmp_caravan_of_blue_roses",
            "wh_main_chs_chaos",
            "wh2_main_hef_nagarythe",
            "wh3_main_cth_the_western_provinces",
            "wh_dlc03_bst_beastmen",
            "wh2_dlc13_lzd_spirits_of_the_jungle",
            "wh2_dlc11_vmp_the_barrow_legion",
            "wh_main_vmp_vampire_counts",
            "wh_main_dwf_karak_izor",
            "wh_dlc08_nor_norsca",
            "wh3_main_cth_the_northern_provinces",
            "wh2_dlc17_lzd_oxyotl",
            "wh3_dlc25_dwf_malakai",
            "wh3_dlc25_nur_epidemius",
            "wh3_main_kho_exiles_of_khorne",
            "wh2_main_hef_order_of_loremasters",
            "wh2_main_lzd_itza",
            "wh2_twa03_def_rakarth",
            "wh3_dlc20_chs_azazel",
            "wh3_main_nur_poxmakers_of_nurgle",
            "wh2_main_def_cult_of_pleasure",
            "wh2_dlc16_wef_sisters_of_twilight",
            "wh2_dlc09_tmb_khemri",
            "wh3_main_emp_cult_of_sigmar",
            "wh2_dlc11_cst_pirates_of_sartosa",
            "wh2_main_skv_clan_moulder",
            "wh2_dlc11_cst_noctilus",
            "wh2_main_def_naggarond",
            "wh3_dlc20_chs_kholek",
            "wh3_dlc20_chs_vilitch",
            "wh_main_dwf_karak_kadrin",
            "wh3_main_dwf_the_ancestral_throng",
            "wh2_dlc13_emp_golden_order",
            "wh3_dlc25_nur_tamurkhan",
            "wh_main_grn_crooked_moon",
            "wh2_dlc11_cst_vampire_coast",
            "wh2_main_hef_yvresse",
            "wh2_dlc13_emp_the_huntmarshals_expedition",
            "wh_main_brt_carcassonne",
            "wh_main_dwf_dwarfs",
            "wh3_dlc23_chd_zhatan",
            "wh2_dlc11_cst_the_drowned",
            "wh2_dlc11_def_the_blessed_dread",
            "wh3_main_ksl_the_ice_court",
            "wh2_main_lzd_tlaqua",
            "wh3_main_ksl_the_great_orthodoxy",
            "wh2_main_def_har_ganeth",
            "wh_dlc05_wef_argwylon",
            "wh_dlc05_bst_morghur_herd",
            "wh2_main_lzd_hexoatl",
            "wh2_dlc17_bst_taurox",
            "wh3_dlc24_tze_the_deceivers",
            "wh2_dlc12_lzd_cult_of_sotek",
            "wh_main_vmp_schwartzhafen",
            "wh2_main_hef_eataine",
            "wh2_dlc09_tmb_lybaras",
            "wh2_main_skv_clan_skryre",
            "wh3_main_tze_oracles_of_tzeentch",
            "wh2_dlc09_tmb_exiles_of_nehek",
            "wh3_main_ksl_ursun_revivalists",
            "wh3_dlc23_chd_legion_of_azgorh",
            "wh2_main_skv_clan_pestilens",
            "wh2_main_lzd_last_defenders",
            "wh_main_brt_bordeleaux",
            "wh_dlc08_nor_wintertooth",
        }
        core:add_listener(
            "tester",
            "pttg_next_test",
            true,
            function(context) 
                local index = context.index()
                local faction = playable_factions[index]
                local target_faction = factions[faction]
                out("Index: "..tostring(index))
                out("Faction: "..tostring(faction))
                cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
                    local general = cm:get_character_by_cqi(cm:get_faction(faction):faction_leader():command_queue_index())
                    local general_lookup = cm:char_lookup_str(general)
                    cm:set_character_immortality(general_lookup, false);
                    cm:kill_character(general_lookup, true);
                    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 1) 
        
                    cm:create_force_with_general(
                        target_faction,
                        "wh_dlc01_chs_mon_dragon_ogre,wh_dlc01_chs_mon_dragon_ogre",
                        "wh3_main_combi_region_altdorf",
                        517,
                        646,
                        "general",
                        general:character_subtype_key(),
                        general:get_forename(),
                        "",
                        general:get_surname(),
                        "",
                        true,			
                        -- Generals created this way does not come with a trait and aren't immortal
                        function(cqi)
                            -- pttg:log("[pttg_side_effects] Post processing new lord");
                            local char_str = cm:char_lookup_str(cqi);
                            -- Adding a new trait to the above general
                            cm:set_character_unique(char_str, true);
                            -- pttg:set_state('army_cqi', cm:get_character_by_cqi(cqi):military_force():command_queue_index())
                        end
                    );    
        
                    cm:callback(
                        function() 
                            local general = cm:get_character_by_cqi(cm:get_faction(target_faction):faction_leader():command_queue_index())
                            local general_lookup = cm:char_lookup_str(general)
                            cm:set_character_immortality(general_lookup, false);
                            cm:kill_character(general_lookup, true);
                            cm:callback(function() core:trigger_custom_event("pttg_next_test", {index = index + 1}) end, 1)
                            
                        end,
                        3
                    )
            end,
            true
        )

        

        core:trigger_custom_event("pttg_next_test", {index = 8})

--------------------------------------------------------------------------