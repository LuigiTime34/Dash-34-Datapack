title @a times 10 60 20
title @a title {"text":"Boss has spawned!", "font":"retitled_titles:regular", "color":"#27FF06"}
playsound entity.wither.spawn master @a ~ ~ ~ 1000000000000000000 0.7
execute positioned 4 -59 146 run summon ravager ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:540, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-ravager", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:400 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:100 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:125 \
    }], \
    PersistenceRequired:1b, \
    Passengers:[{ \
        id:"minecraft:illusioner", \
        CustomNameVisible:0b, \
        Health:400, \
        NoAI:1b, \
        Rotation:[90f, \
        0.0f], \
        Tags:["defense-illusioner", \
        "Entity-Dummy"], \
        Team:defense_enemies, \
        attributes:[{ \
            id:"max_health", \
            base:400 \
        }, \
        { \
            id:"minecraft:attack_damage", \
            base:0 \
        }, \
        { \
            id:"minecraft:attack_knockback", \
            base:90 \
        }], \
        PersistenceRequired:1b, \
    }] \
}

execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-ravager] defense.abilities 150
execute as @a[advancements={core:defense/mobs/ravager=false}] run advancement grant @s only core:defense/mobs/ravager