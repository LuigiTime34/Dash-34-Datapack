execute unless score $wave_timer defense.wave matches 1 run schedule function core:defense/scoreboard/wave_timer 1s
execute if score $wave_timer defense.wave matches 1..4 as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1
execute if score $wave_timer defense.wave matches 1.. run scoreboard players remove $wave_timer defense.wave 1
# Old scoreboard method
# execute if score $wave_timer defense.wave matches 1.. run scoreboard players remove $wave_timer defense.wave 5
# scoreboard players operation $wave_timer defense.wave /= $wave_timer5 defense.wave
title @a[tag=!defense.ariel_view] actionbar ["",{"text":"\u0004 "},{"score":{"name":"$wave_timer","objective":"defense.wave"},"bold":true,"color":"gold"}]
# title @a actionbar ["",{"text":"Time until next wave: ","bold":false,"color":"dark_aqua"},{"score":{"name":"$wave_timer","objective":"defense.wave"},"bold":true,"color":"dark_aqua"}]
execute if score $wave_timer defense.wave matches 1 run schedule function core:defense/monsters/waves/get_wave 1s
# function core:defense/scoreboard/get_highest
# scoreboard players operation $wave_timer defense.wave *= $wave_timer5 defense.wave