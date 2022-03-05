local ymin = minetest.settings:get("mgv7_floatland_ymin") or 1024
local ymax = minetest.settings:get("mgv7_floatland_ymax") or 4096

minetest.register_biome({
    name = "floatlands",
    node_top = "tranquil_lands:moonstone_with_grass",
    depth_top = 1,
    node_filler = "tranquil_lands:moonstone",
    depth_filler = 11,
    node_riverbed = "tranquil_lands:moonstone",
    depth_riverbed = 1,
    node_dungeon = "tranquil_lands:blackstone_rubble",
    node_dungeon_alt = "tranquil_lands:blackstone",
    node_dungeon_stair = "tranquil_lands:blackstone_rubble_stair",
    node_stone = "tranquil_lands:blackstone",
    y_max = ymax,
    y_min = ymin,
    heat_point = 50,
    humidity_point = 35,
    _sky_data = {
        sky = {
            sky_color={
                day_sky = "#01C7EC",
                night_sky = "#00FFFF",
                dawn_sky = "#00AAFF",
            },
        },
    }
})