execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 1..2 run schedule function core:defense/monsters/waves/wave1 3s
execute if score $wave_track defense.wave matches 1..2 run scoreboard players add $wave_track defense.wave 1
