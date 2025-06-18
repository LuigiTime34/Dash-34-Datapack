title @a times 10 60 20
title @a title {"text":"Boss has spawned!", "font":"retitled_titles:regular", "color":"#27FF06"}
playsound entity.wither.spawn master @a ~ ~ ~ 1000000000000000000 0.7
bossbar set core:defense.boss players @a
bossbar set core:defense.boss visible true
bossbar set core:defense.boss name {"selector":"@n[tag=defense.boss]"}
bossbar set core:defense.boss max 220
bossbar set core:defense.boss value 220
execute positioned 4 -59 146 run summon iron_golem ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:250, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-iron_golem", \
    "Entity-Dummy","defense.boss","defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:220 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:22 \
    }, \
    { \
        id:"minecraft:armor", \
        base:10 \
    }, \
    { \
        id:"attack_damage", \
        base:0 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/iron_golem=false}] run advancement grant @s only core:defense/mobs/iron_golem
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-iron_golem] defense.distance 40000