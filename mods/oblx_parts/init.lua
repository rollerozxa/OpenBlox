
colors = {
	{
		id = "red",
		name = "Red",
		color = "ff2222"
	}, {
		id = "yellow",
		name = "Yellow",
		color = "ffff22"
	}, {
		id = "green",
		name = "Green",
		color = "22ff22"
	}, {
		id = "blue",
		name = "Blue",
		color = "2222ff"
	}, {
		id = "gray",
		name = "Gray",
		color = "ffffff"
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
