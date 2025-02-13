$scoreboard players set @s defense.towers $(cooldown)
$execute at @s positioned ~ -59 ~ unless entity @e[distance=..$(range),tag=defense-monster] run return 0
scoreboard players set $max defense.distance -2147483648
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] run scoreboard players operation $max defense.distance > @s defense.distance
$execute at @s positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] if score @s defense.distance = $max defense.distance run tag @s add defense-target
execute store result score @s defense.element_random run random value 1..100
$execute if score @s defense.element_random matches 1..25 as @n[tag=defense-monster,tag=defense-target] at @s run function core:defense/towers/element/fire/ignite {"damage":"$(fire_damage)","ignite_time":"$(ignite_time)"}
$execute if score @s defense.element_random matches 26..50 as @n[tag=defense-monster,tag=defense-target] at @s run function core:defense/towers/element/ice/freeze {"damage":"$(ice_damage)","freeze_time":"$(freeze_time)","freeze_power":"$(freeze_power)"}
$execute if score @s defense.element_random matches 51..75 as @n[tag=defense-monster,tag=defense-target] at @s run function core:defense/towers/element/wind/blow_back {"damage":"$(wind_damage)","blow_power":"$(blow_power)"}
$execute if score @s defense.element_random matches 76..100 as @n[tag=defense-monster,tag=defense-target] at @s run function core:defense/towers/element/earth/stab {"damage":"$(earth_damage)"}