# Zombie Villager
execute as @a if score @s defense.kill_villager matches 1.. run scoreboard players remove $money defense.money 10
execute as @a if score @s defense.kill_villager matches 1.. run scoreboard players remove @s defense.kill_villager 1

# Piglin
execute as @a if score @s defense.kill_piglin matches 1.. run scoreboard players add $money defense.money 30
execute as @a if score @s defense.kill_piglin matches 1.. run scoreboard players reset @s defense.kill_piglin

scoreboard players add $money defense.money 10
playsound minecraft:entity.experience_orb.pickup master @s
scoreboard players remove @s defense.kill 1

function core:defense/scoreboard/get_highest