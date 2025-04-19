scoreboard players remove @s defense.items 1
execute if entity @s[tag=defense.tnt_enemies] run return run function core:defense/items/tnt/explode_enemies
function core:defense/items/tnt/get_boulder
kill @s