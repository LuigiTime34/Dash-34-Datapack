schedule function core:escape/start3 102t
execute at @a run playsound minecraft:sound.custom.reading_sheet1 voice @a ~ ~ ~ 10000000000000000000000000000
tellraw @a ["",{"text":"Starting test #1 on patient MCP-34.","color":"green"}]
tp @p[gamemode=adventure] -4 -60 18 90 0
effect give @a slowness 5 255 true