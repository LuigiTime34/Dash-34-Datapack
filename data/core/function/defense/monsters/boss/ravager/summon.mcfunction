title @a times 10 60 20
title @a title {"text":"Boss has spawned!", "font":"retitled_titles:regular", "color":"#27FF06"}
playsound entity.wither.spawn master @a ~ ~ ~ 1000000000000000000 0.7
bossbar set core:defense.boss players @a
bossbar set core:defense.boss visible true
bossbar set core:defense.boss name {"selector":"@n[tag=defense.boss]"}
bossbar set core:defense.boss max 400
bossbar set core:defense.boss value 400
execute positioned 4 -59 146 run summon ravager ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:540, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-ravager", \
    "Entity-Dummy","defense.boss"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:400 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:100 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:200 \
    }], \
    PersistenceRequired:1b, \
}
# Illusioner
# Passengers:[{ \
#         id:"minecraft:illusioner", \
#         CustomNameVisible:0b, \
#         Health:400, \
#         NoAI:1b, \
#         Rotation:[90f, \
#         0.0f], \
#         Tags:["defense-illusioner", \
#         "Entity-Dummy"], \
#         Team:defense_enemies, \
#         attributes:[{ \
#             id:"max_health", \
#             base:400 \
#         }, \
#         { \
#             id:"minecraft:attack_damage", \
#             base:0 \
#         }, \
#         { \
#             id:"minecraft:attack_knockback", \
#             base:200 \
#         }], \
#         PersistenceRequired:1b, \
#     }] \
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-ravager] defense.abilities 150
execute as @a[advancements={core:defense/mobs/ravager=false}] run advancement grant @s only core:defense/mobs/ravager