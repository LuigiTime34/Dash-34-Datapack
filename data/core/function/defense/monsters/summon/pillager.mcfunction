execute positioned 4 -59 146 run summon pillager ~ ~ ~ {CustomNameVisible:1b,Health:70,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","cw_hp_disp","defense-pillager","Entity-Dummy"],Team:defense_enemies,attributes:[{id:"max_health",base:70},{id:"minecraft:attack_damage",base:0},{id:"minecraft:attack_knockback",base:120}]}
execute as @a[advancements={core:defense/mobs/pillager=false}] run advancement grant @s only core:defense/mobs/pillager