scoreboard players remove $mobs_left defense.wave 1

playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 100000000000 0.8
# playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 100000000000 0.8

execute store result score @s defense.damage run data get entity @s Health
execute store result score @s defense.extra_damage run attribute @s attack_damage get
scoreboard players operation @s defense.damage += @s defense.extra_damage
execute if entity @s[tag=defense.weakened] run function core:defense/towers/archer/witch/witch_weaken
tellraw @a ["",{"text":"Lost","color":"aqua"},{"text":" [","color":"gold","bold":true},{"score":{"name":"@n[tag=defense-monster]","objective":"defense.damage"},"bold":true,"color":"dark_red"},{"text":"]","color":"gold","bold":true},{"text":" health!","color":"aqua"}]
scoreboard players operation $defense.health defense.damage -= @s defense.damage

execute store result bossbar defense_health value run scoreboard players get $defense.health defense.damage

kill @s

function core:defense/scoreboard/get_highest