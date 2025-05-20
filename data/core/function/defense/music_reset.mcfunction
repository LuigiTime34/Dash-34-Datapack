execute if score $defense_track music matches 6.. run scoreboard players set $defense_track music 1

execute if score $defense_track music matches 1 run stopsound @a ambient minecraft:sound.custom.music.defense_custom
execute if score $defense_track music matches 1 run scoreboard players set $4thmusic music 12080
execute if score $defense_track music matches 1 as @a at @s run playsound minecraft:sound.custom.music.defense_custom ambient @s

execute if score $defense_track music matches 2 run stopsound @a ambient minecraft:sound.custom.music.defense_custom2
execute if score $defense_track music matches 2 run scoreboard players set $4thmusic music 6660
execute if score $defense_track music matches 2 as @a at @s run playsound minecraft:sound.custom.music.defense_custom2 ambient @s

execute if score $defense_track music matches 3 run stopsound @a ambient minecraft:sound.custom.music.defense_custom3
execute if score $defense_track music matches 3 run scoreboard players set $4thmusic music 6040
execute if score $defense_track music matches 3 as @a at @s run playsound minecraft:sound.custom.music.defense_custom3 ambient @s

execute if score $defense_track music matches 4 run stopsound @a ambient minecraft:sound.custom.music.defense_custom4
execute if score $defense_track music matches 4 run scoreboard players set $4thmusic music 5340
execute if score $defense_track music matches 4 as @a at @s run playsound minecraft:sound.custom.music.defense_custom4 ambient @s

execute if score $defense_track music matches 5 run stopsound @a ambient minecraft:sound.custom.music.defense_custom5
execute if score $defense_track music matches 5 run scoreboard players set $4thmusic music 10980
execute if score $defense_track music matches 5 as @a at @s run playsound minecraft:sound.custom.music.defense_custom5 ambient @s

scoreboard players add $defense_track music 1