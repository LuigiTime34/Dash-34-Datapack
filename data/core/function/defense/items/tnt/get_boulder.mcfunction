execute store result score $boulder_pos.x defense.items run data get entity @n[tag=defense.boulder-marker] Pos[0] 1
execute store result score $boulder_pos.y defense.items run data get entity @n[tag=defense.boulder-marker] Pos[1] 1
execute store result score $boulder_pos.z defense.items run data get entity @n[tag=defense.boulder-marker] Pos[2] 1

execute store result storage core:boulder_pos x int 1 run scoreboard players get $boulder_pos.x defense.items
execute store result storage core:boulder_pos y int 1 run scoreboard players get $boulder_pos.y defense.items
execute store result storage core:boulder_pos z int 1 run scoreboard players get $boulder_pos.z defense.items

scoreboard players operation $boulder_pos.y defense.items += $boulder.3 defense.items
scoreboard players operation $boulder_pos.x defense.items += $boulder.6 defense.items
scoreboard players operation $boulder_pos.z defense.items += $boulder.6 defense.items

execute store result storage core:boulder_pos x2 int 1 run scoreboard players get $boulder_pos.x defense.items
execute store result storage core:boulder_pos y2 int 1 run scoreboard players get $boulder_pos.y defense.items
execute store result storage core:boulder_pos z2 int 1 run scoreboard players get $boulder_pos.z defense.items

execute at @n[tag=defense.boulder-marker] run function core:defense/items/tnt/destroy_boulder with storage core:boulder_pos