scoreboard players set @s defense.abilities 80
execute if score @s defense.bee.honey_slowness matches 1.. run return fail
# Heal itself
playsound minecraft:entity.witch.drink master @a ~ ~ ~ 2
effect give @s instant_health 1 0
data modify entity @s HurtTime set value 10
particle minecraft:entity_effect{color:[1.0,0.0,0.0,1.0]} ~ ~1 ~ 0.3 0.3 0.3 0 20

# Heal other monsters that are not witches
execute as @e[tag=defense-monster,tag=!defense-witch,distance=..5,type=!#minecraft:undead] run effect give @s instant_health 1 0
execute as @e[tag=defense-monster,tag=!defense-witch,distance=..5,type=#minecraft:undead,tag=!defense-zombified_piglin] run effect give @s instant_damage 1 0
execute as @e[tag=defense-monster,distance=..5,tag=!defense-zombified_piglin,tag=!defense-witch] run data modify entity @s HurtTime set value 10
execute as @e[tag=defense-monster,distance=..5,tag=!defense-witch] at @s run particle minecraft:entity_effect{color:[1.0,0.0,0.0,1.0]} ~ ~1 ~ 0.3 0.3 0.3 0 20