execute positioned 4 -59 146 run summon silverfish ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:30, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-silverfish", \
    "Entity-Dummy", \
    "defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:30 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:32 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/silverfish=false}] run advancement grant @s only core:defense/mobs/silverfish
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-silverfish] defense.abilities 100
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-bogged] defense.distance 0