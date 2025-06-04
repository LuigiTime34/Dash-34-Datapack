$execute positioned ~ -59 ~ unless entity @e[distance=..$(range),tag=defense-monster] run return run scoreboard players set @s defense.towers 2
scoreboard players set $max defense.distance -2147483648
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] run scoreboard players operation $max defense.distance > @s defense.distance
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range),limit=1] if score @s defense.distance = $max defense.distance run tag @s add defense-target