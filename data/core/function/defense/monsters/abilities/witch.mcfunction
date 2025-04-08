execute as @e[tag=defense-monster,distance=..5,type=!#minecraft:undead] run effect give @s instant_health 1 0
execute as @e[tag=defense-monster,distance=..5,type=#minecraft:undead] run effect give @s instant_damage 1 0
execute as @e[tag=defense-monster,distance=..5] run data modify entity @s HurtTime set value 10
execute as @e[tag=defense-monster,distance=..5] at @s run particle minecraft:entity_effect{color:[1.0,0.0,0.0,1.0]} ~ ~1 ~ 0.3 0.3 0.3 0 20
playsound minecraft:entity.witch.drink master @a ~ ~ ~ 2
scoreboard players set @s defense.abilities 80