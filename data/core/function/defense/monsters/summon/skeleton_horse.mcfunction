execute positioned 4 -59 146 run summon skeleton_horse ~ ~ ~ {CustomNameVisible:1b,Health:60,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","cw_hp_disp","defense-skeleton_horse","Entity-Dummy"],Team:defense_enemies,attributes:[{id:"max_health",base:60},{id:"minecraft:attack_damage",base:0},{id:"minecraft:attack_knockback",base:180}],Passengers:[{id:"minecraft:skeleton",CustomNameVisible:0b,Health:20,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-skeleton_rider","Entity-Dummy"],Team:defense_enemies,HandItems:[{id:bow},{}],ArmorItems:[{id:iron_boots},{id:iron_leggings},{id:iron_chestplate},{id:iron_helmet}],attributes:[{id:"max_health",base:20},{id:"minecraft:attack_damage",base:0},{id:"minecraft:armor",base:0},{id:"minecraft:attack_knockback",base:80}],PersistenceRequired:1b}],PersistenceRequired:1b}
execute as @a[advancements={core:defense/mobs/skeleton_horseman=false}] run advancement grant @s only core:defense/mobs/skeleton_horseman