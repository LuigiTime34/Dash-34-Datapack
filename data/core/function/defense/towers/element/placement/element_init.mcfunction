execute as @p if score @s defense.rotation matches -45..45 run function core:defense/towers/element/placement/init_placement {"rotation":"none","x_offset":"-3","z_offset":"-3"}
execute as @p if score @s defense.rotation matches 46..135 run function core:defense/towers/element/placement/init_placement {"rotation":"clockwise_90","x_offset":"3","z_offset":"-3"}
execute as @p if score @s defense.rotation matches 136..180 run function core:defense/towers/element/placement/init_placement {"rotation":"180","x_offset":"3","z_offset":"3"}
execute as @p if score @s defense.rotation matches -180..-135 run function core:defense/towers/element/placement/init_placement {"rotation":"180","x_offset":"3","z_offset":"3"}
execute as @p if score @s defense.rotation matches -136..-44 run function core:defense/towers/element/placement/init_placement {"rotation":"counterclockwise_90","x_offset":"-3","z_offset":"3"}