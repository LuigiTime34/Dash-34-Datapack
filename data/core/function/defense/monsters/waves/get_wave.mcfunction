scoreboard objectives modify defense.display displayname ""
clear @a[gamemode=adventure] iron_helmet
scoreboard players set $wave_timer defense.wave 0
scoreboard players add $wave_level defense.wave 1
execute store result storage core:wave_number wave int 1 run scoreboard players get $wave_level defense.wave
function core:defense/monsters/waves/next_wave with storage core:wave_number
bossbar set minecraft:defense.mobs_left name ["",{"text":"WAVE ","bold":true,"color":"aqua"},{"score":{"name":"$wave_level","objective":"defense.wave"},"bold":true,"color":"aqua"}]
# function core:defense/scoreboard/get_highest