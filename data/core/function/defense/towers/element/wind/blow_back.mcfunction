$tp @s ^ ^ ^-$(blow_power)
tag @s add chosen-path
$damage @s $(damage) core:defense/falling_wind_charge by @p
playsound minecraft:entity.breeze.wind_burst master @a ~ ~ ~ 1 2
particle minecraft:gust_emitter_small ~ ~ ~ 0.1 0.1 0.1 0 1