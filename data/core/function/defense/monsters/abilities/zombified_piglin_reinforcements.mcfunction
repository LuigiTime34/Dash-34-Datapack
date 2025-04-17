execute unless predicate {"condition": "minecraft:random_chance","chance": 0.75} run return fail
tag @s add defense-reinforcement_piglin
summon zombified_piglin ^ ^ ^-1 {CustomNameVisible:1b,Health:30,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","cw_hp_disp","defense-zombified_piglin","Entity-Dummy","defense-new_piglin"],Team:defense_enemies,attributes:[{id:"max_health",base:30},{id:"minecraft:attack_damage",base:0},{id:"minecraft:attack_knockback",base:90},{id:"minecraft:armor",base:0}],PersistenceRequired:1b}
execute as @n[tag=defense-new_piglin] run data modify entity @s Health set from entity @n[tag=defense-reinforcement_piglin] Health
execute as @n[tag=defense-new_piglin] run data modify entity @s Rotation set from entity @n[tag=defense-reinforcement_piglin] Rotation
tag @n[tag=defense-new_piglin] remove defense-new_piglin
tag @s remove defense-reinforcement_piglin