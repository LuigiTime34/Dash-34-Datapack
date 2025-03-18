execute as @p[gamemode=adventure,tag=!parkour-started] run function core:parkour/music_reset
title @p[gamemode=adventure,tag=!parkour-started] times 20 30 40
title @p[gamemode=adventure,tag=!parkour-started] subtitle {"text":"parkour", "font":"retitled_titles:regular", "color":"#25FF01"}
title @p[gamemode=adventure,tag=!parkour-started] title {"text":"\uF903\u0009section 3\u000A", "font":"retitled_titles:regular", "color":"#25FF01"}
title @s[gamemode=adventure,tag=parkour-started] title {"text":""}
title @s[gamemode=adventure,tag=parkour-started] subtitle {"text":"Checkpoint!","color":"gold","bold":true}
title @s[gamemode=adventure,tag=parkour-started] times 20 10 10
tag @s add parkour-started
tag @e[tag=parkour-checkpoint] remove current_checkpoint
tag @n[tag=parkour-checkpoint] add current_checkpoint
particle minecraft:totem_of_undying ~ ~1 ~ 0 2 0 0.1 200
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 10000000 0.75
#summon firework_rocket ~ ~ ~ {Life:5,LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,colors:[I;2752311],fade_colors:[I;15204170]}]}}}}
setblock ~ ~ ~ air
execute if block ~ ~-2 ~ light_blue_wool run spawnpoint @s ~ ~ ~ 90
execute if block ~ ~-2 ~ cyan_wool run spawnpoint @s ~ ~ ~ 0
execute if block ~ ~-2 ~ blue_wool run spawnpoint @s ~ ~ ~ -90
execute if block ~ ~-2 ~ purple_wool run spawnpoint @s ~ ~ ~ -180
effect clear @s speed
effect clear @s jump_boost
clear @s wind_charge
execute as @s[tag=discovered-gravity] run function core:parkour/blocks/gravity_normal