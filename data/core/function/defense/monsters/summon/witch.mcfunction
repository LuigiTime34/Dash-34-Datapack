execute positioned 4 -59 146 run summon witch ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:50, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-witch", \
    "Entity-Dummy"], \
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
        base:210 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/witch=false}] run advancement grant @s only core:defense/mobs/witch
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-witch] defense.abilities 40
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-witch] defense.distance 0