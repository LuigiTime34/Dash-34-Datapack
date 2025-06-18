execute positioned 4 -59 146 run summon chicken ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:50, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-chicken", \
    "Entity-Dummy", \
    "defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:50 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:20 \
    }], \
    Passengers:[{ \
        id:"minecraft:zombie", \
        CustomNameVisible:0b, \
        Health:35, \
        NoAI:1b, \
        Rotation:[90f, \
        0.0f], \
        IsBaby:1b, \
        Tags:["defense-baby_zombie", \
        "Entity-Dummy"], \
        Team:defense_enemies, \
        attributes:[{ \
            id:"max_health", \
            base:35 \
        }, \
        { \
            id:"minecraft:attack_damage", \
            base:0 \
        }, \
        { \
            id:"minecraft:armor", \
            base:0 \
        }, \
        { \
            id:"minecraft:attack_knockback", \
            base:34 \
        }], \
        PersistenceRequired:1b \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/chicken_jockey=false}] run advancement grant @s only core:defense/mobs/chicken_jockey
execute positioned 4 -59 146 run playsound minecraft:sound.custom.chicken_jockey master @a ~ ~ ~ 10000000000000
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-chicken] defense.distance 0