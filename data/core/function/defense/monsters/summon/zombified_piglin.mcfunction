execute positioned 4 -59 146 run summon zombified_piglin ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:35, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-zombified_piglin", \
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
        id:"minecraft:attack_knockback", \
        base:230 \
    }, \
    { \
        id:"minecraft:armor", \
        base:0 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/zombified_piglin=false}] run advancement grant @s only core:defense/mobs/zombified_piglin
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-zombified_piglin] defense.distance 0