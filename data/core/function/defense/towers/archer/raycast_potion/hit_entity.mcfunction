scoreboard players set #hit archercasttemp 1

execute store result score $witch_potion defense.towers run random value 1..100
# Slowness Potion
execute if score $witch_potion defense.towers matches 1..30 run summon area_effect_cloud ~ ~ ~ {Particle:{type:"entity_effect","color":9022941},Radius:3f,Duration:100,potion_contents:{custom_color:9022941,custom_effects:[{id:"minecraft:weakness",amplifier:0,duration:100,show_particles:1b}]}}
# Weakness potion
execute if score $witch_potion defense.towers matches 31..70 run summon area_effect_cloud ~ ~ ~ {Particle:{type:"entity_effect","color":4672583},Radius:3f,Duration:100,potion_contents:{custom_color:4672583,custom_effects:[{id:"minecraft:slowness",amplifier:0,duration:100,show_particles:1b}]}}
$damage @s $(damage) magic by @p