$scoreboard players set @s defense.towers $(cooldown)
$execute positioned ~ -59 ~ unless entity @e[distance=..$(range),tag=defense-monster] run return run scoreboard players set @s defense.towers 2
scoreboard players set $max defense.distance -2147483648
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] run scoreboard players operation $max defense.distance > @s defense.distance
$execute positioned ~ -59 ~ as @e[tag=defense-monster,distance=..$(range)] if score @s defense.distance = $max defense.distance run tag @s add defense-target
execute as @e[tag=defense.panda,tag=!defense.attacked,distance=..3.5,sort=random,limit=1] run function core:defense/towers/panda/show_particle
$execute as @n[tag=defense-monster,tag=defense-target] at @s positioned ^ ^ ^.3 run function core:defense/towers/panda/stab {"damage":"$(damage)","age":"$(age)","leaves":"$(leaves)"}