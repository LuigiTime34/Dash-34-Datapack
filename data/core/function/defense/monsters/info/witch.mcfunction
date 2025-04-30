tellraw @s {"text": "New mob found!\nWitch\nSpeed: 0.7 BPS\nHealth: 40\nBrewer: Heals nearby monsters in a small radius over time", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
