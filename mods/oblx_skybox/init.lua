
minetest.register_on_joinplayer(function(player)
	player:set_sky({
		type = 'skybox',
		textures = {
			'oblx_skybox_up.png',
			'oblx_skybox_down.png',
			'oblx_skybox_west.png',
			'oblx_skybox_east.png',
			'oblx_skybox_north.png',
			'oblx_skybox_south.png',
		},
		clouds = false,
		sky_color = {
			fog_sun_tint = "#FFF",
			fog_moon_tint = "#FFF",
			fog_tint_type = "custom"
		}
	})

	player:set_sun({
		visible = false,
		sunrise_visible = false
	})

	player:set_moon({
		visible = false
	})

	player:set_stars({
		visible = false
	})

	player:override_day_night_ratio(0.8)
end)
