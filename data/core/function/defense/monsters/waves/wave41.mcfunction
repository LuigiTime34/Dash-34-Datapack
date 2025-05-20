execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 8
execute if score $wave_track defense.wave matches 1 store result bossbar minecraft:defense.mobs_left max run scoreboard players get $mobs_left defense.wave
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/zoglin
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/zoglin
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/iron_golem
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 7 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 8 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 1..8 run schedule function core:defense/monsters/waves/wave41 15t
execute if score $wave_track defense.wave matches 1..8 run scoreboard players add $wave_track defense.wave 1
