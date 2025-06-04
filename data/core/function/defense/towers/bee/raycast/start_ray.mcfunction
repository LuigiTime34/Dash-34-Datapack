#Setting up the raycasting data.

tag @s add vdvray
scoreboard players set #hit vdvcasttemp 0
scoreboard players set #distance vdvcasttemp 0

#Activating the raycast. This function will call itself until it is done.

function core:defense/towers/bee/raycast/ray

#Raycasting finished, removing tag from the raycaster.

tag @s remove vdvray
execute if score $bee-target defense.bee_tower matches 1 run tag @s add defense.found_target
scoreboard players set $bee-target defense.bee_tower 0