execute store result score @s defense.towers run data get entity @s data.range 10
# Add 3.5 to the range, to encounter for the towers width.
scoreboard players operation @s defense.towers += $35 defense.towers
execute store result storage core:tower_range range int 0.1 run scoreboard players get @s defense.towers
function core:defense/towers/archer/show_particle with storage core:tower_range