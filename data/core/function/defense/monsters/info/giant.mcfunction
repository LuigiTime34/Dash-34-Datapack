tellraw @s {"text": "New mob found!\nGiant\nSpeed: 1.4\nHealth: 400\nDeals 50 extra base damage. Every 12s, jumps into the air and sends a shockwave in all directions, disabling nearby towers.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
