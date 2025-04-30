tellraw @s {"text": "New mob found!\nZombie Villager\nSpeed: 1 BPS\nHealth: 40", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
