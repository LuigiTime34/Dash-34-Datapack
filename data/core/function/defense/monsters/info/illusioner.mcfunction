tellraw @s {"text": "New mob found!\nIllusioner\nSpeed: 1.5 BPS\nHealth: 400\nEvery 7.5s, Summons decoy clones of itself. Decoys make towers target itself but can't deal damage to your base.", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
