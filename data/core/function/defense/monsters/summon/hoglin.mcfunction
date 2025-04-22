execute positioned 4 -59 146 run summon hoglin ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:120, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-hoglin", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:120 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:40 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:110 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/hoglin=false}] run advancement grant @s only core:defense/mobs/hoglin