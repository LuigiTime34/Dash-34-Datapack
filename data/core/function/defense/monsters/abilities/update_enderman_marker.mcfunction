# Updates marker position to linked enderman
# using a tag to be more consistent
tag @s add this
# Find the linked enderman \ kill marker if none exists
execute as @e[tag=defense-monster,tag=defense-enderman] if score @s defense.entity_id = @e[type=marker,tag=this,limit=1] defense.marker_id run tag @s add target_enderman
execute unless entity @e[tag=target_enderman,limit=1] run return run kill @s
# Find and return enderman if its too far
execute at @e[tag=target_enderman,limit=1] unless entity @s[distance=..7] run tp @e[tag=target_enderman,limit=1] @s
# Teleport to linked enderman
tp @s @e[tag=target_enderman,limit=1]

# Remove the target tag
tag @s remove this
tag @e[tag=target_enderman] remove target_enderman