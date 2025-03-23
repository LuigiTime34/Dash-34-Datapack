# particle ring
particle crit ~ ~ ~ ^ ^ ^1000000 0 0 normal
$particle crit ^ ^ ^$(range) ^ ^ ^1000000 0 0 normal
scoreboard players add @s defense.range_indicator 1

# get range again
execute store result score @s defense.towers run data get entity @s data.range 10
# Add 3.5 to the range, to encounter for the towers width.
scoreboard players operation @s defense.towers += $35 defense.towers
execute store result storage core:tower_range range int 0.1 run scoreboard players get @s defense.towers

execute if score @s defense.range_indicator matches ..8 rotated ~45 0 run function core:defense/towers/archer/show_particle with storage core:tower_range
execute if score @s defense.range_indicator matches 9.. run scoreboard players reset @s defense.range_indicator