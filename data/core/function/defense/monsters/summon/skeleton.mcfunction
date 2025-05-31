execute positioned 4 -59 146 run summon skeleton ~ ~ ~ { \
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
        base:220 \
    }], \
    PersistenceRequired:1b \
    ,ArmorItems:[{id:"minecraft:iron_boots"},{id:"minecraft:iron_leggings"},{id:"minecraft:iron_chestplate"},{id:"minecraft:iron_helmet"}] \
}
execute as @a[advancements={core:defense/mobs/skeleton=false}] run advancement grant @s only core:defense/mobs/skeleton
# execute positioned 4 -59 146 run data modify entity @n[tag=defense-skeleton] ArmorItems set value [{id:"minecraft:iron_boots"},{id:"minecraft:iron_leggings"},{id:"minecraft:iron_chestplate"},{id:"minecraft:iron_helmet"}]