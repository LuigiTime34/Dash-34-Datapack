execute positioned 4 -59 146 run summon enderman ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:70, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-enderman", \
    "Entity-Dummy"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:70 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:230 \
    }], \
    PersistenceRequired:1b \
}
execute positioned 4 -59 146 run summon marker ~ ~ ~ {Tags:["defense.enderman-marker"]}
execute as @a[advancements={core:defense/mobs/enderman=false}] run advancement grant @s only core:defense/mobs/enderman
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-enderman] defense.abilities 100