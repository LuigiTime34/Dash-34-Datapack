execute as @s[tag=defense-creeper] run function core:defense/monsters/abilities/creeper_convert_to_charged
$damage @s $(damage) core:defense/wind_charge by @p
tag @s remove defense-target
playsound minecraft:entity.breeze.wind_burst master @a ~ ~ ~ 1 2
particle minecraft:gust_emitter_small ~ ~ ~ 0.1 0.1 0.1 0 3
summon lightning_bolt ~ ~-10 ~
execute if score $ravager_idx defense.boss_animation matches 1.. if entity @s[tag=defense-ravager] run return 0
execute if entity @s[tag=defense-zoglin] run return 0
$execute if entity @s[tag=defense-skeleton] on vehicle at @s run return run function core:defense/towers/storm/spider_jockey_fallback {"blow_power":"$(blow_power)"}
$tp @s ^ ^ ^-$(blow_power)
tag @s add chosen-path