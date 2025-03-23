execute at @s run tp @s ^ ^ ^1
execute if block ~ ~-0.1 ~ grass_block run return run tp @s ^ ^ ^-3
scoreboard players remove @s defense.abilities 1
execute if score @s defense.abilities matches 1.. run function core:defense/monsters/abilities/enderman_recursive