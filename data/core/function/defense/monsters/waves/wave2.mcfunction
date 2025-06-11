execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 2
execute if score $wave_track defense.wave matches 1 store result bossbar minecraft:defense.mobs_left max run scoreboard players get $mobs_left defense.wave
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 1..2 run schedule function core:defense/monsters/waves/wave2 3s
execute if score $wave_track defense.wave matches 1..2 run scoreboard players add $wave_track defense.wave 1
