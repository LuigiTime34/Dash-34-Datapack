$place template core:defense/towers/bee/base ~$(x_offset) ~ ~$(z_offset) $(rotation)
$data modify entity @n[tag=tower-barrel-marker] data.x_offset set value $(x_offset)
$data modify entity @n[tag=tower-barrel-marker] data.z_offset set value $(z_offset)
$data modify entity @n[tag=tower-barrel-marker] data.rotation set value $(rotation)
$data modify entity @n[tag=tower-barrel-marker] data.sell_cost set value $(sell_cost)
execute as @n[tag=bee-center-marker,tag=defense.off] run tag @s remove defense.off
execute as @n[tag=tower-barrel-marker] run function core:defense/towers/global/rotate_back
execute as @n[tag=tower-barrel-marker] at @s positioned ^ ^ ^1.5 run tp @p[gamemode=adventure] ~ -59 ~
execute as @p[gamemode=adventure] at @s run function core:defense/towers/global/rotate_player
execute as @n[tag=tower-barrel-marker] at @s positioned ^ ^ ^2 run summon minecraft:marker ~ -57.5 ~ {Tags:["defense.bee_deployer"]}
execute as @e[tag=defense.bee_deployer] at @s if block ~ -62 ~ cyan_wool run rotate @s 0 0
execute as @e[tag=defense.bee_deployer] at @s if block ~ -62 ~ blue_wool run rotate @s -90 0
execute as @e[tag=defense.bee_deployer] at @s if block ~ -62 ~ light_blue_wool run rotate @s -180 0
playsound minecraft:block.smithing_table.use master @a ~ ~2 ~ 1 0.7
particle minecraft:end_rod ~ ~2 ~ .2 .1 .2 0.5 50