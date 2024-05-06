local pttg_battle_templates = core.get_static_object('pttg_battle_templates')

local bosses = {
	pttg_boss_kholek_suneater = { general_subtype="wh_dlc01_chs_kholek_suneater", agents={"random","random"}, faction = "pttg_chs_chaos", culture = "wh_main_chs_chaos", subculture = "wh_main_sc_chs_chaos", mandatory_units = {{["key"]="wh_dlc01_chs_mon_dragon_ogre"},{["key"]="wh_dlc01_chs_mon_dragon_ogre"}}, units = {}, alignment = "chaos", act = 1 },
}

local elites = {
}

local randoms = {
}


for template, template_info in pairs(randoms) do
    pttg_battle_templates:add_template("random",
        template, template_info)
end

for template, template_info in pairs(elites) do
    pttg_battle_templates:add_template("elite",
        template, template_info)
end

for template, template_info in pairs(bosses) do
    pttg_battle_templates:add_template("boss",
        template, template_info)
end