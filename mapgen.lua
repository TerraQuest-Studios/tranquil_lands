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

minetest.register_decoration({
    name = "tranquil_lands:grass",
    deco_type = "simple",
    place_on = {"tranquil_lands:moonstone_with_grass"},
    sidelen = 16,
    fill_ratio = 0.08,
    biomes = {"floatlands"},
    y_max = ymax,
    y_min = ymin,
    param2 = 1,
    param2_max = 255,
    decoration = "tranquil_lands:grass"
})

minetest.register_decoration({
    name = "tranquil_lands:juniper_tree",
    deco_type = "schematic",
    place_on = "tranquil_lands:moonstone_with_grass",
    sidelen = 16,
    fill_ratio = 0.001,
    biomes = {"floatlands"},
    y_max = ymax,
    y_min = ymin,
    place_offset_y = 1,
    schematic = minetest.get_modpath("tranquil_lands") .. "/schems/tl_juniper_tree.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})

minetest.register_decoration({
    name = "tranquil_lands:birch_tree",
    deco_type = "schematic",
    place_on = "tranquil_lands:moonstone_with_grass",
    sidelen = 16,
    fill_ratio = 0.005,
    biomes = {"floatlands"},
    y_max = ymax,
    y_min = ymin,
    place_offset_y = 1,
    schematic = minetest.get_modpath("tranquil_lands") .. "/schems/tl_birch_tree.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})