#Checks if an entity is found, and if so, runs the corresponding function.

execute if score #hit archercasttemp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,tag=defense-monster] positioned ~0.95 ~0.95 ~0.95 run function core:defense/towers/archer/raycast_potion/hit_entity