tellraw @s {"text": "New mob found!\nRavager\nSpeed: 1.25 BPS\nHealth: 500\nCarries Illusioner. Can damage itself to speed up for a short period of time. Has a 10% chance to speed up when damaged.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
