tellraw @s {"text": "New mob found!\nEndermite\nSpeed: 2 BPS\nHealth: 20\nParasitic: Has a %50 chance of spawning every time an enderman teleports", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
