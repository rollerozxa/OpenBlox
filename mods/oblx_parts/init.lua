
colors = {
	{
		id = "white",
		name = "White",
		color = "f2f3f2"
	}, {
		id = "light_stone_gray",
		name = "Light Stone Gray",
		color = "e5e4de"
	}, {
		id = "medium_stone_gray",
		name = "Medium Stone Gray",
		color = "a3a2a4"
	}, {
		id = "dark_stone_gray",
		name = "Dark Stone Gray",
		color = "635f61"
	}, {
		id = "black",
		name = "Black",
		color = "1b2a34"
	}, {
		id = "bright_red",
		name = "Bright Red",
		color = "c4281b"
	}, {
		id = "bright_yellow",
		name = "Bright Yellow",
		color = "f5cd2f"
	}, {
		id = "cool_yellow",
		name = "Cool Yellow",
		color = "fdea8c"
	},{
		id = "bright_blue",
		name = "Bright Blue",
		color = "0d69ab"
	}, {
		id = "bright_bluish_green",
		name = "Bright Bluish Green",
		color = "008f9b"
	}, {
		id = "medium_blue",
		name = "Medium Blue",
		color = "6e99c9"
	}, {
		id = "pastel_blue",
		name = "Pastel Blue",
		color = "80bbdb"
	}, {
		id = "light_blue",
		name = "Light Blue",
		color = "b4d2e3"
	}, {
		id = "medium_red",
		name = "Medium Red",
		color = "74869c"
	}, {
		id = "bright_orange",
		name = "Bright Orange",
		color = "da8540"
	}, {
		id = "brown_yellowish_orange",
		name = "Brown Yellowish Orange",
		color = "e29b3f"
	}, {
		id = "earth_green",
		name = "Earth Green",
		color = "27462c"
	}, {
		id = "dark_green",
		name = "Dark Green",
		color = "287f46"
	}, {
		id = "bright_green",
		name = "Bright Green",
		color = "4b974a"
	}, {
		id = "brown_yellowish_green",
		name = "Brown Yellowish Green",
		color = "a4bd46"
	}, {
		id = "medium_green",
		name = "Medium Green",
		color = "a1c48b"
	}, {
		id = "sand_green",
		name = "Sand Green",
		color = "789081"
	}, {
		id = "dark_orange",
		name = "Dark Orange",
		color = "a05f34"
	}, {
		id = "reddish_brown",
		name = "Reddish Brown",
		color = "694027"
	},{
		id = "bright_violet",
		name = "Bright Violet",
		color = "6b327b"
	}, {
		id = "light_reddish_violet",
		name = "Light Reddish Violet",
		color = "e8bac7"
	}, {
		id = "medium_red",
		name = "Medium Red",
		color = "da8679"
	}, {
		id = "brick_yellow",
		name = "Brick Yellow",
		color = "d7c599"
	}, {
		id = "sand_red",
		name = "Sand Red",
		color = "957976"
	}, {
		id = "brown",
		name = "Brown",
		color = "7c5c45"
	}, {
		id = "grime",
		name = "Grime",
		color = "cc8e68"
	}, {
		id = "light_orange",
		name = "Light Orange",
		color = "eab891"
	},
}

for _, color in pairs(colors) do
	minetest.register_node('oblx_parts:'..color.id, {
		description = color.name..' Part',
		tiles = {
			"oblx_parts_outset.png^[multiply:#"..color.color,
			"oblx_parts_inset.png^[multiply:#"..color.color,
			"oblx_parts_smooth.png^[multiply:#"..color.color
		},
		groups = { oddly_breakable_by_hand = 3 },
		is_ground_content = true
	})

	minetest.register_node('oblx_parts:'..color.id..'_half', {
		description = color.name..' Part (Half)',
		tiles = {
			"oblx_parts_outset.png^[multiply:#"..color.color,
			"oblx_parts_inset.png^[multiply:#"..color.color,
			"oblx_parts_smooth.png^[multiply:#"..color.color
		},
		groups = { oddly_breakable_by_hand = 3 },
		is_ground_content = true,
		drawtype = "nodebox",
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
			}
		},
	})

	minetest.register_node('oblx_parts:'..color.id..'_trans', {
		description = color.name..' Part (Transparent)',
		tiles = {
			"oblx_parts_smooth.png^[multiply:#"..color.color.."^[opacity:127"
		},
		inventory_image = "oblx_parts_transparent.png^[multiply:#"..color.color,
		wield_image = "oblx_parts_transparent.png^[multiply:#"..color.color,
		groups = { oddly_breakable_by_hand = 3 },
		is_ground_content = true,
		drawtype = "glasslike",
		use_texture_alpha = true,
		sunlight_propagates = true,
		paramtype = "light",
	})

	minetest.register_node('oblx_parts:'..color.id..'_glued', {
		description = color.name..' Part (Glue)',
		tiles = {"oblx_parts_glue.png^[multiply:#"..color.color},
		groups = { oddly_breakable_by_hand = 3 },
		is_ground_content = true
	})

	minetest.register_node('oblx_parts:'..color.id..'_neon', {
		description = color.name..' Part (Neon)',
		tiles = {"oblx_parts_smooth.png^[colorize:#"..color.color..":255"},
		groups = { oddly_breakable_by_hand = 3 },
		light_source = 14,
		is_ground_content = true
	})

	minetest.register_node('oblx_parts:'..color.id..'_wedge', {
		description = color.name..' Part (Wedge)',
		tiles = {"oblx_parts_smooth.png^[multiply:#"..color.color},
		groups = { oddly_breakable_by_hand = 3 },
		is_ground_content = true,
		drawtype = "mesh",
		paramtype = "light",
		paramtype2 = "facedir",
		mesh = "oblx_parts_wedge.obj",
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
				{-0.5,     0,     0, 0.5,  0.25, 0.5},
				{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
				{-0.5,     0,     0, 0.5,  0.25, 0.5},
				{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
			}
		}
	})
end

minetest.register_node('oblx_parts:invisible_light', {
	description = 'Invisible Light\n'
				..minetest.colorize("#ff8888", "Indestructible, to remove you need to place a part in the place of it."),
	inventory_image = "oblx_parts_invisible_light.png",
	wield_image = "oblx_parts_invisible_light.png",
	groups = { not_in_creative_inventory = 1 },
	drawtype = "airlike",
	sunlight_propagates = true,
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true
})
