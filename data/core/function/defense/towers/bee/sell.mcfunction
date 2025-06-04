execute store result storage core:tower_sell sell_cost int 0.8 run scoreboard players get @s defense.money
function core:defense/towers/bee/sell_macro with storage core:tower_sell
scoreboard players reset $sell.cost defense.money
execute at @s run playsound minecraft:block.anvil.destroy master @a[tag=!defense.selling_all] ~ ~ ~ 0.6 0.9
fill ~-3 ~ ~-3 ~3 ~10 ~3 light[level=8] destroy
tag @n[tag=defense.tower_square] remove defense.has_tower
kill @e[tag=defense.bee_interaction,distance=..4.3]
kill @s
kill @n[tag=bee-center-marker]
kill @n[tag=tower-barrel-display]
kill @e[tag=defense.bee_deployer,distance=..4.95]
clear @a *[custom_data~{tower_upgrade:1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_upgrade:1b}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_stat:1b}}}}]