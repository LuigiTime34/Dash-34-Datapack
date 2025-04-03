scoreboard players set @s defense.abilities 300
# First, see if there is a tower close enough to "ram" into.
execute at @s unless entity @n[tag=defense.tower_marker,distance=..13] run return 0
# Get initial rotation (to set back later)
data modify storage core:ravager_rotation y_rotation set from entity @s Rotation[0]
data modify storage core:ravager_rotation x_rotation set from entity @s Rotation[1]
# Tag the closest tower to be the one selected to be rammed into.
execute at @s run tag @n[tag=defense.tower_marker] add defense.ravager_ram
# Add 20 ticks to the cooldown (since the animation takes that long)
scoreboard players add @s defense.abilities 20

# Begin animation
scoreboard players set $ravager_idx defense.boss_animation 20