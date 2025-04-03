execute if score $wave_animation defense.wave matches 15 run scoreboard players set $wave_animation defense.wave 1
execute if score $wave_animation defense.wave matches 1 run scoreboard objectives modify defense.display displayname {"text":"W","color":"aqua"}
execute if score $wave_animation defense.wave matches 2 run scoreboard objectives modify defense.display displayname {"text":"Wa","color":"aqua"}
execute if score $wave_animation defense.wave matches 3 run scoreboard objectives modify defense.display displayname {"text":"Wav","color":"aqua"}
execute if score $wave_animation defense.wave matches 4 run scoreboard objectives modify defense.display displayname {"text":"Wave","color":"aqua"}
execute if score $wave_animation defense.wave matches 5 run scoreboard objectives modify defense.display displayname {"text":"Wave ","color":"aqua"}
execute if score $wave_animation defense.wave matches 6 run scoreboard objectives modify defense.display displayname {"text":"Wave c","color":"aqua"}
execute if score $wave_animation defense.wave matches 7 run scoreboard objectives modify defense.display displayname {"text":"Wave co","color":"aqua"}
execute if score $wave_animation defense.wave matches 8 run scoreboard objectives modify defense.display displayname {"text":"Wave com","color":"aqua"}
execute if score $wave_animation defense.wave matches 9 run scoreboard objectives modify defense.display displayname {"text":"Wave comp","color":"aqua"}
execute if score $wave_animation defense.wave matches 10 run scoreboard objectives modify defense.display displayname {"text":"Wave compl","color":"aqua"}
execute if score $wave_animation defense.wave matches 11 run scoreboard objectives modify defense.display displayname {"text":"Wave comple","color":"aqua"}
execute if score $wave_animation defense.wave matches 12 run scoreboard objectives modify defense.display displayname {"text":"Wave complet","color":"aqua"}
execute if score $wave_animation defense.wave matches 13 run scoreboard objectives modify defense.display displayname {"text":"Wave complete","color":"aqua"}
execute if score $wave_animation defense.wave matches 14 run scoreboard objectives modify defense.display displayname {"text":"Wave complete!","color":"aqua"}
scoreboard players add $wave_animation defense.wave 1
execute unless score $wave_animation defense.wave matches 15 run schedule function core:defense/monsters/waves/animation 1t