summon minecraft:block_display ~ ~-1 ~ {block_state: {Name: "minecraft:pointed_dripstone", Properties: {thickness: "tip", vertical_direction: "up", waterlogged: "false"}}, brightness: {block: 0, sky: 15},  transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 2.5f, 1.0f], translation: [-0.5f, -0.5f, -0.5f]},Tags:["elemental-spike"]}
data merge entity @n[tag=elemental-spike] {start_interpolation: -1, interpolation_duration:10,transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 2.5f, 1.0f], translation: [-0.5f, 0.5f, -0.5f]}}
scoreboard players set @n[tag=elemental-spike] defense.towers 20
$damage @s $(damage) core:defense/falling_stalactite by @p
particle block{block_state:"dripstone_block"} ~ ~ ~ 0.125 1 0.125 0 25
playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1 2