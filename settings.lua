data:extend({

{
	type = "double-setting",
	name = "settings-cannon-turret-damage-modifier",
	setting_type = "startup",
	default_value = 0.8,
	minimum_value = 0.01,
	maximum_value = 2,
	order = "ba"
}, 

{
	type = "int-setting",
	name = "settings-cannon-turret-range",
	setting_type = "startup",
	default_value = 30,
	minimum_value = 18,
	maximum_value = 50,
	order = "ba"
}, 

{
	type = "int-setting",
	name = "settings-cannon-turret-attack-speed",
	setting_type = "startup",
	default_value = 180,
	minimum_value = 1,
	maximum_value = 600,
	order = "ba"
}, 

{
	type = "double-setting",
	name = "settings-cannon-turret-directional-attack",
	setting_type = "startup",
	default_value = 0,
	minimum_value = 0,
	maximum_value = 0.999,
	order = "ba"
},

{
	type = "int-setting",
	name = "settings-cannon-turret-minimum-attack-range",
	setting_type = "startup",
	default_value = 0,
	minimum_value = 0,
	maximum_value = 25,
	order = "ba"
},
{
	type = "int-setting",
	name = "settings-cannon-turret-hp",
	setting_type = "startup",
	default_value = 700,
	minimum_value = 1,
	maximum_value = 5000,
	order = "ba"
},   
})