$execute rotated $(rotation) ~ run summon marker ^ ^ ^3 {Tags:["defense.breeze_deflect_air"]}
execute at @s anchored eyes positioned ^ ^ ^ facing entity @n[tag=defense.breeze_deflect_air] feet run function core:defense/towers/archer/raycast/start_ray
kill @n[tag=defense.breeze_deflect_air]