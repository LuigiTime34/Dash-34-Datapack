execute positioned 4 -59 146 run summon zoglin ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:150, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-zoglin", \
    "Entity-Dummy", \
    "defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:150 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:40 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:25 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/zoglin=false}] run advancement grant @s only core:defense/mobs/zoglin
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-zoglin] defense.distance 0