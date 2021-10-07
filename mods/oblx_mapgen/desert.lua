minetest.register_biome({
	name = "desert",
	node_filler = "oblx_parts:cool_yellow",
	depth_filler = 4,
	node_riverbed = "oblx_parts:cool_yellow",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 26.9,
	humidity_point = 77.1,
})

minetest.register_decoration({
	name = "oblx_mapgen:desert_cactus",
	deco_type = "schematic",
	place_on = {"oblx_parts:cool_yellow"},
	sidelen = 16,
	fill_ratio = 0.001,
	biomes = {"desert"},
	y_max = 31000,
	y_min = 1,
	schematic = minetest.get_modpath("oblx_mapgen").."/schematics/cactus.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})
