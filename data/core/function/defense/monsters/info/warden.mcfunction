tellraw @s {"text": "New mob found!\nWarden\nSpeed: 1.5\nHealth: 1000\nHas permanent armor. Whenever a mob dies nearby, creates sculk that causes mobs to move faster. Every 5s, sends a sonic boom that disables a nearby tower.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
