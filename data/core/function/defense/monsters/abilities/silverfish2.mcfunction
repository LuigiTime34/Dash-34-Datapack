execute if entity @s[tag=defense-monster] run return run scoreboard players remove @s defense.abilities 40
tp @s ~ ~1 ~
tag @s add defense-monster
data modify entity @s Invulnerable set value 0b
attribute @s attack_knockback base set 220
data modify entity @s HurtTime set value 10
execute store result score @s defense.damage run data get entity @s Health 10
scoreboard players operation @s defense.damage += $silverfish defense.damage
execute store result storage core:defense.silverfish_health health float 0.1 run scoreboard players get @s defense.damage
data modify entity @s Health set from storage core:defense.silverfish_health health
data modify entity @s HurtTime set value 10