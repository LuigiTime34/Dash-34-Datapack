execute positioned 4 -59 146 run summon breeze ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:65, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-breeze", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:65 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:240 \
    }, \
    { \
        id:"minecraft:armor", \
        base:20 \
    }] \
}
execute as @a[advancements={core:defense/mobs/breeze=false}] run advancement grant @s only core:defense/mobs/breeze