fill -6 -60 -33 6 -58 -35 air
tp @p[gamemode=adventure] 0 -60 -31 180 0
tag @p[gamemode=adventure,tag=!memory-started] add memory-started

execute if score #memory memory matches 1 run clone 20 -60 -36 8 -59 -36 -6 -60 -35
execute if score #memory memory matches 2 run clone 20 -60 -35 8 -59 -35 -6 -60 -35
execute if score #memory memory matches 3 run clone 20 -60 -34 8 -59 -34 -6 -60 -35
execute if score #memory memory matches 4 run clone 20 -60 -33 8 -59 -33 -6 -60 -35
execute if score #memory memory matches 5 run clone 20 -60 -32 8 -59 -32 -6 -60 -35
execute if score #memory memory matches 6 run clone 20 -60 -31 8 -59 -31 -6 -60 -35
execute if score #memory memory matches 7 run clone 20 -60 -30 8 -59 -30 -6 -60 -35
execute if score #memory memory matches 8 run clone 20 -60 -29 8 -59 -29 -6 -60 -35
execute if score #memory memory matches 9 run clone 20 -60 -28 8 -59 -28 -6 -60 -35
execute if score #memory memory matches 10 run clone 20 -60 -27 8 -59 -27 -6 -60 -35
execute if score #memory memory matches 11 run function core:memory/finish

execute if score #memory memory matches 10 run scoreboard players add #memory memory 1
execute if score #memory memory matches 9 run scoreboard players add #memory memory 1
execute if score #memory memory matches 8 run scoreboard players add #memory memory 1
execute if score #memory memory matches 7 run scoreboard players add #memory memory 1
execute if score #memory memory matches 6 run scoreboard players add #memory memory 1
execute if score #memory memory matches 5 run scoreboard players add #memory memory 1
execute if score #memory memory matches 4 run scoreboard players add #memory memory 1
execute if score #memory memory matches 3 run scoreboard players add #memory memory 1
execute if score #memory memory matches 2 run scoreboard players add #memory memory 1
execute if score #memory memory matches 1 run scoreboard players add #memory memory 1

fill -2 -59 -37 2 -59 -37 air

execute as @e[tag=memory-button,nbt=!{transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.0f, 0.0f, 0.0f], translation: [0.0f, 0.0f, 0.0f]}}] run data merge entity @s {interpolation_duration:20,start_interpolation:0,transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.0f, 0.0f, 0.0f], translation: [0.0f, 0.0f, 0.0f]}}

schedule function core:memory/reset 10s
function core:memory/countdown