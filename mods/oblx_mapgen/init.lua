
minetest.register_alias("mapgen_stone", "oblx_parts:dark_stone_gray")
minetest.register_alias("mapgen_water_source", "oblx_parts:bright_bluish_green_trans")
minetest.register_alias("mapgen_river_water_source", "oblx_parts:bright_bluish_green_trans")

minetest.register_biome({
	name = "grasslands",
	node_top = "oblx_parts:bright_green",
	depth_top = 1,
	node_filler = "oblx_parts:brown",
	depth_filler = 3,
	node_riverbed = "oblx_parts:cool_yellow",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 50,
	humidity_point = 12,
})

minetest.register_biome({
	name = "beach",
	node_top = "oblx_parts:cool_yellow",
	depth_top = 1,
	node_filler = "oblx_parts:cool_yellow",
	depth_filler = 2,
	node_riverbed = "oblx_parts:cool_yellow",
	depth_riverbed = 2,
	y_max = 4,
	y_min = -2,
	heat_point = 50,
	humidity_point = 35,
})

minetest.register_biome({
	name = "sea",
	node_top = "oblx_parts:cool_yellow",
	depth_top = 1,
	node_filler = "oblx_parts:cool_yellow",
	depth_filler = 2,
	y_max = -2,
	y_min = -50,
	heat_point = 50,
	humidity_point = 35,
})
