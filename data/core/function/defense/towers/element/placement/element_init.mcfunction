item replace entity @p[gamemode=adventure] weapon.mainhand from block -1 -43 0 container.1
execute unless score $money defense.money matches 30.. run playsound minecraft:block.note_block.didgeridoo master @a ~ ~ ~ 2 1
execute unless score $money defense.money matches 30.. run return run tellraw @a {"text": "Not enough gold!","color": "gold"}

scoreboard players remove $money defense.money 30

function core:defense/scoreboard/get_highest
execute as @p[gamemode=adventure] if score @s defense.rotation matches -45..45 run function core:defense/towers/element/placement/init_placement {"rotation":"none","x_offset":"-3","z_offset":"-3","sell_cost":"30"}
execute as @p[gamemode=adventure] if score @s defense.rotation matches 46..135 run function core:defense/towers/element/placement/init_placement {"rotation":"clockwise_90","x_offset":"3","z_offset":"-3","sell_cost":"30"}
execute as @p[gamemode=adventure] if score @s defense.rotation matches 136..180 run function core:defense/towers/element/placement/init_placement {"rotation":"180","x_offset":"3","z_offset":"3","sell_cost":"30"}
execute as @p[gamemode=adventure] if score @s defense.rotation matches -180..-135 run function core:defense/towers/element/placement/init_placement {"rotation":"180","x_offset":"3","z_offset":"3","sell_cost":"30"}
execute as @p[gamemode=adventure] if score @s defense.rotation matches -136..-44 run function core:defense/towers/element/placement/init_placement {"rotation":"counterclockwise_90","x_offset":"-3","z_offset":"3","sell_cost":"30"}