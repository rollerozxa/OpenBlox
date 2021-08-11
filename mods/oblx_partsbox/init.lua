local F = minetest.formspec_escape

-- Create a detached inventory
local inv_everything = minetest.create_detached_inventory("everything", {
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

local function get_chest_formspec(page)
	local start = 0 + (page-1)*32
	return "size[8,9]"..
	"list[detached:everything;main;0,0;8,4;"..start.."]"..
	"list[current_player;main;0,5;8,4;]" ..
	"label[6,4;Trash:]" ..
	"list[detached:trash;main;7,4;1,1]" ..
	"button[0,4;1,1;chest_of_everything_prev;"..F("<").."]"..
	"button[1,4;1,1;chest_of_everything_next;"..F(">").."]"..
	"label[2,4;"..F("Page: "..page).."]"..
	"listring[detached:everything;main]"..
	"listring[current_player;main]"..
	"listring[detached:trash;main]"..
	"field[-10,-10;0,0;internal_paginator;;"..F(page).."]"
end

minetest.register_craftitem("oblx_partsbox:partsbox", {
	description = "Box of Parts",
	inventory_image = "oblx_partsbox_tex.png",
	on_use = function(itemstack, user, pointed_thing)
		minetest.show_formspec(user:get_player_name(), "oblx_partsbox:formspec", get_chest_formspec(1))
	end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "oblx_partsbox:formspec" and fields.quit == nil then
		local page = fields.internal_paginator
		if fields.chest_of_everything_prev then
			page = page - 1
		elseif fields.chest_of_everything_next then
			page = page + 1
		end
		if page < 1 then
			page = max_page
		end
		if page > max_page then
			page = 1
		end
		minetest.show_formspec(player:get_player_name(), "oblx_partsbox:formspec", get_chest_formspec(page))
	end
end)

minetest.register_on_mods_loaded(function()
	local items = {}
	for itemstring,_ in pairs(minetest.registered_items) do
		if itemstring ~= ""
		and itemstring ~= "unknown"
		and itemstring ~= "ignore"
		and itemstring ~= "air"
		and itemstring ~= "oblx_partsbox:partsbox"
		and itemstring ~= "worldedit:placeholder" then
			table.insert(items, itemstring)
		end
	end
	--[[ Sort items in this order:
	* Test tools
	* Other tools
	* Craftitems
	* Other items
	* Dummy items ]]
	local function compare(item1, item2)
		local def1 = minetest.registered_items[item1]
		local def2 = minetest.registered_items[item2]
		local tool1 = def1.type == "tool"
		local tool2 = def2.type == "tool"
		local testtool1 = minetest.get_item_group(item1, "testtool") == 1
		local testtool2 = minetest.get_item_group(item2, "testtool") == 1
		local dummy1 = minetest.get_item_group(item1, "dummy") == 1
		local dummy2 = minetest.get_item_group(item2, "dummy") == 1
		local craftitem1 = def1.type == "craft"
		local craftitem2 = def2.type == "craft"
		if dummy1 and not dummy2 then
			return false
		elseif not dummy1 and dummy2 then
			return true
		elseif testtool1 and not testtool2 then
			return true
		elseif not testtool1 and testtool2 then
			return false
		elseif tool1 and not tool2 then
			return true
		elseif not tool1 and tool2 then
			return false
		elseif craftitem1 and not craftitem2 then
			return true
		elseif not craftitem1 and craftitem2 then
			return false
		else
			return item1 < item2
		end
	end
	table.sort(items, compare)
	inv_everything:set_size("main", #items)
	max_page = math.ceil(#items / 32)
	for i=1, #items do
		inv_everything:add_item("main", items[i])
	end
end)
