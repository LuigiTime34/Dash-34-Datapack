execute if data entity @s {Health:20.0f} run return run scoreboard players set @s defense.abilities 75
tp @s ~ ~-1 ~
tag @s remove defense-monster
data modify entity @s Invulnerable set value 1b
attribute @s attack_knockback base set 0
effect give @s regeneration 3 255 false
scoreboard players set @s defense.abilities 200