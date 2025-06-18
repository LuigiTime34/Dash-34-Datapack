summon zombie ~ ~ ~ { \
    CustomNameVisible:1b, \
    Health:75, \
    NoAI:1b, \
    Rotation:[90f, \
    0.0f], \
    Tags:["defense-monster", \
    "defense.health_display", \
    "defense-armor_zombie", \
    "Entity-Dummy","defense.new_mob","defense.new_giant_reinforcement"], \
    Team:defense_enemies, \
    attributes:[{ \
        id:"max_health", \
        base:75 \
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
        id:"minecraft:scale", \
        base:1.5 \
    }], \
    PersistenceRequired:1b, ArmorItems: [{components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:flow"}}, count: 1, id: "minecraft:iron_boots"}, {}, {components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:vex"}}, count: 1, id: "minecraft:iron_chestplate"}, {components: {"minecraft:trim": {material: "minecraft:diamond", pattern: "minecraft:ward"}}, count: 1, id: "minecraft:iron_helmet"}]\
}

function core:defense/monsters/boss/giant/initialize_scores