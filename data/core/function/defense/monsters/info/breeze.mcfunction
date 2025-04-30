tellraw @s {"text": "New mob found!\nBreeze\nSpeed: 1.0 BPS\nHealth: 65\nDeflect: Redirects projectiles targeting itself to nearby allies", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
