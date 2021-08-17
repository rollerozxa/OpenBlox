
minetest.register_craftitem("oblx_partsbox:partsbox", {
	description = "Box of Parts",
	inventory_image = "oblx_partsbox_tex.png",
	on_use = function(itemstack, user, pointed_thing)
		minetest.show_formspec(user:get_player_name(), "", get_creative_formspec(1))
	end,
	groups = { not_in_creative_inventory = 1 },
})
