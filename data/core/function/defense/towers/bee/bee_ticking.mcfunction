# First, see if the bee has reached the end of its path
execute if block ~ -62 ~ black_wool on passengers run kill @s
execute if block ~ -62 ~ black_wool run return run kill @s
# See if theres any mobs left
execute if score $mobs_left defense.wave matches ..0 on passengers run kill @s
execute if score $mobs_left defense.wave matches ..0 run return run kill @s

# rotate @s facing entity @n[tag=defense-monster] eyes
function core:defense/towers/bee/get_speed
execute as @n[tag=defense.bee] run data modify entity @s Rotation set from entity @n[tag=defense.bee_display] Rotation

execute on passengers at @s positioned ~ -59 ~ if entity @n[tag=defense-monster,distance=..1.4] run rotate @s ~-180 ~
execute as @s[tag=!defense.queen-bee-display] positioned ~-0.5 ~ ~-0.5 if entity @n[tag=defense-monster,dx=0] run function core:defense/towers/bee/get_damage
execute as @s[tag=defense.queen-bee-display] positioned ~-0.5 ~-0.2 ~-0.5 if entity @n[tag=defense-monster,dx=0,dy=1] run function core:defense/towers/bee/get_damage
execute as @s[tag=defense.queen-bee_attacked] if score @s defense.bee_tower matches 1.. run scoreboard players remove @s defense.bee_tower 1
execute as @s[tag=defense.queen-bee_attacked] if score @s defense.bee_tower matches 1 run tag @s remove defense.queen-bee_attacked