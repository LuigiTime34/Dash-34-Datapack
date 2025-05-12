execute if entity @e[tag=defense-monster,distance=..0.9] positioned as @n[tag=defense-monster,distance=..0.9] positioned ^ ^ ^-1 run return run function core:defense/monsters/boss/ravager/summon_decoys
summon illusioner ~ ~ ~ {\
    CustomNameVisible:1b, \
    CustomName:'{"text": "Illusioner Decoy"}', \
    Health:10, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-illusioner_decoy", \
    "defense-monster",\
    "cw_hp_disp",\
    "defense.illusioner_decoy_summon",\
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:10 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:90 \
    }], \
    PersistenceRequired:1b, \
}
scoreboard players add $mobs_left defense.wave 1
data modify entity @n[tag=defense.illusioner_decoy_summon] Rotation set from entity @s Rotation
execute at @n[tag=defense.illusioner_decoy_summon] run particle minecraft:electric_spark ~ ~ ~ 0.2 0.6 0.2 2 100
tag @n[tag=defense.illusioner_decoy_summon] remove defense-illusioner_decoy_summon
playsound minecraft:entity.illusioner.prepare_mirror master @a ~ ~ ~ 10 1