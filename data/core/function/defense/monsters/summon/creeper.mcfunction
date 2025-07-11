execute positioned 4 -59 146 run summon creeper ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:75, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-creeper", \
    "Entity-Dummy", \
    "defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:75 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:10 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:24 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/creeper=false}] run advancement grant @s only core:defense/mobs/creeper
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-creeper] defense.distance 0