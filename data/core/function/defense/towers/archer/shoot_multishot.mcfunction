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

execute at @s anchored eyes positioned ^ ^ ^ run rotate @s facing entity @n[tag=defense-monster,tag=defense-target]
execute at @s anchored eyes positioned ^ ^ ^ facing entity @n[tag=defense-monster,tag=defense-target] eyes run function core:defense/towers/archer/raycast/start_ray
$execute as @n[tag=defense-monster,tag=defense-target,tag=defense-breeze] run function core:defense/monsters/abilities/breeze_find_target {"damage":"$(damage)"}
$damage @n[tag=defense-monster,tag=defense-target,tag=!defense-breeze,tag=!defense-pillager] $(damage) core:defense/arrow by @p
tag @n[tag=defense-monster,tag=defense-target] remove defense-target

execute at @s anchored eyes positioned ^ ^ ^ run rotate @s facing entity @n[tag=defense-monster,tag=defense-target]
execute at @s anchored eyes positioned ^ ^ ^ facing entity @n[tag=defense-monster,tag=defense-target] eyes run function core:defense/towers/archer/raycast/start_ray
$execute as @n[tag=defense-monster,tag=defense-target,tag=defense-breeze] run function core:defense/monsters/abilities/breeze_find_target {"damage":"$(damage)"}
$damage @n[tag=defense-monster,tag=defense-target,tag=!defense-breeze,tag=!defense-pillager] $(damage) core:defense/arrow by @p
tag @n[tag=defense-monster,tag=defense-target] remove defense-target

execute at @s anchored eyes positioned ^ ^ ^ run rotate @s facing entity @n[tag=defense-monster,tag=defense-target]
execute at @s anchored eyes positioned ^ ^ ^ facing entity @n[tag=defense-monster,tag=defense-target] eyes run function core:defense/towers/archer/raycast/start_ray
$execute as @n[tag=defense-monster,tag=defense-target,tag=defense-breeze] run function core:defense/monsters/abilities/breeze_find_target {"damage":"$(damage)"}
$damage @n[tag=defense-monster,tag=defense-target,tag=!defense-breeze,tag=!defense-pillager] $(damage) core:defense/arrow by @p
tag @n[tag=defense-monster,tag=defense-target] remove defense-target

execute at @s anchored eyes positioned ^ ^ ^ run rotate @s facing entity @n[tag=defense-monster,tag=defense-target]
execute at @s run playsound minecraft:item.crossbow.shoot master @a ~ ~ ~ 2