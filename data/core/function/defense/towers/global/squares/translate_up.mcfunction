execute if data entity @p[gamemode=adventure] SelectedItem.components.minecraft:custom_data{bee:1b} run function core:defense/towers/global/squares/get_rotation
$data merge entity @s {interpolation_duration:2,start_interpolation:0,item:{id:"$(item)"}}
$execute store result score $range_success defense.range_indicator run data merge entity @s {transformation:{scale:[$(scale)f,$(scale)f,0.5f]}}
execute if score $range_success defense.range_indicator matches 1 run tag @p[gamemode=adventure] remove defense.played_sound