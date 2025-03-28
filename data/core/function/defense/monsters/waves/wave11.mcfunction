execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/creeper
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 7 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 8 run function core:defense/monsters/summon/witch
execute if score $wave_track defense.wave matches 9 run function core:defense/monsters/summon/husk
execute if score $wave_track defense.wave matches 10 run function core:defense/monsters/summon/stray
execute if score $wave_track defense.wave matches 11 run function core:defense/monsters/summon/zombie_villager
execute if score $wave_track defense.wave matches 12 run function core:defense/monsters/summon/silverfish
execute if score $wave_track defense.wave matches 13 run function core:defense/monsters/summon/silverfish
execute if score $wave_track defense.wave matches 14 run function core:defense/monsters/summon/piglin
execute if score $wave_track defense.wave matches 15 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 16 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 1..16 run schedule function core:defense/monsters/waves/wave11 3s
execute if score $wave_track defense.wave matches 1..16 run scoreboard players add $wave_track defense.wave 1
