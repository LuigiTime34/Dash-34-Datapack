#Setting up the raycasting data.

tag @s add archerray
scoreboard players set #hit archercasttemp 0
scoreboard players set #distance archercasttemp 0
#Activating the raycast. This function will call itself until it is done.

function core:defense/towers/archer/raycast/ray

#Raycasting finished, removing tag from the raycaster.

tag @s remove archerray