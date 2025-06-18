execute positioned 4 -59 146 run summon enderman ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:100, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-enderman", \
    "Entity-Dummy", \
    "defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:100 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:23 \
    }], \
    PersistenceRequired:1b \
}
execute positioned 4 -59 146 run summon marker ~ ~ ~ {Tags:["defense.enderman-marker", \
    "defense.new_mob"]}
execute as @a[advancements={core:defense/mobs/enderman=false}] run advancement grant @s only core:defense/mobs/enderman
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-enderman] defense.abilities 100
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-enderman] defense.distance 0