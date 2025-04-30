tellraw @s {"text": "New mob found!\nZombified Piglin\nSpeed: 0.9 BPS\nHealth: 40\nReinforcements: 75% chance when damaged to summon another Zombie Piglin nearby with the same current health. Immune being set on fire.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
