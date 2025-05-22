execute store result storage core:panda_damage damage int 1 run scoreboard players get @s defense.panda_boo_damage
execute store result storage core:panda_damage range int 1 run scoreboard players get @s defense.panda_bomb_range
execute as @n[tag=defense.panda_landing] at @s run function core:defense/towers/panda/deal_damage_bomb with storage core:panda_damage
kill @s