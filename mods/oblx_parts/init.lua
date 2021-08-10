
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
		id = "8",
		name = "8",
		color = "fdea8c"
	},{
		id = "9",
		name = "9",
		color = "0d69ab"
	}, {
		id = "10",
		name = "10",
		color = "008f9b"
	}, {
		id = "11",
		name = "11",
		color = "6e99c9"
	}, {
		id = "12",
		name = "12",
		color = "80bbdb"
	}, {
		id = "13",
		name = "13",
		color = "b4d2e3"
	}, {
		id = "14",
		name = "14",
		color = "74869c"
	}, {
		id = "15",
		name = "15",
		color = "da8540"
	}, {
		id = "16",
		name = "16",
		color = "e29b3f"
	},
	{
		id = "17",
		name = "17",
		color = "27462c"
	}, {
		id = "18",
		name = "18",
		color = "287f46"
	}, {
		id = "19",
		name = "19",
		color = "4b974a"
	}, {
		id = "20",
		name = "20",
		color = "a4bd46"
	}, {
		id = "21",
		name = "21",
		color = "a1c48b"
	}, {
		id = "22",
		name = "22",
		color = "789081"
	}, {
		id = "23",
		name = "23",
		color = "a05f34"
	}, {
		id = "24",
		name = "24",
		color = "694027"
	},{
		id = "25",
		name = "25",
		color = "6b327b"
	}, {
		id = "26",
		name = "26",
		color = "e8bac7"
	}, {
		id = "27",
		name = "27",
		color = "da8679"
	}, {
		id = "28",
		name = "28",
		color = "d7c599"
	}, {
		id = "29",
		name = "29",
		color = "957976"
	}, {
		id = "30",
		name = "30",
		color = "7c5c45"
	}, {
		id = "31",
		name = "31",
		color = "cc8e68"
	}, {
		id = "32",
		name = "32",
		color = "eab891"
	},
}

for _, color in pairs(colors) do
	minetest.register_node('oblx_parts:'..color.id, {
		description = color.name..' Part',
		tiles = {
			"oblx_parts_outset.png^[multiply:#"..color.color,
			"oblx_parts_smooth.png^[multiply:#"..color.color
		},
		groups = { oddly_breakable_by_hand = 3 },
		is_ground_content = true
	})
end
