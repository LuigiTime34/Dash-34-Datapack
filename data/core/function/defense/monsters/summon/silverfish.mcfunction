execute positioned 4 -59 146 run summon silverfish ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:20, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-silverfish", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:20 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:320 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/silverfish=false}] run advancement grant @s only core:defense/mobs/silverfish
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-silverfish] defense.abilities 100