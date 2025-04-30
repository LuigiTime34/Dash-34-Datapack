execute as @s[tag=parkour-checkpoint] at @s run function core:parkour/first_checkpoint
tag @e[tag=parkour-checkpoint] remove current_checkpoint
tag @n[tag=parkour-checkpoint] add current_checkpoint
# particle minecraft:totem_of_undying ~ ~1 ~ 0.4 2 0.4 0.1 150
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 10000000 0.75
summon firework_rocket ~ ~-0.5 ~ {Life:5,LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,colors:[I;2752311],fade_colors:[I;15204170]}]}}}}
setblock ~ ~ ~ air
execute if block ~ ~-2 ~ black_wool run tag @s add parkour.entered_darkness
execute if block ~ ~-2 ~ black_wool run setblock -101 -34 45 redstone_block
execute at @s if block ~ ~-2 ~ magenta_wool run tag @s remove parkour.entered_darkness
effect clear @s speed
effect clear @s jump_boost
clear @s wind_charge
execute as @s[tag=discovered-gravity] run function core:parkour/blocks/gravity_normal