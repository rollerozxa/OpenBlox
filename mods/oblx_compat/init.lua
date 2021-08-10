local function include_compat_file(file)
	dofile(minetest.get_modpath("oblx_compat") .. "/"..file..".lua")
end

include_compat_file("2021-08-10")