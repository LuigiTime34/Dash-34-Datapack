scoreboard players set $wave_track defense.wave 1
$function core:defense/monsters/waves/wave$(wave)
execute if score $wave_level defense.wave matches 5 run function core:defense/monsters/waves/destroy_tower
execute if score $wave_level defense.wave matches 10 run function core:defense/monsters/waves/destroy_tower2
title @a times 20 60 10
title @a title ["",{"text":"\uF903\u0009WAVE ","color":"#26FF06", "font":"retitled_titles:regular"},{"score":{"name":"$wave_level","objective":"defense.wave"},"color":"#26FF06","font":"retitled_titles:regular"},{"text":"\u000A","font":"retitled_titles:regular","color":"#26FF06"}]
playsound event.raid.horn master @a ~ ~ ~ 100000000000000000000