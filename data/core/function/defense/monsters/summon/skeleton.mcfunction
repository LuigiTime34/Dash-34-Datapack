execute positioned 4 -59 146 run summon skeleton ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:25, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-skeleton", \
    "Entity-Dummy", \
    "defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:25 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:22 \
    }], \
    PersistenceRequired:1b \
    ,ArmorItems:[{id:"minecraft:iron_boots"},{id:"minecraft:iron_leggings"},{id:"minecraft:iron_chestplate"},{id:"minecraft:iron_helmet"}] \
}
execute as @a[advancements={core:defense/mobs/skeleton=false}] run advancement grant @s only core:defense/mobs/skeleton
# execute positioned 4 -59 146 run data modify entity @n[tag=defense-skeleton] ArmorItems set value [{id:"minecraft:iron_boots"},{id:"minecraft:iron_leggings"},{id:"minecraft:iron_chestplate"},{id:"minecraft:iron_helmet"}]
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-skeleton] defense.distance 0