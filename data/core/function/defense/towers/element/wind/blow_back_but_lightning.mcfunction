$tp @s ^ ^ ^-$(blow_power)
tag @s add chosen-path
$damage @s $(damage) wind_charge by @p
playsound minecraft:entity.breeze.wind_burst master @a ~ ~ ~ 1 2
particle minecraft:gust_emitter_small ~ ~ ~ 0.1 0.1 0.1 0 1
summon lightning_bolt ~ ~-10 ~