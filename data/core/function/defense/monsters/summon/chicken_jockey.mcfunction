execute positioned 4 -59 146 run summon chicken ~ ~ ~ {CustomNameVisible:1b,Health:40,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","cw_hp_disp","defense-chicken","Entity-Dummy"],Team:defense_enemies,attributes:[{id:"max_health",base:40},{id:"minecraft:attack_damage",base:0},{id:"minecraft:attack_knockback",base:60}],Passengers:[{id:"minecraft:zombie",CustomNameVisible:0b,Health:25,NoAI:1b,Rotation:[90f,0.0f],IsBaby:1b,Tags:["defense-baby_zombie","Entity-Dummy"],Team:defense_enemies,attributes:[{id:"max_health",base:25},{id:"minecraft:attack_damage",base:0},{id:"minecraft:armor",base:0},{id:"minecraft:attack_knockback",base:200}],PersistenceRequired:1b}],PersistenceRequired:1b}
execute as @a[advancements={core:defense/mobs/chicken_jockey=false}] run advancement grant @s only core:defense/mobs/chicken_jockey
execute positioned 4 -59 146 run playsound minecraft:sound.custom.chicken_jockey master @a ~ ~ ~ 10000000000000