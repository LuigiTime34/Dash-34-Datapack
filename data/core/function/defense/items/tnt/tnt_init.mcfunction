scoreboard players set @s defense.items 80
execute unless entity @n[tag=defense.boulder-marker,distance=..1] run return run tag @s add defense.tnt_enemies
setblock ~ ~-1 ~ green_concrete_powder