tellraw @s {"text": "New mob found!\nZombified Piglin\nSpeed: 2.3 BPS\nHealth: 35\nHas a 75% chance to clone itself when damaged, with the clone having the same health as the original; cannot be healed.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
