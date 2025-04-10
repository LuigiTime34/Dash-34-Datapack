execute store result score $sell.cost defense.money run data get entity @s data.sell_cost 0.5
execute at @s run playsound minecraft:block.respawn_anchor.deplete master @a ~ ~ ~ 0.6 0.9
execute store result storage core:tower_sell sell_cost int 1 run scoreboard players get $sell.cost defense.money
function core:defense/towers/bee/sell_macro with storage core:tower_sell
scoreboard players reset $sell.cost defense.money
fill ~-3 ~ ~-3 ~3 ~10 ~3 air destroy
kill @s
kill @n[tag=bee-center-marker]
kill @n[tag=tower-barrel-display]
kill @n[tag=defense.bee_deployer]
clear @a *[custom_data~{tower_upgrade:1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_upgrade:1b}}}}]