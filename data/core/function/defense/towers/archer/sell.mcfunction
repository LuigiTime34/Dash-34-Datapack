execute store result storage core:tower_sell sell_cost int 0.5 run scoreboard players get @s defense.money
function core:defense/towers/archer/sell_macro with storage core:tower_sell
scoreboard players reset $sell.cost defense.money
fill ~-3 ~ ~-3 ~3 ~12 ~3 air destroy
execute at @s run playsound minecraft:block.respawn_anchor.deplete master @a ~ ~ ~ 0.6 0.9
kill @s
kill @n[tag=tower-center-marker]
tag @n[tag=archer-skeleton] add dead-skellie
execute as @n[tag=dead-skellie] at @s run tp @s ~ ~-300 ~
execute as @n[tag=dead-skellie] at @s run kill @s
clear @a *[custom_data~{tower_upgrade:1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_upgrade:1b}}}}]