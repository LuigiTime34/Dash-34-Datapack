tellraw @s {"text": "New mob found!\nSkeleton\nSpeed: 0.8 BPS\nHealth: 10", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
