title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "Charged Creeper\nSpeed: 2.3 BPS\nHealth: 70\nCreated when a Creeper is struck by lightning; disables nearby towers temporarily upon death.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
