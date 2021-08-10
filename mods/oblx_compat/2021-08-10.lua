-- OpenBlox format 2
-- Upgrades the old testing colors to the new color palette

local convlist = {
	{
		old_itemstring = "oblx_parts:red",
		new_itemstring = "oblx_parts:bright_red"
	}, {
		old_itemstring = "oblx_parts:yellow",
		new_itemstring = "oblx_parts:bright_yellow"
	}, {
		old_itemstring = "oblx_parts:green",
		new_itemstring = "oblx_parts:bright_green"
	}, {
		old_itemstring = "oblx_parts:blue",
		new_itemstring = "oblx_parts:bright_blue"
	}, {
		old_itemstring = "oblx_parts:gray",
		new_itemstring = "oblx_parts:light_stone_gray"
	}
}

local i = 1
for _, convdata in pairs(convlist) do
	minetest.register_lbm({
		label = "[OBLX format 2 conversion] Convert old '"..convdata.old_itemstring.."' to '"..convdata.new_itemstring.."'",
		name = "oblx_compat:format2_"..i,
		nodenames = { convdata.old_itemstring },
		action = function(pos, node)
			minetest.swap_node(pos, { name = convdata.new_itemstring })
		end
	})
	i = i + 1
end
