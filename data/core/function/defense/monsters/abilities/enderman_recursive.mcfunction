scoreboard players remove @s defense.abilities 1
execute if score @s defense.abilities matches 1.. positioned ^ ^ ^1 unless block ~ ~-0.1 ~ #core:end_blocks run return run function core:defense/monsters/abilities/enderman_recursive
teleport @s ~ ~ ~