playsound minecraft:entity.breeze.deflect master @a ~ ~ ~ 2
execute at @s anchored eyes positioned ^ ^ ^ facing entity @n[tag=defense-monster,tag=defense-breeze,tag=defense-breeze_deflect] eyes run function core:defense/towers/archer/raycast/start_ray
tag @n[tag=defense-breeze_deflect] remove defense-breeze_deflect
$damage @s $(damage) core:defense/arrow by @p