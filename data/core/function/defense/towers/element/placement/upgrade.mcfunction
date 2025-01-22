$place template core:defense/towers/element/upgrade$(building) ~$(x_offset) ~ ~$(z_offset) $(rotation)
$data modify entity @n[tag=$(building)] data.x_offset set from entity @s data.x_offset
$data modify entity @n[tag=$(building)] data.z_offset set from entity @s data.z_offset
$data modify entity @n[tag=$(building)] data.rotation set from entity @s data.rotation
kill @s
kill @n[tag=tower-center-marker]
playsound block.anvil.use master @a ~ ~2 ~ 10 0.7
particle minecraft:end_rod ~ ~2 ~ .2 .1 .2 0.5 50
$clear @a *[custom_data~{element_upgrade$(building):1b}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_upgrade:1b}}}}]