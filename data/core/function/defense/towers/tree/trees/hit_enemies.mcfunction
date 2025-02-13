particle minecraft:crit ^ ^ ^ 0.125 0.125 0.125 0 10
particle minecraft:crit ^ ^ ^1 0.125 0.125 0.125 0 10
particle minecraft:crit ^ ^ ^2 0.125 0.125 0.125 0 10
particle minecraft:crit ^ ^ ^3 0.125 0.125 0.125 0 10
particle minecraft:crit ^ ^ ^4 0.125 0.125 0.125 0 10
execute positioned ^ ^ ^ as @e[distance=..1,tag=defense-monster] run damage @s 3 minecraft:player_attack by @p
execute positioned ^ ^ ^1 as @e[distance=..1,tag=defense-monster] run damage @s 3 minecraft:player_attack by @p
execute positioned ^ ^ ^2 as @e[distance=..1,tag=defense-monster] run damage @s 3 minecraft:player_attack by @p
execute positioned ^ ^ ^3 as @e[distance=..1,tag=defense-monster] run damage @s 3 minecraft:player_attack by @p
execute positioned ^ ^ ^4 as @e[distance=..1,tag=defense-monster] run damage @s 3 minecraft:player_attack by @p
kill @s