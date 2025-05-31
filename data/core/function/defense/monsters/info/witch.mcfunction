tellraw @s {"text": "New mob found!\nWitch\nSpeed: 1.7 BPS\nHealth: 70\nRegenerates 8 health and heals nearby enemies for 4 health every four seconds.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
