tellraw @s {"text": "New mob found!\nCreeper\nSpeed: 1 BPS\nHealth: 40\nExplosive: Deals 10 extra damage to your base", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
