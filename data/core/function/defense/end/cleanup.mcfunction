scoreboard objectives setdisplay sidebar
bossbar set minecraft:defense.mobs_left visible false
kill @e[tag=defense-monster]
kill @e[tag=defense-baby_zombie]
kill @e[tag=defense-skeleton_rider]
kill @e[tag=defense-illusioner]
scoreboard players set $mobs_left defense.wave 0
scoreboard players set $wave_timer defense.wave 0
function core:defense/sell_all
gamemode adventure @p[tag=defense-started]
tp @p[gamemode=adventure] -59 -59 116 90 0