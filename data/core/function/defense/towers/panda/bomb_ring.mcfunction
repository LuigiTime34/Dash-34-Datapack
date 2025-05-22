$particle small_flame ^ ^ ^$(range) ^ ^ ^ 0 0 normal
scoreboard players add @s defense.range_indicator 1

execute store result storage core:defense.panda_range particle_type int 1 run scoreboard players get @s defense.panda_bomb_range

execute if score @s defense.range_indicator matches ..8 rotated ~45 0 run function core:defense/towers/panda/bomb_ring with storage core:defense.panda_range
execute if score @s defense.range_indicator matches 9.. run scoreboard players reset @s defense.range_indicator