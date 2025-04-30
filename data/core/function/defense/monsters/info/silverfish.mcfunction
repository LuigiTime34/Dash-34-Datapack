tellraw @s {"text": "New mob found!\nSilverfish\nSpeed: 1.8 BPS\nHealth: 20\nBurrower: Every 5-10 seconds, burrows into the ground. When burrowed it can't move and cant be attacked, but gains regeneration", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
