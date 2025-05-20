tellraw @s {"text": "New mob found!\nWarden\nSpeed: 1.5 BPS\nHealth: 1000\nHas permanent armor. Every 5s, sends a sonic boom that disables a nearby tower.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
