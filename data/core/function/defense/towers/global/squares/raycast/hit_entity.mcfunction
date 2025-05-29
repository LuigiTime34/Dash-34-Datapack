#Mark the ray has having found an entity.

scoreboard players set #hit vdvcasttemp 1

#Running custom commands since the entity was found.

team join green @n[tag=defense.tower_square]
tag @n[tag=defense.tower_square] add defense.green
execute as @n[tag=defense.tower_square,tag=defense.green] at @s positioned ~ -58.5 ~ run function core:defense/towers/global/squares/translate_up with entity @p[gamemode=adventure] SelectedItem.components."minecraft:custom_data"
execute as @e[tag=defense.tower_square,tag=!defense.green] run data merge entity @s {Glowing:0b}