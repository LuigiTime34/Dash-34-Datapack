title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "New mob found!\nEnderman\nSpeed: 2.3 BPS\nHealth: 90\nPeriodically teleports 6 blocks ahead on the path; Has a 20% chance to summon an Endermite when teleporting.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
