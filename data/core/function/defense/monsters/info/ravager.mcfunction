title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "Ravager\nSpeed: 2 BPS\nHealth: 400\nCan damage itself to speed up for a short period of time. Has a 10% chance to speed up when damaged.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
