execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave 28
execute if score $wave_track defense.wave matches 1 store result bossbar minecraft:defense.mobs_left max run scoreboard players get $mobs_left defense.wave
execute if score $wave_track defense.wave matches 1 run function core:defense/monsters/summon/zoglin
execute if score $wave_track defense.wave matches 2 run function core:defense/monsters/summon/breeze
execute if score $wave_track defense.wave matches 3 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 4 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 5 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 6 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 7 run function core:defense/monsters/summon/spider
execute if score $wave_track defense.wave matches 8 run function core:defense/monsters/summon/enderman
execute if score $wave_track defense.wave matches 9 run function core:defense/monsters/summon/stray
execute if score $wave_track defense.wave matches 10 run function core:defense/monsters/summon/stray
execute if score $wave_track defense.wave matches 11 run function core:defense/monsters/summon/stray
execute if score $wave_track defense.wave matches 12 run function core:defense/monsters/summon/bogged
execute if score $wave_track defense.wave matches 13 run function core:defense/monsters/summon/bogged
execute if score $wave_track defense.wave matches 14 run function core:defense/monsters/summon/zombified_piglin
execute if score $wave_track defense.wave matches 15 run function core:defense/monsters/summon/zombified_piglin
execute if score $wave_track defense.wave matches 16 run function core:defense/monsters/summon/zombified_piglin
execute if score $wave_track defense.wave matches 17 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 18 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 19 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 20 run function core:defense/monsters/summon/witch
execute if score $wave_track defense.wave matches 21 run function core:defense/monsters/summon/witch
execute if score $wave_track defense.wave matches 22 run function core:defense/monsters/summon/creeper
execute if score $wave_track defense.wave matches 23 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 24 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 25 run function core:defense/monsters/summon/zombie
execute if score $wave_track defense.wave matches 26 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 27 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 28 run function core:defense/monsters/summon/skeleton
execute if score $wave_track defense.wave matches 1..28 run schedule function core:defense/monsters/waves/wave39 30t
execute if score $wave_track defense.wave matches 1..28 run scoreboard players add $wave_track defense.wave 1
