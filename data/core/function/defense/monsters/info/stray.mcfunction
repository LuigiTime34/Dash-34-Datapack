tellraw @s {"text": "New mob found!\nStray\nSpeed: 1.2 BPS\nHealth: 50\nFrozen: Gains speed instead of slowness when hit by ice", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
