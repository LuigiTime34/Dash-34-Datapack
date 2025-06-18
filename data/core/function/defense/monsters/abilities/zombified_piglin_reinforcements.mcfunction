execute unless predicate {"condition": "minecraft:random_chance","chance": 0.75} run return fail

playsound minecraft:entity.zombified_piglin.angry master @a ~ ~ ~ 1.7
tag @s add defense-reinforcement_piglin
summon zombified_piglin ~ ~ ~ {CustomNameVisible:1b,Health:35,NoAI:1b,Rotation:[90f,0.0f],Tags:["defense-monster","defense.health_display","defense-zombified_piglin","Entity-Dummy","defense-new_piglin","defense.new_mob"],Team:defense_enemies,attributes:[{id:"max_health",base:35},{id:"minecraft:attack_damage",base:0},{id:"minecraft:attack_knockback",base:23},{id:"minecraft:armor",base:0}],PersistenceRequired:1b}
execute as @n[tag=defense-new_piglin] run data modify entity @s Health set from entity @n[tag=defense-reinforcement_piglin] Health
execute as @n[tag=defense-new_piglin] run data modify entity @s Rotation set from entity @n[tag=defense-reinforcement_piglin] Rotation
execute as @n[tag=defense-new_piglin] store result score @s defense.distance run scoreboard players get @n[tag=defense-reinforcement_piglin] defense.distance
execute as @n[tag=defense-new_piglin] at @s run function core:defense/monsters/abilities/zombified_piglin_reinforcements_kb_loop
tag @n[tag=defense-new_piglin] remove defense-new_piglin
tag @s remove defense-reinforcement_piglin
scoreboard players add $mobs_left defense.wave 1