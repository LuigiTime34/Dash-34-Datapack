scoreboard players set $memory-started progress 1
scoreboard players set $escape-started progress 0
setblock 8 -55 -30 minecraft:redstone_block
clone -8 -54 -33 -8 -56 -31 -7 -60 -33
clone -22 -56 -32 -22 -56 -32 -22 -60 -32
fill -8 -58 -33 -8 -60 -31 air
tag @s add memory-started
tp @s 0 -60 -31 180 0
scoreboard players set #memory memory 1
fill -6 -60 -33 6 -58 -35 air
function core:memory/music_reset
scoreboard players set #score memory 0
schedule function core:memory/begin_test 538t
advancement revoke @p[gamemode=adventure] only core:memory/photographic_memory
advancement revoke @p[gamemode=adventure] only core:memory/short_term_memory_loss
advancement revoke @p[gamemode=adventure] only core:memory/door
advancement grant @p[gamemode=adventure] only core:memory/root
title @p[gamemode=adventure] times 20 30 40
title @p[gamemode=adventure] subtitle {"text":"memory test", "font":"retitled_titles:regular", "color":"#25FF01"}
title @p[gamemode=adventure] title {"text":"\uF903\u0009section 2\u000A", "font":"retitled_titles:regular", "color":"#26FF01"}
schedule function core:memory/start2 90t
function core:memory/random/randomize