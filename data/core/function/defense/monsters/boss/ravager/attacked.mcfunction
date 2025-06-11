execute if predicate {condition:"random_chance","chance":0.75} run return 0
execute at @s run playsound minecraft:entity.ravager.celebrate master @a ~ ~ ~ 10
scoreboard players set $ravager_speed defense.speed 120
scoreboard players set @s defense.ravager_speed 61
tag @s add defense.ravager_speed