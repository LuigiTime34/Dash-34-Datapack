tellraw @s {"text": "New mob found!\nCreeper\nSpeed: 1 BPS\nHealth: 60\nDeals bonus damage to player's base if it reaches the end; transforms into Charged Creeper if struck by lightning.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
