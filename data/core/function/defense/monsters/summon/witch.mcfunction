execute positioned 4 -59 146 run summon witch ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:40, \
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
        base:40 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:70 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/witch=false}] run advancement grant @s only core:defense/mobs/witch
execute as @a[advancements={core:defense/mobs/category_healer=false}] run advancement grant @s only core:defense/mobs/category_healer
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-witch] defense.abilities 40