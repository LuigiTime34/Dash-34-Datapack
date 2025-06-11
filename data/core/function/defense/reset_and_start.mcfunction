forceload add 8 73 -70 159
clone -77 -30 116 -77 -30 116 -77 -39 116
scoreboard players set $wave_level defense.wave 0
scoreboard players set $money defense.money 180
scoreboard players set $defense.health defense.damage 1000
scoreboard players set $wave_timer defense.wave 30
scoreboard players set $dead defense 0
bossbar set minecraft:defense.mobs_left name ["",{"text":"WAVE ","bold":true,"color":"aqua"},{"score":{"name":"$wave_level","objective":"defense.wave"},"bold":true,"color":"aqua"},{"text":"/40","bold":true,"color":"aqua"}]
bossbar set minecraft:defense.mobs_left players @a
bossbar set minecraft:defense.mobs_left visible true
scoreboard objectives modify defense.display displayname ""
scoreboard objectives setdisplay sidebar defense.display
effect give @p[gamemode=adventure] minecraft:weakness infinite 0 true
effect give @p[gamemode=adventure] minecraft:speed infinite 2 true
attribute @p[gamemode=adventure] entity_interaction_range base set 12
attribute @p[gamemode=adventure] scale base set 2
item replace entity @p[gamemode=adventure] hotbar.0 from block -1 -43 0 container.1
item replace entity @p[gamemode=adventure] hotbar.1 from block -1 -43 0 container.0
item replace entity @p[gamemode=adventure] hotbar.2 from block -1 -43 0 container.2
item replace entity @p[gamemode=adventure] hotbar.8 with iron_chestplate[custom_name='["",{"text":"Enter Aerial View","italic":false,"color":"green"}]',lore=['["",{"text":"Right click to view your towers from above","color":"dark_gray"}]'],equippable={slot:chest},!attribute_modifiers,item_model="minecraft:spyglass",custom_data={"defense.aerial_view":true}]
function core:defense/scoreboard/wave_timer
scoreboard players set $defense_track music 1
function core:defense/music_reset
tag @p[gamemode=adventure] add defense-started
team join defense_player @p[gamemode=adventure]
title @p[gamemode=adventure] times 20 30 40
title @p[gamemode=adventure] subtitle {"text":"tower defense", "font":"retitled_titles:regular", "color":"#25FF01"}
title @p[gamemode=adventure] title {"text":"\uF903\u0009section 3\u000A", "font":"retitled_titles:regular", "color":"#26FF01"}
advancement revoke @a through core:defense/root
advancement grant @a only core:defense/root
advancement grant @a only core:defense/mobs_root