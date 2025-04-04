execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 6
execute if score $wave_track defense.wave matches 1 store result bossbar minecraft:defense.mobs_left max run scoreboard players get $mobs_left defense.wave
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/witch
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/boss/iron_golem/summon
execute if score $wave_track defense.wave matches 1..6 run schedule function core:defense/monsters/waves/wave15 3s
execute if score $wave_track defense.wave matches 1..6 run scoreboard players add $wave_track defense.wave 1
