###################
#  Global things  #
###################
effect give @p[gamemode=adventure,tag=!taking-damage] minecraft:saturation infinite 255 true
effect give @p[gamemode=adventure,tag=!taking-damage] minecraft:resistance infinite 5 true
execute as @e[tag=chair] if data entity @s interaction run function core:chair/mount_chair
execute as @e[tag=chair] at @s if block ~ ~ ~ air run tp @s ~ ~-1 ~
execute as @e[type=item] at @s on origin run data modify entity @n[type=item,tag=!Text_Display] Owner set from entity @s UUID
execute as @e[type=item,tag=!hdr.dmg_indicator] run data modify entity @s PickupDelay set value 0s
execute as @e[type=item] at @s on origin run tp @n[type=item,tag=!Text_Display] @s
stopsound @a * ui.toast.challenge_complete


###############
#    Music    #
###############
execute if score $1stmusic music matches 0 run function core:escape/music_reset
execute if score $2ndmusic music matches 0 run function core:memory/music_reset
execute if score $3rdmusic music matches 0 run function core:parkour/music_reset
execute as @p[tag=escape-started,tag=!escape-done] if score $1stmusic music matches 1.. run scoreboard players remove $1stmusic music 1
execute as @p[tag=memory-started,tag=!memory-done] if score $2ndmusic music matches 1.. run scoreboard players remove $2ndmusic music 1
execute as @p[tag=parkour-started,tag=!parkour-done] if score $3rdmusic music matches 1.. run scoreboard players remove $3rdmusic music 1

execute if score #timerticks2 timer matches 20 run function core:timer/second2
execute if score #timerseconds2 timer matches 60 run function core:timer/minute2


##################
#  Escape Stuff  #
##################
execute if score $escape-started progress matches 1.. run function core:escape/escape_ticking
# Detect start
execute as @p[gamemode=adventure,tag=!escape-start] at @s if block ~1 ~ ~ black_concrete run function core:escape/start


##################
#  Memory Stuff  #
##################
execute if score $memory-started progress matches 1.. run function core:memory/memory_ticking
# Detect start
execute as @p[gamemode=adventure,tag=!memory-started] positioned 0 -60 -25 if entity @s[distance=..1.2] run function core:memory/start
# Door open
execute unless block 0 -58 -23 air as @p[gamemode=adventure,tag=!memory-started] positioned 0 -59 -22 if entity @s[distance=..1] run setblock 0 -55 -26 minecraft:redstone_block


###################
#  Parkour Stuff  #
###################
execute if score $parkour-started progress matches 1.. run function core:parkour/parkour_ticking


#########################
#  Tower Defense Stuff  #
#########################
execute if score $defense-started progress matches 1.. run function core:defense/defense_ticking

#################
#  Fight Stuff  #
#################
execute if score $fight-started progress matches 1.. run function core:fight/fight_ticking