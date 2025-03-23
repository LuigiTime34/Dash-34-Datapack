tp @n[tag=current_checkpoint]
playsound block.respawn_anchor.deplete master @a ~ ~ ~ 1000000000
clear @s minecraft:wind_charge
kill @e[type=minecraft:wind_charge]
tag @s remove has-wind-charge
scoreboard players add $deaths parkour 1
function core:parkour/blocks/gravity_normal
execute unless data entity @s {Fire:0} run summon potion ~ ~ ~ {Item:{id:"minecraft:splash_potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}