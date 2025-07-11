execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 12
execute if score $wave_track defense.wave matches 1 store result bossbar minecraft:defense.mobs_left max run scoreboard players get $mobs_left defense.wave
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 7 run function core:defense/monsters/summon/witch
execute if score $wave_track defense.wave matches 8 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 9 run function core:defense/monsters/summon/zombified_piglin
execute if score $wave_track defense.wave matches 10 run function core:defense/monsters/summon/silverfish
execute if score $wave_track defense.wave matches 11 run function core:defense/monsters/summon/creeper
execute if score $wave_track defense.wave matches 12 run function core:defense/monsters/summon/bogged
execute if score $wave_track defense.wave matches 1..12 run schedule function core:defense/monsters/waves/wave45 15t
execute if score $wave_track defense.wave matches 1..12 run scoreboard players add $wave_track defense.wave 1
