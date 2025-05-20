tellraw @s {"text": "New mob found!\nStray\nSpeed: 1.2 BPS\nHealth: 60\nSpeeds up when hit by ice rather then being slowed down.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
