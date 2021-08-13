-- player/init.lua

dofile(minetest.get_modpath("oblx_player") .. "/api.lua")

-- Default player appearance
player_api.register_model("character.b3d", {
	animation_speed = 30,
	textures = {"character.png"},
	animations = {
		-- Standard animations.
		stand     = {x = 0,   y = 79},
		lay       = {x = 162, y = 166},
		walk      = {x = 168, y = 187},
		mine      = {x = 189, y = 198},
		walk_mine = {x = 200, y = 219},
		sit       = {x = 81,  y = 160},
	},
	visual_size = {x = 3, y = 3},
	collisionbox = {-1.8, 0.0, -0.9, 1.8, 4.6, 0.9},
	stepheight = 2.5,
	eye_height = 4.47,
})

-- Update appearance when the player joins
minetest.register_on_joinplayer(function(player)
	player_api.player_attached[player:get_player_name()] = false
	player_api.set_model(player, "character.b3d")
	player:set_local_animation(
		{x = 0,   y = 79},
		{x = 168, y = 187},
		{x = 189, y = 198},
		{x = 200, y = 219},
		30
	)

	player:set_physics_override({
		speed = 3,
		jump = 4,
		gravity = 3
	})
end)

minetest.register_on_player_hpchange(function(player, hp_change, reason)
	if reason.type == 'fall' then
		return 0
	end
	return hp_change
end, true)

minetest.register_on_joinplayer(function(player)
	if minetest.is_creative_enabled(player:get_player_name()) and not player:get_inventory():contains_item("main", "oblx_partsbox:partsbox") then
		player:get_inventory():add_item("main", "oblx_partsbox:partsbox")
	end
end)
