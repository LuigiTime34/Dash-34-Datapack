#Running custom per-step commands.

particle minecraft:crit ~ ~ ~ .1 .1 .1 0 1 force

#Check if an entity was detected.

$execute if score #hit archercasttemp matches 0 positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!archerray,dx=0,sort=nearest] run function core:defense/towers/archer/raycast_lightning/check_hit_entity {"damage":"$(damage)"}
scoreboard players add #distance archercasttemp 1

#Advance forward and run the ray again if no entity and/or block was found.

$execute if score #hit archercasttemp matches 0 if score #distance archercasttemp matches ..10000000 positioned ^ ^ ^0.1 run function core:defense/towers/archer/raycast_lightning/ray {"damage":"$(damage)"}