$place template core:defense/towers/tree/base ~$(x_offset) ~ ~$(z_offset) $(rotation)
$data modify entity @n[tag=tower-barrel-marker] data.x_offset set value $(x_offset)
$data modify entity @n[tag=tower-barrel-marker] data.z_offset set value $(z_offset)
$data modify entity @n[tag=tower-barrel-marker] data.rotation set value $(rotation)
$data modify entity @n[tag=tower-barrel-marker] data.sell_cost set value $(sell_cost)
execute as @n[tag=tower-barrel-marker] run function core:defense/towers/global/rotate_back
execute as @n[tag=tower-barrel-marker] at @s positioned ^ ^ ^1 run tp @p[gamemode=adventure] ~ -59 ~
playsound block.anvil.use master @a ~ ~2 ~ 10 0.7
particle minecraft:end_rod ~ ~2 ~ .2 .1 .2 0.5 50