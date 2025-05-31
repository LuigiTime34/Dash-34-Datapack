tellraw @s {"text": "New mob found!\nBogged\nSpeed: 2.2 BPS\nHealth: 60\nRegenerates 2 health per second; doubles movement speed when below half health, returns to normal speed if healed above half.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
