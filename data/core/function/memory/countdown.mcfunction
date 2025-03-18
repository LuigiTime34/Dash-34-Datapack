execute unless score $countdown memory matches 1 run schedule function core:memory/countdown 1s
execute unless score $countdown memory matches 1.. run scoreboard players set $countdown memory 10
execute if score $countdown memory matches 10 run title @a actionbar {"text":"10","color":"#00ff40","bold": true}
execute if score $countdown memory matches 9 run title @a actionbar {"text":"9","color":"#1ce238","bold": true}
execute if score $countdown memory matches 8 run title @a actionbar {"text":"8","color":"#38c631","bold": true}
execute if score $countdown memory matches 7 run title @a actionbar {"text":"7","color":"#55aa2a","bold": true}
execute if score $countdown memory matches 6 run title @a actionbar {"text":"6","color":"#718d23","bold": true}
execute if score $countdown memory matches 5 run title @a actionbar {"text":"5","color":"#8d711c","bold": true}
execute if score $countdown memory matches 4 run title @a actionbar {"text":"4","color":"#aa5515","bold": true}
execute if score $countdown memory matches 3 run title @a actionbar {"text":"3","color":"#c6380e","bold": true}
execute if score $countdown memory matches 2 run title @a actionbar {"text":"2","color":"#e21c07","bold": true}
execute if score $countdown memory matches 1 run title @a actionbar {"text":"1","color":"#ff0000","bold": true}
execute if score $countdown memory matches 10 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 1.5
execute if score $countdown memory matches 9 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 1.4
execute if score $countdown memory matches 8 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 1.3
execute if score $countdown memory matches 7 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 1.2
execute if score $countdown memory matches 6 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 1.1
execute if score $countdown memory matches 5 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 1.0
execute if score $countdown memory matches 4 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 0.8
execute if score $countdown memory matches 3 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 0.7
execute if score $countdown memory matches 2 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 0.6
execute if score $countdown memory matches 1 run playsound block.note_block.hat master @a ~ ~ ~ 100000000 0.5
execute if score $countdown memory matches 1.. run scoreboard players remove $countdown memory 1