execute store result score @s defense.bee.honey_slowness run data get entity @s data.range 10
scoreboard players operation @s defense.bee.honey_slowness += $3.5 defense.bee.honey_slowness
execute store result storage core:defense.bee_range range float 0.1 run scoreboard players get @s defense.bee.honey_slowness
execute store result storage core:defense.bee_range slow_power float 1 run data get entity @s data.slow_power
execute at @s run function core:defense/towers/bee/apply_effects with storage core:defense.bee_range