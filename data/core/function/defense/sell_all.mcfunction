tag @a add defense.selling_all
execute as @e[tag=tower-barrel-marker] at @s at @n[tag=tower-center-marker,tag=!defense.off,distance=..5] run function core:defense/towers/archer/sell
execute as @e[tag=tower-barrel-marker] at @s at @n[tag=panda-center-marker,tag=!defense.off,distance=..5] run function core:defense/towers/panda/sell
# execute as @e[tag=tower-barrel-marker] at @s at @n[tag=element-center-marker,tag=!defense.off,distance=..5] run function core:defense/towers/element/sell
execute as @e[tag=tower-barrel-marker] at @s at @n[tag=storm-center-marker,tag=!defense.off,distance=..5] run function core:defense/towers/storm/sell
execute as @e[tag=tower-barrel-marker] at @s at @n[tag=bee-center-marker,tag=!defense.off,distance=..5] run function core:defense/towers/bee/sell
tag @a remove defense.selling_all