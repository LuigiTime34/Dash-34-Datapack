summon endermite ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:20, \
    NoAI:1b, \
    Tags:["defense-monster", \
    "cw_hp_disp", \
    "defense-endermite", \
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
        base:340 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/endermite=false}] run advancement grant @s only core:defense/mobs/endermite
scoreboard players add $mobs_left defense.wave 1