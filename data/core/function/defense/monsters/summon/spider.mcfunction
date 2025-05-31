execute positioned 4 -59 146 run summon spider ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:20, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-spider", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:20 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:260 \
    }], \
    PersistenceRequired:1b, \
    Passengers:[ \ 
        {id:skeleton, \
        CustomNameVisible:1b, \
        Health:15, \
        NoAI:1b, \
        Rotation:[90f, \
        0.0f], \
        Tags:["defense-monster", \
        "cw_hp_disp", \
        "defense-skeleton", \
        "Entity-Dummy"], \
        Team:defense_enemies, \
        attributes:[{ \
            id:"max_health", \
            base:15 \
        }, \
        { \
            id:"minecraft:attack_damage", \
            base:0 \
        }, \
        { \
            id:"minecraft:attack_knockback", \
            base:-4920 \
        }], \
        PersistenceRequired:1b, \
        ArmorItems:[{id:"minecraft:iron_boots"},{id:"minecraft:iron_leggings"},{id:"minecraft:iron_chestplate"},{id:"minecraft:iron_helmet"}] \
        }]\
}
execute as @a[advancements={core:defense/mobs/spider=false}] run advancement grant @s only core:defense/mobs/spider

scoreboard players add $mobs_left defense.wave 1