# Running custom per-step commands.
scoreboard players add #distance archercasttemp 1
particle minecraft:crit ~ ~ ~ .1 .1 .1 0 0 force
# Check if an entity was detected.
execute as @e[limit=1,dx=0,tag=!archerray,tag=defense-monster] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function core:defense/towers/archer/raycast/check_hit_entity
# Advance forward and run the ray again if no entity and/or block was found.
execute if score #hit archercasttemp matches 1.. run return fail
execute if score #distance archercasttemp matches 1000.. run return fail
#
execute positioned ^ ^ ^0.1 run function core:defense/towers/archer/raycast/ray