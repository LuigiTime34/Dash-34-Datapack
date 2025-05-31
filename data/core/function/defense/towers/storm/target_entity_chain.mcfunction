$scoreboard players set @s defense.towers $(cooldown)
$execute positioned ~ -59 ~ unless entity @e[distance=..$(range),tag=defense-monster] run return run scoreboard players set @s defense.towers 2
scoreboard players set $max defense.distance -2147483648
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] run scoreboard players operation $max defense.distance > @s defense.distance
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] if score @s defense.distance = $max defense.distance run tag @s add defense-target

$data merge storage core:defense.storm_raycast {"max_chain_length":"$(max_chain_length)","chain_damage":"$(chain_damage)","chain_radius":"$(chain_radius)"}
$execute as @n[tag=defense-monster,tag=defense-target] at @s run function core:defense/towers/storm/blow_back_chain {"damage":"$(damage)","blow_power":"$(blow_power)"}