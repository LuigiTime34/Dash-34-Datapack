execute positioned 4 -59 146 run summon spider ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:25, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-spider", \
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
        id:"minecraft:attack_knockback", \
        base:120 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/spider=false}] run advancement grant @s only core:defense/mobs/spider
execute as @a[advancements={core:defense/mobs/category_small=false}] run advancement grant @s only core:defense/mobs/category_small