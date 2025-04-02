# Rotate towards the tower selected to be rammed, while keeping the x rotation level.
execute if score $ravager_idx defense.boss_animation matches 19 run function core:defense/monsters/boss/ravager/disable_tower/rotate_to_tower
# Ram into the nearest tower (disabling it)
execute if score $ravager_idx defense.boss_animation matches 10 run function core:defense/monsters/boss/ravager/disable_tower/ram
# Back back out
execute if score $ravager_idx defense.boss_animation matches 6 at @s run tp @s ^ ^ ^-3
# Rotate back
execute if score $ravager_idx defense.boss_animation matches 2 run function core:defense/monsters/boss/ravager/disable_tower/rotate_back with storage core:ravager_rotation

# Animation ended. (scoreboard timer stoped)