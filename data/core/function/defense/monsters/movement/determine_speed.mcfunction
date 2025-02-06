# Make the enemy slower if there's a modifier   
scoreboard players operation @s defense.speed -= @s defense.slowness
execute if score @s defense.speed matches 1.. store result storage core:mob_speed speed float 0.001 run scoreboard players get @s defense.speed
execute if score @s defense.speed matches 1.. run function core:defense/monsters/movement/move with storage core:mob_speed
scoreboard players operation @s defense.speed += @s defense.slowness