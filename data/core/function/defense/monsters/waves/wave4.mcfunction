execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/creeper
execute if score $wave_track defense.wave matches 1..5 run schedule function core:defense/monsters/waves/wave4 3s
execute if score $wave_track defense.wave matches 1..5 run scoreboard players add $wave_track defense.wave 1
