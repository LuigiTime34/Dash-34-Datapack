execute positioned 4 -59 146 run summon zombie_villager ~ ~ ~ {CustomNameVisible:1b,Health:40,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","cw_hp_disp","defense-zombie_villager","Entity-Dummy"],Team:defense_enemies,attributes:[{id:"max_health",base:40},{id:"minecraft:attack_damage",base:0},{id:"minecraft:attack_knockback",base:50}]}
execute as @a[advancements={core:defense/mobs/zombie_villager=false}] run advancement grant @s only core:defense/mobs/zombie_villager