item replace entity @p[gamemode=adventure] weapon.mainhand from block -1 -43 0 container.2
execute unless score $money defense.money matches 30.. run playsound minecraft:block.note_block.didgeridoo master @a ~ ~ ~ 2 1
execute unless score $money defense.money matches 30.. run return run tellraw @a {"text": "Not enough gold!","color": "gold"}

scoreboard players remove $money defense.money 30

function core:defense/scoreboard/get_highest

execute if block ~ -60 ~-5 #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 1
execute if block ~5 -60 ~ #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 2
execute if block ~ -60 ~5 #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 3
execute if block ~-5 -60 ~ #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 4

execute as @p[gamemode=adventure] if score @s defense.rotation matches -45..45 if block ~ -60 ~-5 #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 1
execute as @p[gamemode=adventure] if score @s defense.rotation matches 46..135 if block ~5 -60 ~ #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 2
execute as @p[gamemode=adventure] if score @s defense.rotation matches 136..180 if block ~ -60 ~5 #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 3
execute as @p[gamemode=adventure] if score @s defense.rotation matches -180..-135 if block ~ -60 ~5 #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 3
execute as @p[gamemode=adventure] if score @s defense.rotation matches -136..-44 if block ~-5 -60 ~ #core:path_blocks run scoreboard players set $tower_rotation defense.rotation 4
execute if score $tower_rotation defense.rotation matches 1 as @p[gamemode=adventure] run function core:defense/towers/bee/placement/init_placement {"rotation":"none","x_offset":"-3","z_offset":"-3","sell_cost":"30"}
execute if score $tower_rotation defense.rotation matches 2 as @p[gamemode=adventure] run function core:defense/towers/bee/placement/init_placement {"rotation":"clockwise_90","x_offset":"3","z_offset":"-3","sell_cost":"30"}
execute if score $tower_rotation defense.rotation matches 3 as @p[gamemode=adventure] run function core:defense/towers/bee/placement/init_placement {"rotation":"180","x_offset":"3","z_offset":"3","sell_cost":"30"}
execute if score $tower_rotation defense.rotation matches 4 as @p[gamemode=adventure] run function core:defense/towers/bee/placement/init_placement {"rotation":"counterclockwise_90","x_offset":"-3","z_offset":"3","sell_cost":"30"}