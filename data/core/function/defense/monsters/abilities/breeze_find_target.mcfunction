tag @s add defense-breeze_deflect
playsound minecraft:entity.breeze.deflect master @a ~ ~ ~ 2
# Find the nearest entity to hit
$execute at @s as @n[tag=defense-monster,tag=!defense-breeze] if entity @s[distance=..6] run return run function core:defense/monsters/abilities/breeze_deflect {"damage":"$(damage)"}
# If there isn't a monster to hit, send the "projectile" in a random direction stop
tag @s remove defense-breeze_deflect
execute store result storage core:defense.breeze_rotation rotation int 1 run random value -180..180
execute at @s run function core:defense/monsters/abilities/breeze_deflect_air with storage core:defense.breeze_rotation