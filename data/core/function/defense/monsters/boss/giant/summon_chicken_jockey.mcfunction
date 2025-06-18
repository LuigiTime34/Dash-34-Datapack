playsound minecraft:sound.custom.chicken_jockey master @a ~ ~ ~ 10000000000000 0.5

tag @s add defense-reinforcement_chicken
summon chicken ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:50, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-big_chicken", \
    "Entity-Dummy","defense.new_mob","defense.new_giant_reinforcement"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:50 \
    }, \
    { \
        id:"minecraft:attack_damage", \
        base:0 \
    }, \
    { \
        id:"minecraft:attack_knockback", \
        base:18 \
    }, \
    { \
        id:"minecraft:scale", \
        base:2 \
    }], \
    Passengers:[{ \
        id:"minecraft:zombie", \
        CustomNameVisible:0b, \
        Health:35, \
        NoAI:1b, \
        Rotation:[90f, \
        0.0f], \
        IsBaby:0b, \
        Tags:["defense-big_jockey_zombie", \
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
            id:"minecraft:armor", \
            base:10 \
        }, \
        { \
            id:"minecraft:attack_knockback", \
            base:20 \
        }], \
        PersistenceRequired:1b, \
        ArmorItems:[{},{},{},{components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:ward"}}, count: 1, id: "minecraft:iron_helmet"}] \
    }], \
    PersistenceRequired:1b\
}

function core:defense/monsters/boss/giant/initialize_scores