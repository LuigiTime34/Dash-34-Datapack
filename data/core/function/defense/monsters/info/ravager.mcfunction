tellraw @s {"text": "New mob found!\nRavager\nSpeed: 1.25 BPS\nHealth: 1000\nDeals 100 extra base damage. Every 15s, rams the nearest tower, disabling it for 5s. 10% chance to speed up when damaged.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
