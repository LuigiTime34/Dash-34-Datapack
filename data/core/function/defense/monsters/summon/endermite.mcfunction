summon endermite ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:30, \
    NoAI:1b, \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-endermite", \
    "Entity-Dummy","defense.new_endermite","defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:30 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:34 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/endermite=false}] run advancement grant @s only core:defense/mobs/endermite
scoreboard players add $mobs_left defense.wave 1