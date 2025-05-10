tellraw @s {"text": "New mob found!\nIllusioner\nSpeed: 0.9 BPS\nHealth: 250\nEvery 15s, summons a random mob from the list of: Husk, Stray, Chicken Jockey, Zombified Piglin TODO: Summons decoys", "color": "green"}
execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1
