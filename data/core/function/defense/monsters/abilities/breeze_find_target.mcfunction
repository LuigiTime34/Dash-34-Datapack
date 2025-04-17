tag @s add defense-breeze_deflect
# Find the nearest entity to hit
$execute at @s as @n[tag=defense-monster,tag=!defense-breeze] if entity @s[distance=..6] run return run function core:defense/monsters/abilities/breeze_deflect {"damage":"$(damage)"}
# If there isn't a monster to hit, stop
tag @s remove defense-breeze_deflect