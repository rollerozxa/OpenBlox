
minetest.register_alias('mapgen_stone', 'oblx_parts:red')
minetest.register_alias('mapgen_water_source', 'air')
minetest.register_alias('mapgen_river_water_source', 'air')


minetest.register_item(':', {
	type = 'none',
	wield_image = 'oblx_core_hand.png',
	wield_scale = {x = 0.5, y = 1, z = 4},
	range = 10,
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			oddly_breakable_by_hand = {
				times = {[1] = 3.50, [2] = 2.00, [3] = 0.20},
				uses = 0,
			},
		},
		damage_groups = {fleshy = 1},
	}
})


minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)

	-- Unlimited blocks in creative mode
	if placer and placer:is_player() then
		return minetest.is_creative_enabled(placer:get_player_name())
	end
end)
