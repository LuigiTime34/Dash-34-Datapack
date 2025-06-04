title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "New mob found!\nWitch\nSpeed: 2.1 BPS\nHealth: 50\nRegenerates itself and all nearby non-witch enemies for 4 health every 4s.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
