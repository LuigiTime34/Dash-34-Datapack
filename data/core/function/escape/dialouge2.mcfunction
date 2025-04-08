execute at @a run playsound minecraft:sound.custom.dialouge.1stpuzzle_ending voice @p[gamemode=adventure] ~ ~ ~ 10000000000000000000000000000
tellraw @a ["",{"text":"Wow you did great! And it's only your first test... Give me one minute as I log your results...","color":"green"}]
schedule function core:escape/finish3 120t