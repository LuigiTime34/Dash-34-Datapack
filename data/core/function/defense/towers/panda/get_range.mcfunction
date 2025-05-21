execute store result score @s defense.towers_range_particle run data get entity @n[tag=panda-center-marker,tag=!defense.off] data.range 10
# Add 3.5 to the range, to encounter for the towers width.
scoreboard players operation @s defense.towers_range_particle += $35 defense.towers_range_particle
execute store result storage core:defense.panda_range range int 0.1 run scoreboard players get @s defense.towers_range_particle
function core:defense/towers/panda/rotate with storage core:defense.panda_range