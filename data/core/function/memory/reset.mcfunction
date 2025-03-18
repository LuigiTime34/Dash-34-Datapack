playsound block.bell.resonate master @a ~ ~ ~ 1000000000000000000 2
fill -6 -59 -34 6 -59 -35 air
clear @p[gamemode=adventure]
execute if score #memory memory matches 2 run function core:memory/random/reset_items {"z":"36"}
execute if score #memory memory matches 3 run function core:memory/random/reset_items {"z":"35"}
execute if score #memory memory matches 4 run function core:memory/random/reset_items {"z":"34"}
execute if score #memory memory matches 5 run function core:memory/random/reset_items {"z":"33"}
execute if score #memory memory matches 6 run function core:memory/random/reset_items {"z":"32"}
execute if score #memory memory matches 7 run function core:memory/random/reset_items {"z":"31"}
execute if score #memory memory matches 8 run function core:memory/random/reset_items {"z":"30"}
execute if score #memory memory matches 9 run function core:memory/random/reset_items {"z":"29"}
execute if score #memory memory matches 10 run function core:memory/random/reset_items {"z":"28"}
execute if score #memory memory matches 11 run function core:memory/random/reset_items {"z":"27"}
execute unless block -2 -59 -37 warped_button run setblock -2 -59 -37 minecraft:warped_button[facing=south]
execute unless block 0 -59 -37 warped_button run setblock 0 -59 -37 minecraft:warped_button[facing=south]
execute unless block 2 -59 -37 warped_button run setblock 2 -59 -37 minecraft:warped_button[facing=south]

# summon text_display 0 -58 -36.8 {Tags:["memory-button"],Rotation:[0F,0F],text:'{"bold":true,"color":"black","text":"at Blocks"}',alignment:"center",background:0}
# summon text_display 2 -58 -36.8 {Tags:["memory-button"],Rotation:[0F,0F],text:'{"bold":true,"color":"black","text":"Reset"}',alignment:"center",background:0}
# summon text_display -2 -58 -36.8 {Tags:["memory-button"],Rotation:[0F,0F],text:'{"bold":true,"color":"black","text":"Submit Answer"}',alignment:"center",background:0}
# summon text_display 0 -57.7 -36.8 {Tags:["memory-button"],Rotation:[0F,0F],text:'{"bold":true,"color":"black","text":"Look back"}',alignment:"center",background:0}

execute as @e[tag=memory-button,nbt=!{transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [0.0f, 0.0f, 0.0f]}}] run data merge entity @s {interpolation_duration:20,start_interpolation:0,transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [0.0f, 0.0f, 0.0f]}}