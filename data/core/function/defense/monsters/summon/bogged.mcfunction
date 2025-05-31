execute positioned 4 -59 146 run summon bogged ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:60, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-bogged", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:60 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:260 \
    }] \
}
execute as @a[advancements={core:defense/mobs/bogged=false}] run advancement grant @s only core:defense/mobs/bogged
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-bogged] defense.abilities 20