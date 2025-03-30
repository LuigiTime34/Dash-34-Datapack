execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 30
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 7 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 8 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 9 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 10 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 11 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 12 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 13 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 14 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 15 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 16 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 17 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 18 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 19 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 20 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 21 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 22 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 23 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 24 run function core:defense/monsters/summon/piglin_brute
execute if score $wave_track defense.wave matches 25 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 26 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 27 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 28 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 29 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 30 run function core:defense/monsters/summon/vindicator
execute if score $wave_track defense.wave matches 1..30 run schedule function core:defense/monsters/waves/wave27 3s
execute if score $wave_track defense.wave matches 1..30 run scoreboard players add $wave_track defense.wave 1
