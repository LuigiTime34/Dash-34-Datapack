scoreboard players reset @s defense.slowness
scoreboard players operation @s defense.slowness += @s defense.storm.freeze_power
scoreboard players operation @s[tag=defense-ravager] defense.slowness -= $ravager_speed defense.speed
scoreboard players operation @s defense.speed -= @s defense.slowness

execute if score @s defense.speed matches 1.. run function core:defense/monsters/movement/move_loop
scoreboard players operation @s defense.speed += @s defense.slowness
scoreboard players set @s[tag=defense-enderman] defense.speed 23