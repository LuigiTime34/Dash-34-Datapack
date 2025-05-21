$scoreboard players set @s defense.towers $(cooldown)
$execute at @s positioned ~ -59 ~ unless entity @e[distance=..$(range),tag=defense-monster] run return 0
scoreboard players set $max defense.distance -2147483648
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] run scoreboard players operation $max defense.distance > @s defense.distance
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] if score @s defense.distance = $max defense.distance run tag @s add defense-target

scoreboard players set $max defense.distance -2147483648
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range),tag=!defense-target] run scoreboard players operation $max defense.distance > @s defense.distance
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range),tag=!defense-target] if score @s defense.distance = $max defense.distance run tag @s add defense-target

scoreboard players set $max defense.distance -2147483648
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range),tag=!defense-target] run scoreboard players operation $max defense.distance > @s defense.distance
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range),tag=!defense-target] if score @s defense.distance = $max defense.distance run tag @s add defense-target

$execute as @e[tag=defense-monster,tag=defense-target] at @s positioned ^ ^ ^.3 run function core:defense/towers/panda/stab {"damage":"$(damage)","age":"$(age)","leaves":"$(leaves)"}