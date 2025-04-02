execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 1
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 1..1 run schedule function core:defense/monsters/waves/wave1 3s
execute if score $wave_track defense.wave matches 1..1 run scoreboard players add $wave_track defense.wave 1
