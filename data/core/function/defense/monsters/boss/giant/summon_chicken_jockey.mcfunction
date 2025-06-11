execute if entity @e[tag=defense-monster,distance=..0.9] positioned as @n[tag=defense-monster,distance=..0.9] positioned ^ ^ ^-1 run return run function core:defense/monsters/boss/giant/summon_chicken_jockey

tag @s add defense-reinforcement_chicken
summon chicken ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:50, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-big_chicken", \
    "Entity-Dummy","defense-new_chicken"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:50 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:180 \
    }, \
    { \
        id:"minecraft:scale", \
        base:2 \
    }], \
    Passengers:[{ \
        id:"minecraft:zombie", \
        CustomNameVisible:0b, \
        Health:35, \
        NoAI:1b, \
        Rotation:[90f, \
        0.0f], \
        IsBaby:0b, \
        Tags:["defense-big_jockey_zombie", \
        "Entity-Dummy"], \
        Team:defense_enemies, \
        attributes:[{ \
            id:"max_health", \
            base:20 \
        }, \
        { \
            id:"minecraft:attack_damage", \
            base:0 \
        }, \
        { \
            id:"minecraft:armor", \
            base:10 \
        }, \
        { \
            id:"minecraft:attack_knockback", \
            base:200 \
        }], \
        PersistenceRequired:1b, \
        ArmorItems:[{},{},{},{components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:ward"}}, count: 1, id: "minecraft:iron_helmet"}] \
    }], \
    PersistenceRequired:1b\
}

execute as @n[tag=defense-new_chicken] run data modify entity @s Health set from entity @n[tag=defense-reinforcement_chicken] Health
execute as @n[tag=defense-new_chicken] run data modify entity @s Rotation set from entity @n[tag=defense-reinforcement_chicken] Rotation
execute as @n[tag=defense-new_chicken] store result score @s defense.distance run scoreboard players get @n[tag=defense-reinforcement_chicken] defense.distance
execute at @n[tag=defense-new_chicken] run particle minecraft:soul_fire_flame ~ ~ ~ 0.2 0.6 0.2 0.5 75
tag @n[tag=defense-new_chicken] remove defense-new_chicken
tag @s remove defense-reinforcement_chicken
scoreboard players add $mobs_left defense.wave 1