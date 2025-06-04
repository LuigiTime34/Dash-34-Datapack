#Setting up the raycast data.

tag @s add vdvray
scoreboard players set #hit vdvcasttemp 0
scoreboard players set #distance vdvcasttemp 0

#Activating the raycast_short. This function will call itself until it is done.

function core:defense/towers/bee/raycast_short/ray

#raycast_shorting finished, removing tag from the raycast_shorter.

tag @s remove vdvray
execute if score $bee-target-short defense.bee_tower matches 1 run tag @s add defense.found_target
scoreboard players set $bee-target-short defense.bee_tower 0