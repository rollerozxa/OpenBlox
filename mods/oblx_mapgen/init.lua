
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
	heat_point = 37.4,
	humidity_point = 34.5,
})

minetest.register_biome({
	name = "woodlands",
	node_top = "oblx_parts:dark_green",
	depth_top = 1,
	node_filler = "oblx_parts:brown",
	depth_filler = 3,
	node_riverbed = "oblx_parts:cool_yellow",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 82.7,
	humidity_point = 40.7,
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

minetest.register_decoration({
	name = "oblx_mapgen:tree_test",
	deco_type = "schematic",
	place_on = {"oblx_parts:bright_green"},
	sidelen = 16,
	fill_ratio = 0.0001,
	biomes = {"grasslands"},
	y_max = 31000,
	y_min = 1,
	schematic = minetest.get_modpath("oblx_mapgen").."/schematics/tree_test.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
	name = "oblx_mapgen:tree_test2",
	deco_type = "schematic",
	place_on = {"oblx_parts:dark_green"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"woodlands"},
	y_max = 31000,
	y_min = 1,
	schematic = minetest.get_modpath("oblx_mapgen").."/schematics/tree_test.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})
