schedule function core:defense/scoreboard/wave_timer 1s
execute if score $wave_timer defense.wave matches 10..20 as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 5
execute if score $wave_timer defense.wave matches 1.. run scoreboard players remove $wave_timer defense.wave 5
scoreboard players operation $wave_timer defense.wave /= $wave_timer5 defense.wave
execute if score $wave_timer defense.wave matches 1 run schedule function core:defense/monsters/waves/get_wave 1s
function core:defense/scoreboard/get_highest
scoreboard players operation $wave_timer defense.wave *= $wave_timer5 defense.wave