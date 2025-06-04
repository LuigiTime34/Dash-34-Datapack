title @s actionbar {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text":"New mob found!", "color": "red", "bold":true}
tellraw @s {"text": "New mob found!\nStray\nSpeed: 2.6 BPS\nHealth: 80\nSpeeds up when hit by ice rather then being slowed down.", "color": "red"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
