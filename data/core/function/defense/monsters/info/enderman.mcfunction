tellraw @s {"text": "New mob found!\nEnderman\nSpeed: 0.9 BPS\nHealth: 50\nBlink: Every 10 seconds, teleports forward", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
