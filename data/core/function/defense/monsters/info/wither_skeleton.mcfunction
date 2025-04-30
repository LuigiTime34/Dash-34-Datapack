tellraw @s {"text": "New mob found!\nWither Skeleton\nSpeed: 0.8 BPS\nHealth: 60\nBeserk: When below half health, doubles in Speed", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
