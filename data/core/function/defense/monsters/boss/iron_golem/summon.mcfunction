title @a times 10 60 20
title @a title {"text":"Boss has spawned!","color":"red"}
playsound entity.wither.spawn master @a ~ ~ ~ 1000000000000000000 0.7
execute positioned 4 -59 146 run summon iron_golem ~ ~ ~ {CustomNameVisible:1b,Health:100,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","cw_hp_disp","defense-iron_golem","Entity-Dummy"],Team:defense_enemies,attributes:[{id:"max_health",base:100},{id:"minecraft:attack_knockback",base:80},{id:"minecraft:armor",base:10}]}
execute as @a[advancements={core:defense/mobs/iron_golem=false}] run advancement grant @s only core:defense/mobs/iron_golem