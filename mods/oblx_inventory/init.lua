
local F = minetest.formspec_escape

-- Create a detached inventory
local inv_creative = minetest.create_detached_inventory("creative", {
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	allow_put = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_take = function(inv, listname, index, stack, player)
		return -1
	end,
})
local inv_trash = minetest.create_detached_inventory("trash", {
	allow_take = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	on_put = function(inv, listname, index, stack, player)
		inv:set_list("main", {})
	end,
})
inv_trash:set_size("main", 1)

local max_page = 1

function get_creative_formspec(page)
	local start = 0 + (page-1)*40
	local inv_formspec = [[
		formspec_version[4]
		size[13.3,11.5]

		list[detached:creative;main;0.5,0.3;10,4;${start}]

		button[0.5,5.35;1,1;inv_creative_prev;\<]
		label[2,5.85;Page: ${page} / ${max_page}]
		button[4.25,5.35;1,1;inv_creative_next;\>]

		label[10.3,5.85;Trash:]
		list[detached:trash;main;11.7,5.35;1,1]

		listring[current_player;main]
		list[current_player;main;0.5,7.2;10,2;10]
		list[current_player;main;0.5,10;10,1;0]

		listring[detached:everything;main]
		listring[current_player;main]
		listring[detached:trash;main]
		field[-10,-10;0,0;internal_paginator;;${page}]
	]]
	return inv_formspec:gsub("${start}", start):gsub("${page}", page):gsub("${max_page}", max_page)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "" and fields.quit == nil then
		local page = fields.internal_paginator
		if fields.inv_creative_prev then
			page = page - 1
		elseif fields.inv_creative_next then
			page = page + 1
		end
		if page < 1 then
			page = max_page
		end
		if page > max_page then
			page = 1
		end
		minetest.show_formspec(player:get_player_name(), "", get_creative_formspec(page))
	end
end)

minetest.register_on_mods_loaded(function()
	local items = {}
	for itemstring, def in pairs(minetest.registered_items) do
		if itemstring ~= ""
		and itemstring ~= "unknown"
		and itemstring ~= "ignore"
		and itemstring ~= "air"
		and itemstring ~= "worldedit:placeholder"
		and def.groups.not_in_creative_inventory ~= 1 then
			table.insert(items, itemstring)
		end
	end
	--[[ Items should be sorted in this order
	1. Nodes (Parts)
	2. Craftitems/Tools
	Because the parts are probably what you wanna see first. ]]
	local function compare(item1, item2)
		local def1 = minetest.registered_items[item1]
		local def2 = minetest.registered_items[item2]
		local tool1 = def1.type == "tool"
		local tool2 = def2.type == "tool"
		local craftitem1 = def1.type == "craft"
		local craftitem2 = def2.type == "craft"
		if tool1 and not tool2 then
			return false
		elseif not tool1 and tool2 then
			return true
		elseif craftitem1 and not craftitem2 then
			return false
		elseif not craftitem1 and craftitem2 then
			return true
		else
			return item1 < item2
		end
	end
	table.sort(items, compare)
	inv_creative:set_size("main", #items)
	max_page = math.ceil(#items / 40)
	for i=1, #items do
		inv_creative:add_item("main", items[i])
	end
end)

minetest.register_on_joinplayer(function(player)
	if minetest.is_creative_enabled(player:get_player_name()) then
		player:set_inventory_formspec(get_creative_formspec(1))
	else
		player:set_inventory_formspec([[
			formspec_version[4]
			size[13.3,5.7]

			listring[current_player;main]
			list[current_player;main;0.5,0.8;10,2;10]
			list[current_player;main;0.5,3.8;10,1;0]
		]])
	end
end)
