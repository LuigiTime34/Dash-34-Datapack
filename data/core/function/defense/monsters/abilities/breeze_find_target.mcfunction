tag @s add defense-breeze_deflect
# Find the nearest entity to hit
$execute at @s as @n[tag=defense-monster,tag=!defense-breeze] if entity @s[distance=..5] run return run function core:defense/monsters/abilities/breeze_deflect {"damage":"$(damage)"}
# If there isn't a monster to hit, hit itself instead
$damage @s $(damage) core:defense/arrow by @p
tag @s remove defense-breeze_deflect