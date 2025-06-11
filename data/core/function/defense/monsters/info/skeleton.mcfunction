title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "Skeleton\nSpeed: 2.2 BPS\nHealth: 25\nWears armor, taking reduced damage from all attacks.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
