
minetest.register_biome({
	name = "flowerlands",
	node_top = "oblx_parts:bright_green",
	depth_top = 1,
	node_filler = "oblx_parts:brown",
	depth_filler = 3,
	node_riverbed = "oblx_parts:cool_yellow",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 49.8,
	humidity_point = 77.1,
})

local flowers = {
	red = {
		name = "oblx_parts:bright_red"
	},
	yellow = {
		name = "oblx_parts:bright_yellow"
	},
	blue = {
		name = "oblx_parts:pastel_blue"
	},
	pink = {
		name = "oblx_parts:light_reddish_violet"
	},
	weeds = {
		name = "oblx_parts:brown_yellowish_green"
	}
}

for _,flower in pairs(flowers) do
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"oblx_parts:bright_green"},
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"flowerlands"},
		y_max = 200,
		y_min = 1,
		decoration = flower.name,
	})
end