setblock ~ ~ ~ lava
execute positioned ^ ^ ^1 run playsound minecraft:item.bottle.fill master @a ~ ~ ~ 10 0.5
execute positioned ^ ^ ^1 run playsound minecraft:block.fire.extinguish master @a ~ ~ ~ 10 0.7
execute positioned ^ ^ ^1 run particle lava ~ ~ ~ 0.125 0.125 0.5 0 100