tellraw @s {"text": "New mob found!\nZombie\nSpeed: 1.0 BPS\nHealth: 10\nYour basic, standard mob.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
