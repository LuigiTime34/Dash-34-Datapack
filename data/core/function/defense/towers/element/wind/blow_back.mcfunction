$damage @s $(damage) core:defense/wind_charge by @p
playsound minecraft:entity.breeze.wind_burst master @a ~ ~ ~ 1 2
particle minecraft:gust_emitter_small ~ ~ ~ 0.1 0.1 0.1 0 1
execute if score $ravager_idx defense.boss_animation matches 1.. if entity @s[tag=defense-ravager] run return 0
$tp @s ^ ^ ^-$(blow_power)
tag @s add chosen-path