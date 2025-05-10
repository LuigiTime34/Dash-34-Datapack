title @a times 10 60 20
title @a title {"text":"Boss has spawned!", "font":"retitled_titles:regular", "color":"#27FF06"}
playsound entity.wither.spawn master @a ~ ~ ~ 1000000000000000000 0.7
execute positioned 4 -59 146 run summon giant ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:400, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-giant", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:400 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:50 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:80 \
    }, \
    { \
        id:"minecraft:armor", \
        base:0 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/giant=false}] run advancement grant @s only core:defense/mobs/giant
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-giant] defense.abilities 240