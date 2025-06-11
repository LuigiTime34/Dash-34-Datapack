title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "Endermite\nSpeed: 3.4 BPS\nHealth: 30\nMoves fast; its short height makes it immune to bee towers.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
