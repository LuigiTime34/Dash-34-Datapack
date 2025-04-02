# Get any modifiers to the enemy's speed and set the speed accordingly
scoreboard players reset @s defense.slowness
scoreboard players operation @s defense.slowness += @s defense.element.ice_power
scoreboard players operation @s defense.slowness += @s defense.bee.honey_slowness
scoreboard players operation @s defense.slowness += @s defense.archer_slowness
scoreboard players operation @s defense.slowness -= $ravager_speed defense.speed
# Make the enemy slower if there's a modifier   
scoreboard players operation @s defense.speed -= @s defense.slowness
execute if score @s defense.speed matches 1.. store result storage core:mob_speed speed float 0.0005 run scoreboard players get @s defense.speed
execute if score @s defense.speed matches 1.. run function core:defense/monsters/movement/move with storage core:mob_speed
scoreboard players operation @s defense.speed += @s defense.slowness