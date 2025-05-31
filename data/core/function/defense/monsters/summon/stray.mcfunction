execute positioned 4 -59 146 run summon stray ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:60, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-stray", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:60 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:280 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/stray=false}] run advancement grant @s only core:defense/mobs/stray