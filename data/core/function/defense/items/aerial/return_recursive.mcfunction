$execute if block ~ $(spawn_y) ~ #core:blocks run return run tp @s ~ $(spawn_y) ~
scoreboard players add @s defense.items 1
execute store result storage core:defense.aerial_view spawn_y int 1 run scoreboard players get @s defense.items
function core:defense/items/aerial/return_recursive with storage core:defense.aerial_view