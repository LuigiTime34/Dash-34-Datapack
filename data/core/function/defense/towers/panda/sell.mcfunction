execute store result storage core:tower_sell sell_cost int 0.5 run scoreboard players get @s defense.money
function core:defense/towers/panda/sell_macro with storage core:tower_sell
scoreboard players reset $sell.cost defense.money
execute at @s run playsound minecraft:block.anvil.destroy master @a[tag=!defense.selling_all] ~ ~ ~ 0.6 0.9
fill ~-3 ~ ~-3 ~3 ~14 ~3 light[level=8] destroy
fill ~-3 ~-1 ~-3 ~3 ~ ~3 green_concrete_powder replace green_concrete
tag @n[tag=defense.tower_square] remove defense.has_tower
kill @s
kill @n[tag=panda-center-marker]
kill @n[tag=tower-barrel-display]
kill @e[tag=defense.panda_interaction,distance=..3.5]
tag @e[tag=defense.panda,distance=..3.5] add dead-panda
execute as @e[tag=dead-panda] at @s run tp @s ~ ~-300 ~
execute as @e[tag=dead-panda] at @s run kill @s
clear @a *[custom_data~{tower_upgrade:1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_upgrade:1b}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_stat:1b}}}}]