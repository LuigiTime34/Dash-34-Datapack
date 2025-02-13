rotate @s ~ 90
tp @s ~ -58 ~
execute as @e[tag=defense.tree1] at @s run particle minecraft:crit ^ ^ ^ 0.125 0.125 0.125 0 10
execute as @e[tag=defense.tree2] at @s run particle minecraft:crit ^ ^ ^1 0.125 0.125 0.125 0 10
execute as @e[tag=defense.tree3] at @s run particle minecraft:crit ^ ^ ^2 0.125 0.125 0.125 0 10
execute as @e[tag=defense.tree4] at @s run particle minecraft:crit ^ ^ ^3 0.125 0.125 0.125 0 10
execute as @e[tag=defense.tree5] at @s run particle minecraft:crit ^ ^ ^4 0.125 0.125 0.125 0 10
execute as @e[tag=defense.tree1] at @s positioned ^ ^ ^ as @e[distance=..1] run damage @s 3 minecraft:player_attack by @p
execute as @e[tag=defense.tree2] at @s positioned ^ ^ ^1 as @e[distance=..1] run damage @s 3 minecraft:player_attack by @p
execute as @e[tag=defense.tree3] at @s positioned ^ ^ ^2 as @e[distance=..1] run damage @s 3 minecraft:player_attack by @p
execute as @e[tag=defense.tree4] at @s positioned ^ ^ ^3 as @e[distance=..1] run damage @s 3 minecraft:player_attack by @p
execute as @e[tag=defense.tree5] at @s positioned ^ ^ ^4 as @e[distance=..1] run damage @s 3 minecraft:player_attack by @p