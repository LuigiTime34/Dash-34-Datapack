execute store result score @s defense.abilities run random value 1..4
execute if entity @e[tag=defense-monster,distance=..0.9] positioned as @n[tag=defense-monster,distance=..0.9] positioned ^ ^ ^-1 run return run function core:defense/monsters/boss/ravager/summon_mob
execute if score @s defense.abilities matches 1 run \
summon husk ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:50, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-husk", \
    "Entity-Dummy","defense.illusioner_summon"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:50 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:20 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:100 \
    }, \
    { \
        id:"minecraft:armor", \
        base:0 \
    }], \
    PersistenceRequired:1b \
}


execute if score @s defense.abilities matches 2 run \
summon stray ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:50, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-stray", \
    "Entity-Dummy","defense.illusioner_summon"], \
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
        base:120 \
    }], \
    PersistenceRequired:1b \
}


execute if score @s defense.abilities matches 3 run \
summon zombified_piglin ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:25, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-zombified_piglin", \
    "Entity-Dummy","defense.illusioner_summon"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:25 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:90 \
    }, \
    { \
        id:"minecraft:armor", \
        base:0 \
    }], \
    PersistenceRequired:1b \
}


execute if score @s defense.abilities matches 4 run \
summon chicken ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:40, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-chicken", \
    "Entity-Dummy","defense.illusioner_summon"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:40 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:60 \
    }], \
    Passengers:[{ \
        id:"minecraft:zombie", \
        CustomNameVisible:0b, \
        Health:25, \
        NoAI:1b, \
        Rotation:[90f, \
        0.0f], \
        IsBaby:1b, \
        Tags:["defense-baby_zombie", \
        "Entity-Dummy"], \
        Team:defense_enemies, \
        attributes:[{ \
            id:"max_health", \
            base:25 \
        }, \
        { \
            id:"minecraft:attack_damage", \
            base:0 \
        }, \
        { \
            id:"minecraft:armor", \
            base:0 \
        }, \
        { \
            id:"minecraft:attack_knockback", \
            base:200 \
        }], \
        PersistenceRequired:1b \
    }], \
    PersistenceRequired:1b \
}

data modify entity @n[tag=defense.illusioner_summon] Rotation set from entity @s Rotation
execute at @n[tag=defense.illusioner_summon] run particle minecraft:soul_fire_flame ~ ~ ~ 0.2 0.6 0.2 0.5 100
tag @n[tag=defense.illusioner_summon] remove defense-illusioner_summon
scoreboard players add @s defense.abilities 300
playsound minecraft:entity.illusioner.cast_spell master @a ~ ~ ~ 10 1