execute if entity @e[tag=defense-monster,distance=..0.9] positioned as @n[tag=defense-monster,distance=..0.9] positioned ^ ^ ^-1 run return run function core:defense/monsters/boss/giant/summon_armored_zombie

tag @s add defense-reinforcement_zombie
summon zombie ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:100, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-armor_zombie", \
    "Entity-Dummy","defense-new_zombie"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:100 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:200 \
    }, \
    { \
        id:"minecraft:scale", \
        base:1.5 \
    }], \
    PersistenceRequired:1b, ArmorItems: [{components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:flow"}}, count: 1, id: "minecraft:iron_boots"}, {}, {components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:vex"}}, count: 1, id: "minecraft:iron_chestplate"}, {components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:ward"}}, count: 1, id: "minecraft:iron_helmet"}]\
}
execute as @n[tag=defense-new_zombie] run data modify entity @s Health set from entity @n[tag=defense-reinforcement_zombie] Health
execute as @n[tag=defense-new_zombie] run data modify entity @s Rotation set from entity @n[tag=defense-reinforcement_zombie] Rotation
execute as @n[tag=defense-new_zombie] store result score @s defense.distance run scoreboard players get @n[tag=defense-reinforcement_zombie] defense.distance
execute at @n[tag=defense-new_zombie] run particle minecraft:soul_fire_flame ~ ~ ~ 0.2 0.6 0.2 2 75
tag @n[tag=defense-new_zombie] remove defense-new_zombie
tag @s remove defense-reinforcement_zombie
scoreboard players add $mobs_left defense.wave 1