tellraw @s {"text": "New mob found!\nBogged\nSpeed: 1.2 BPS\nHealth: 60\nRegrowth: Passively heals every second", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
