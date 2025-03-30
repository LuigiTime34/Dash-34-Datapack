execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 10
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 7 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 8 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 9 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 10 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 1..10 run schedule function core:defense/monsters/waves/wave15 3s
execute if score $wave_track defense.wave matches 1..10 run scoreboard players add $wave_track defense.wave 1
