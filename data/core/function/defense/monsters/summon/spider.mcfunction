execute positioned 4 -59 146 run summon spider ~ ~ ~ {CustomNameVisible:1b,Health:30,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","cw_hp_disp","defense-spider","Entity-Dummy"],Team:defense_enemies,attributes:[{id:"max_health",base:30},{id:"minecraft:attack_damage",base:0},{id:"minecraft:attack_knockback",base:60}]}
execute as @a[advancements={core:defense/mobs/spider=false}] run advancement grant @s only core:defense/mobs/spider