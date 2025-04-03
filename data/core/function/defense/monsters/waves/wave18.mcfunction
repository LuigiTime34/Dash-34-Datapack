execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 11
execute if score $wave_track defense.wave matches 1 store result bossbar minecraft:defense.mobs_left max run scoreboard players get $mobs_left defense.wave
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/wither_skeleton
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/summon/blaze
execute if score $wave_track defense.wave matches 7 run function core:defense/monsters/summon/piglin
execute if score $wave_track defense.wave matches 8 run function core:defense/monsters/summon/silverfish
execute if score $wave_track defense.wave matches 9 run function core:defense/monsters/summon/zombie_villager
execute if score $wave_track defense.wave matches 10 run function core:defense/monsters/summon/stray
execute if score $wave_track defense.wave matches 11 run function core:defense/monsters/summon/husk
execute if score $wave_track defense.wave matches 1..11 run schedule function core:defense/monsters/waves/wave18 3s
execute if score $wave_track defense.wave matches 1..11 run scoreboard players add $wave_track defense.wave 1
