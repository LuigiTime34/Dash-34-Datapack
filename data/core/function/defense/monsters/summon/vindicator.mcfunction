execute positioned 4 -59 146 run summon vindicator ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:80, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-vindicator", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:80 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:140 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/vindicator=false}] run advancement grant @s only core:defense/mobs/vindicator
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-vindicator] defense.abilities 50