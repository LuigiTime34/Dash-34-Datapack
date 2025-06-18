execute positioned 4 -59 146 run summon creeper ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:80, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-charged_creeper", \
    "Entity-Dummy", \
    "defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:80 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:35 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:23 \
    }], \
    PersistenceRequired:1b, \
    powered:1b, \
    Passengers:[{ \
        id:marker, \
        Tags:["defense.creeper-death"] \
    }] \
}
execute as @a[advancements={core:defense/mobs/charged_creeper=false}] run advancement grant @s only core:defense/mobs/charged_creeper
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-charged_creeper] defense.distance 0