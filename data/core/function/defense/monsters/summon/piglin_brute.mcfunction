execute positioned 4 -59 146 run summon piglin_brute ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:100, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-piglin_brute", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:100 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:50 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:160 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/piglin_brute=false}] run advancement grant @s only core:defense/mobs/piglin_brute