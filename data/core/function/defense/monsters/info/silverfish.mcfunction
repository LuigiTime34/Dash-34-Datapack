title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "New mob found!\nSilverfish\nSpeed: 3.2 BPS\nHealth: 30\nBurrows underground for 2s every 3s, regenerating 3 health and becoming immune to damage. Immune to bees.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
