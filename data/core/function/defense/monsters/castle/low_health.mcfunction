place template core:defense/castle/25_health -69 -59 97
execute positioned -64 -59 116 run playsound entity.wither.break_block master @a ~ ~ ~ 1000000 0.5
tellraw @a {"text":"The castle has little remaining health!","color":"red"}