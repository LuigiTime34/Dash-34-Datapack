place template core:defense/castle/25_health -69 -59 97
particle minecraft:explosion -63 -51 116 2 4 10 0 100 force
execute positioned -64 -59 116 run playsound entity.wither.break_block master @a ~ ~ ~ 1000000 0.5
tellraw @a {"text":"The castle has little remaining health!","color":"red"}