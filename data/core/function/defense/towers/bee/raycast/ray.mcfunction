#Check if an entity was detected.

execute if score #hit vdvcasttemp matches 0 positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!vdvray,dx=0,sort=nearest,tag=defense-monster,tag=!defense-baby_zombie,tag=!defense-chicken,tag=!defense-silverfish,tag=!defense-endermite,tag=!defense-spider] run function core:defense/towers/bee/raycast/check_hit_entity

#Run a function if a block was successfully detected.

execute unless block ~ ~ ~ #core:blocks run function core:defense/towers/bee/raycast/hit_block
scoreboard players add #distance vdvcasttemp 1

#Advance forward and run the ray again if no entity and/or block was found.

execute if score #hit vdvcasttemp matches 0 if score #distance vdvcasttemp matches ..600 positioned ^ ^ ^0.1 run function core:defense/towers/bee/raycast/ray