
-- TODO: this is just a temporary node, it should be colorized from a white node.
minetest.register_node('oblx_parts:red', {
    description = 'Red Part',
    tiles = {"oblx_parts_red_outset.png", "oblx_parts_red.png"},
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})
