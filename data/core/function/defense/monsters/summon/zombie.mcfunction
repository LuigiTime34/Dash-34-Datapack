execute positioned 4 -59 146 run summon zombie ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:5, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-zombie", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:5 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:40 \
    }, \
    { \
        id:"minecraft:armor", \
        base:0 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/zombie=false}] run advancement grant @s only core:defense/mobs/zombie
execute as @a[advancements={core:defense/mobs/category_basic=false}] run advancement grant @s only core:defense/mobs/category_basic