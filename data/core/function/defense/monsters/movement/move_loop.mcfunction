execute at @s if entity @n[type=minecraft:marker,tag=defense-intersection,distance=..0.1] positioned ~ -61 ~ unless block ^ ^ ^-1 raw_gold_block as @n[tag=defense-intersection] at @s run tp @n[tag=defense-monster] ~ ~ ~ ~ ~

execute at @s run tp @s[tag=defense-monster] ^ ^ ^0.005

execute run scoreboard players add @s defense.speed_loop 1
execute run scoreboard players add @s defense.distance 1

execute if score @s defense.speed_loop < @s defense.speed run return run function core:defense/monsters/movement/move_loop
scoreboard players reset @s defense.speed_loop