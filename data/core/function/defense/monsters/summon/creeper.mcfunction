execute positioned 4 -59 146 run summon creeper ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:40, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-creeper", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:40 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:10 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:100 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/creeper=false}] run advancement grant @s only core:defense/mobs/creeper
execute as @a[advancements={core:defense/mobs/category_agressive=false}] run advancement grant @s only core:defense/mobs/category_agressive