execute store result storage core:tower_sell sell_cost int 0.5 run scoreboard players get @s defense.money
function core:defense/towers/element/sell_macro with storage core:tower_sell
scoreboard players reset $sell.cost defense.money
execute at @s run playsound minecraft:block.anvil.destroy master @a[tag=!defense.selling_all] ~ ~ ~ 0.6 0.9
fill ~-3 ~ ~-3 ~3 ~14 ~3 light[level=8] destroy
kill @s
kill @n[tag=element-center-marker]
kill @n[tag=tower-barrel-display]
clear @a *[custom_data~{tower_upgrade:1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_upgrade:1b}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_stat:1b}}}}]