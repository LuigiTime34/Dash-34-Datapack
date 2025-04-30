tellraw @s {"text": "New mob found!\nHusk\nSpeed: 1 BPS\nHealth: 50\nDestructive: Deals 20 extra damage to your base", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
