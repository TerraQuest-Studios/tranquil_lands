local function tree_nodes(name)

    minetest.register_node("tranquil_lands:" .. name .. "_trunk", {
        --nodes
        description = name .. " tree trunk",
        tiles = {
            "tl_" .. name .. "_trunk_top.png",
            "tl_" .. name .. "_trunk_top.png",
            "[combine:16x16:0,0=tl_" .. name .. "_trunk.png"
        },
        paramtype2 = "facedir",
        sounds = fl_trees.sounds.wood(),
        groups = {dig_tree = 1, wood_related = 1, tree = 1, trunk = 1},
        on_place = minetest.rotate_node
    })
    minetest.register_node("tranquil_lands:" .. name .. "_leaves", {
        description = name .. " leaves",
        drawtype = "allfaces_optional",
        paramtype = "light",
        tiles = {"tl_" .. name .. "_leaves.png"},
        groups = {dig_tree = 3, wood_related = 1, tree = 1, leaf = 1, spawn_blacklist = 1},
    })
    minetest.register_node("tranquil_lands:" .. name .. "_plank", {
        description = name .. " plank",
        paramtype2 = "facedir",
        place_param2 = 0,
        tiles = {"tl_" .. name .. "_planks.png"},
        sounds = fl_trees.sounds.wood(),
        groups = {dig_tree = 2, wood_related = 1, plank = 1, fenceable = 1, stairable = 1},
        on_place = minetest.rotate_node
    })
    minetest.register_node("tranquil_lands:" .. name .. "_plank_fence", {
        description = name .. " fence",
        paramtype = "light",
        drawtype = "nodebox",
        node_box = {
            type = "connected",
            fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
            connect_front = {{-1/16, 3/16, -1/2, 1/16, 5/16, -1/8 }, {-1/16, -5/16, -1/2, 1/16, -3/16, -1/8 }},
            connect_left =  {{-1/2, 3/16, -1/16, -1/8, 5/16, 1/16}, {-1/2, -5/16, -1/16, -1/8, -3/16, 1/16}},
            connect_back =  {{-1/16, 3/16, 1/8, 1/16, 5/16, 1/2 }, {-1/16, -5/16, 1/8, 1/16, -3/16, 1/2 }},
            connect_right = {{ 1/8, 3/16, -1/16, 1/2, 5/16, 1/16}, { 1/8, -5/16, -1/16, 1/2, -3/16, 1/16}},
        },
        connects_to = {"group:fence", "group:wood_related"},
        tiles = {"tl_" .. name .. "_planks.png"},
        sounds = fl_trees.sounds.wood(),
        groups = {dig_tree = 2, wood_related = 1, plank = 1, not_in_creative_inventory = 1},
    })

    --crafts
    minetest.register_craft({
        output = "tranquil_lands:" .. name .. "_plank 4",
        recipe = {{"tranquil_lands:" .. name .. "_trunk",}}
    })

    minetest.register_craft({
        output = "fl_trees:stick 4",
        recipe = {{"tranquil_lands:" .. name .. "_plank"}},
    })
end

tree_nodes("juniper")
tree_nodes("birch")

minetest.override_item("tranquil_lands:birch_plank_fence", {tiles={"farlands_aspen_planks.png"}})
minetest.override_item("tranquil_lands:birch_plank", {tiles={"farlands_aspen_planks.png"}})