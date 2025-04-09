clone -77 -30 116 -77 -30 116 -77 -39 116
scoreboard players set $wave_level defense.wave 0
scoreboard players set $money defense.money 10
scoreboard players set $defense.health defense.damage 500
scoreboard players set $wave_timer defense.wave 30
bossbar set minecraft:defense.mobs_left name ["",{"text":"WAVE ","bold":true,"color":"aqua"},{"score":{"name":"$wave_level","objective":"defense.wave"},"bold":true,"color":"aqua"}]
bossbar set minecraft:defense.mobs_left players @a
bossbar set minecraft:defense.mobs_left visible true
scoreboard objectives setdisplay sidebar defense.display
effect give @p[gamemode=adventure] minecraft:weakness infinite 0 true
effect give @p[gamemode=adventure] minecraft:speed infinite 1 true
item replace entity @p[gamemode=adventure] hotbar.0 from block -1 -43 0 container.0
item replace entity @p[gamemode=adventure] hotbar.1 from block -1 -43 0 container.1
function core:defense/scoreboard/wave_timer
function core:defense/music_reset
tag @p[gamemode=adventure] add defense-started
title @p[gamemode=adventure] times 20 30 40
title @p[gamemode=adventure] subtitle {"text":"tower defense", "font":"retitled_titles:regular", "color":"#25FF01"}
title @p[gamemode=adventure] title {"text":"\uF903\u0009section 3\u000A", "font":"retitled_titles:regular", "color":"#26FF01"}