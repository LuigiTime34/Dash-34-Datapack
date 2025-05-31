tellraw @s {"text": "New mob found!\nSkeleton\nSpeed: 1.8 BPS\nHealth: 15\nWears armor, taking reduced damage from all attacks.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
