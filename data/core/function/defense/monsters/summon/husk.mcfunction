execute positioned 4 -59 146 run summon husk ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:50, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-husk", \
    "Entity-Dummy"], \
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
execute as @a[advancements={core:defense/mobs/husk=false}] run advancement grant @s only core:defense/mobs/husk