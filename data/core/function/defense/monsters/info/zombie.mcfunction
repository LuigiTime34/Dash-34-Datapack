tellraw @s {"text": "New mob found!\nZombie\nSpeed: 0.4 BPS\nHealth: 5", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
tellraw @s ["",{"text":"TIP: Press ","color":"green"},{"keybind":"key.advancements","color":"green"},{"text":" to view mob stats and abilities.","color":"green"}]