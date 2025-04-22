execute positioned 4 -59 146 run summon skeleton ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:10, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-skeleton", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:10 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:80 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/skeleton=false}] run advancement grant @s only core:defense/mobs/skeleton