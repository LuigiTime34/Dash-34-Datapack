title @a times 10 60 20
title @a title {"text":"Boss has spawned!", "font":"retitled_titles:regular", "color":"#27FF06"}
playsound entity.wither.spawn master @a ~ ~ ~ 1000000000000000000 0.7
bossbar set core:defense.boss players @a
bossbar set core:defense.boss visible true
bossbar set core:defense.boss name {"selector":"@n[tag=defense.boss]"}
bossbar set core:defense.boss max 300
bossbar set core:defense.boss value 300
execute positioned 4 -59 146 run summon warden ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:300, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-warden", \
    "Entity-Dummy","defense.boss","defense.new_mob"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:300 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:20 \
    }, \
    { \
        id:"minecraft:armor", \
        base:15 \
    }], \
    PersistenceRequired:1b \
}
execute as @a[advancements={core:defense/mobs/warden=false}] run advancement grant @s only core:defense/mobs/warden
execute positioned 4 -59 146 run scoreboard players set @n[tag=defense-warden] defense.abilities 200