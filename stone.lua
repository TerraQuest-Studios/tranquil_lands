local function stone_nodes(name, rubble)
    local rn = "tranquil_lands:" .. name .. "_rubble"

    minetest.register_node("tranquil_lands:" .. name, {
        description = name,
        tiles = {"[combine:16x16:0,0=tl_" .. name .. ".png"},
        _dungeon_loot = {chance = math.random(0.1, 0.3), count = {4, 64}},
        sounds = fl_stone.sounds.stone(),
        groups = {dig_stone = 2, stairable = 1, wallable = 1, stonelike = 1, stone = 1},
    })
    if rubble then
        minetest.register_node("tranquil_lands:" .. name .. "_rubble", {
            description = name .. " rubble",
            tiles = {"tl_" .. name .. "_rubble.png"},
            sounds = fl_stone.sounds.stone(),
            groups = {dig_stone = 3, stairable = 1, wallable = 1, stonelike = 1, rubble = 1},
        })
        minetest.register_craft({
            type = "cooking",
            output = "tranquil_lands:" .. name,
            recipe = "tranquil_lands:" .. name .. "_rubble",
            cooktime = 5,
        })
        minetest.override_item("tranquil_lands:" .. name, {
            drop = {
                max_items = 1,
                items = {
                    {items = {rn}}
                },
                stairs = {
                    slab = rn .. "_slab",
                    stair = rn .. "_stair",
                    inner_stair = rn .. "_inner_stair",
                    outer_stair = rn .. "_outer_stair",
                },
                walls = rn .. "_wall"
            },
        })
    end
    for _, tex in pairs({"iron", "copper", "tin", "gold", "diamond", "mithite"}) do
        minetest.register_node("tranquil_lands:" .. tex .. "_in_" .. name, {
            description = tex .. " in " .. name,
            tiles = {"[combine:16x16:0,0=tl_" .. name .. ".png^farlands_" .. tex .. "_overlay.png"},
            sounds = fl_stone.sounds.stone(),
            groups = {dig_stone = 2, stairable = 1, wallable = 1, stonelike = 1, stone = 1},
            drop = "fl_ores:" .. tex .. "_ore",
        })
    end
end

stone_nodes("blackstone", true)
stone_nodes("moonstone", false)

minetest.register_node("tranquil_lands:moonstone_with_grass", {
    description = "moonstone with grass",
    tiles = {
        {name = "tl_grass.png", align_style = "world", scale = 4},
        "[combine:16x16:0,0=tl_moonstone.png",
        "[combine:16x16:0,0=tl_moonstone.png^tl_grass_side.png"
    },
    groups = {dig_stone = 2, stairable = 1, wallable = 1, stonelike = 1, stone = 1}
})

minetest.register_node("tranquil_lands:grass", {
    description = "grass",
    drawtype = "plantlike",
    paramtype = "light",
    paramtype2 = "degrotate",
    tiles = {"tl_grass_plant.png"},
    floodable = true,
    on_flood = function(pos, oldnode, newnode)
        minetest.dig_node(pos)
    end,
    selection_box = {
        type = "fixed",
        fixed = {-0.5,-0.5,-0.5,0.5,-0.45,0.5},
    },
    walkable = false,
    groups = {dig_generic = 4, plant = 1},
})
