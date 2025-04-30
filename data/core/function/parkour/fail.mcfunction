tp @n[tag=current_checkpoint]
playsound block.respawn_anchor.deplete master @a ~ ~ ~ 1000000000
clear @s minecraft:wind_charge
kill @e[type=minecraft:wind_charge]
tag @s remove has-wind-charge
scoreboard players add $deaths parkour 1
execute as @s[tag=discovered-gravity] run function core:parkour/blocks/gravity_normal
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_on_fire":true}}} at @s run summon potion ~ ~ ~ {Item:{id:"minecraft:splash_potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}
execute at @s if block ~ ~-2 ~ cyan_wool run rotate @s 0 0
execute at @s if block ~ ~-2 ~ blue_wool run rotate @s -90 0
execute at @s if block ~ ~-2 ~ light_blue_wool run rotate @s 90 0
execute at @s if block ~ ~-2 ~ purple_wool run rotate @s 180 0
execute at @s if block ~ ~-2 ~ black_wool run rotate @s 180 0