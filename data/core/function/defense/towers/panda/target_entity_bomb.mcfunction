$scoreboard players set @s defense.towers $(cooldown)
$execute positioned ~ -59 ~ unless entity @e[distance=..$(range),tag=defense-monster] run return 0
scoreboard players set $max defense.distance -2147483648
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] run scoreboard players operation $max defense.distance > @s defense.distance
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] if score @s defense.distance = $max defense.distance run tag @s add defense-target

$execute at @n[tag=defense.panda] run function core:defense/towers/panda/summon_bomb {"damage":"$(damage)","bomb_range":"3"}