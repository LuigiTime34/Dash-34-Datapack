title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "Iron Golem\nSpeed: 2.2 BPS\nHealth: 250\nMakes all towers focus fire on itself, with permanent armor to reduce incoming attacks.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
