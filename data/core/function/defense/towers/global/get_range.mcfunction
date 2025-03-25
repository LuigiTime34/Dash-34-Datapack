execute store result score @s defense.towers_range_particle run data get entity @s data.range 10
data modify storage core:tower_range particle_type set from entity @s data.particle_type
# Add 3.5 to the range, to encounter for the towers width.
scoreboard players operation @s defense.towers_range_particle += $35 defense.towers_range_particle
execute store result storage core:tower_range range int 0.1 run scoreboard players get @s defense.towers_range_particle
function core:defense/towers/global/show_particle with storage core:tower_range