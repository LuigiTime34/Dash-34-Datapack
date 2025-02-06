scoreboard players set $wave_track defense.wave 1
$function core:defense/monsters/waves/wave$(wave)
execute if score $wave_level defense.wave matches 5 run function core:defense/monsters/waves/destroy_tower
execute if score $wave_level defense.wave matches 10 run function core:defense/monsters/waves/destroy_tower2
title @a times 20 60 10
$title @a title {"text":"Wave $(wave)","color": "red"}
playsound entity.wither.spawn master @a ~ ~ ~ 1000000000000000000000