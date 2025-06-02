tellraw @s {"text": "New mob found!\nZombie\nSpeed: 1.8 BPS\nHealth: 20\nYour basic, standard mob.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
