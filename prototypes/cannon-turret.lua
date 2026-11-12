function cannon_turret_sheet(inputs)
    return {
        layers = {{
            filename = "__adjustable_cannon_turret__/graphics/entity/cannon-turret/cannon-turret-sheet.png",
            priority = "medium",
            scale = 0.75,
            width = 128,
            height = 128,
            direction_count = inputs.direction_count and inputs.direction_count or 64,
            frame_count = 1,
            line_length = inputs.line_length and inputs.line_length or 8,
            axially_symmetrical = false,
            run_mode = inputs.run_mode and inputs.run_mode or "forward",
            shift = {0.35, -0.5}
        }}
    }
end

local sounds = require("__base__/prototypes/entity/sounds")
data:extend({{
    type = "item",
    name = "cannon-turret",
    icon = "__adjustable_cannon_turret__/graphics/icons/cannon-turret-icon.png",
    icon_size = 64,
    subgroup = "defensive-structure",
    order = "b[turret]-a[gun-turret]",
    place_result = "cannon-turret",
    stack_size = 10
}})

data:extend({{
    type = "technology",
    name = "cannon-turret",
    icon_size = 128,
    icon_mipmaps = 4,
    icon = "__adjustable_cannon_turret__/graphics/icons/cannon-turret-tech.png",
    effects = {{
        type = "unlock-recipe",
        recipe = "cannon-turret"
    }},
    prerequisites = {"tank"},
    unit = {
        count = 500,
        ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"military-science-pack", 1},
                       {"chemical-science-pack", 1}},
        time = 30
    },
    order = "e-c-c"
}});

data:extend({{
    type = "recipe",
    name = "cannon-turret",
    icon = "__adjustable_cannon_turret__/graphics/icons/cannon-turret-icon.png",
    icon_size = 64,
    subgroup = "defensive-structure",
    order = "b[turret]-a[gun-turret]",
    enabled = false,
    energy_required = 10,
    ingredients = {{
        type = "item",
        name = "engine-unit",
        amount = 10
    }, {
        type = "item",
        name = "steel-plate",
        amount = 30
    }, {
        type = "item",
        name = "iron-gear-wheel",
        amount = 15
    }, {
        type = "item",
        name = "advanced-circuit",
        amount = 5
    }},
    results = {{
        type = "item",
        name = "cannon-turret",
        amount = 1
    }}
}})


data:extend({{
    type = "ammo-turret",
    name = "cannon-turret",
    icon = "__adjustable_cannon_turret__/graphics/icons/cannon-turret-icon.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {
        mining_time = 1,
        result = "cannon-turret"
    },
    max_health = settings.startup["settings-cannon-turret-hp"].value,
    corpse = "medium-remnants",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    rotation_speed = 0.01,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 20,
    attacking_speed = 0.5,
    --prepare_range = 27,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    alert_when_attacking = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    turret_base_has_direction = true,
    graphics_set = {},
    folded_animation = cannon_turret_sheet {
        direction_count = 8,
        line_length = 1
    },
    preparing_animation = cannon_turret_sheet {
        direction_count = 8,
        line_length = 1
    },
    prepared_animation = cannon_turret_sheet {},
    attacking_animation = cannon_turret_sheet {},
    folding_animation = cannon_turret_sheet {
        direction_count = 8,
        line_length = 1,
        run_mode = "backward"
    },

    vehicle_impact_sound = sounds.generic_impact,

    attack_parameters = {
        type = "projectile",
        ammo_category = "cannon-shell",
        cooldown = settings.startup["settings-cannon-turret-attack-speed"].value,
        rotate_penalty = 1,
		projectile_creation_distance = 1.39375,
		projectile_center = {0, -0.0875},
        damage_modifier = settings.startup["settings-cannon-turret-damage-modifier"].value,
        shell_particle = {
            name = "shell-particle",
            direction_deviation = 0.1,
            speed = 0.1,
            speed_deviation = 0.03,
            center = {-0.0625, 0},
            creation_distance = -1.925,
            starting_frame_speed = 0.2,
            starting_frame_speed_deviation = 0.1
        },
        range = settings.startup["settings-cannon-turret-range"].value,
        turn_range = settings.startup["settings-cannon-turret-directional-attack"].value,
        min_range = settings.startup["settings-cannon-turret-minimum-attack-range"].value,
        sound = sounds.tank_gunshot
    },
    call_for_help_radius = 46
}})
