kill @n[tag=element-center-marker]
$place template core:defense/towers/element/upgrade$(building) ~$(x_offset) ~ ~$(z_offset) $(rotation)
$data modify entity @n[tag=$(building)] data.x_offset set from entity @s data.x_offset
$data modify entity @n[tag=$(building)] data.z_offset set from entity @s data.z_offset
$data modify entity @n[tag=$(building)] data.rotation set from entity @s data.rotation
$scoreboard players set @n[tag=$(building)] defense.money $(cost)
kill @s
kill @n[tag=tower-barrel-display]
execute as @n[tag=tower-barrel-marker] run function core:defense/towers/global/rotate_back
execute as @n[tag=tower-barrel-marker] at @s positioned ^ ^ ^1 run tp @p[gamemode=adventure] ~ -59 ~
playsound block.anvil.use master @a ~ ~2 ~ 10 0.7
particle minecraft:end_rod ~ ~2 ~ .2 .1 .2 0.5 50
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tower_upgrade:1b}}}}]
clear @a *[custom_data~{tower_upgrade:1b}]