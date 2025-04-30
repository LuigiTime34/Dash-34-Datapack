tag @s remove defense.aerial_view
gamemode adventure @s
scoreboard players set @s defense.items -59
execute store result storage core:defense.aerial_view spawn_y int 1 run scoreboard players get @s defense.items
execute at @s run function core:defense/items/aerial/return_recursive with storage core:defense.aerial_view
# tp @s @n[tag=defense.aerial_view_return]
# kill @n[tag=defense.aerial_view_return]
execute at @s run playsound entity.enderman.teleport master @s ~ ~ ~ 1