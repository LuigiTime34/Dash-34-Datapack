# Updates marker position to linked enderman

# Find the linked enderman
execute as @e[tag=defense-monster,tag=defense-enderman] if score @s defense.entity_id = @e[tag=defense.enderman-marker,limit=1,sort=nearest] defense.marker_id run tag @s add target_enderman

# Teleport to linked enderman
execute at @e[tag=target_enderman,limit=1] run tp @s ~ ~ ~

# Remove the target tag
tag @e[tag=target_enderman] remove target_enderman