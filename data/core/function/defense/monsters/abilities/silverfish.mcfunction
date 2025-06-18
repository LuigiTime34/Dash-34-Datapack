execute if data entity @s {Health:30.0f} run return run scoreboard players set @s defense.abilities 100
tp @s ~ ~-1 ~
tag @s remove defense-monster
data modify entity @s Invulnerable set value 1b
scoreboard players set @s defense.speed 0
scoreboard players set @s defense.abilities 100