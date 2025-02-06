execute store result storage core:witch_reduced_damage reduced_damage int 0.2 run scoreboard players get @s defense.damage
execute store result score $witch.recuded_damage defense.damage run data get storage core:witch_reduced_damage reduced_damage 1
scoreboard players operation @s defense.damage -= $witch.recuded_damage defense.damage