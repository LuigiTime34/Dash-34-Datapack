title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "New mob found!\nZoglin\nSpeed: 2.5 BPS\nHealth: 150\nShort height makes it immune to bee towers; deals 50 extra damage to your base and is immune to knockback.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
