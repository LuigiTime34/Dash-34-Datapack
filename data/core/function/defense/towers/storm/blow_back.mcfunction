execute as @s[tag=defense-creeper] run function core:defense/monsters/abilities/creeper_convert_to_charged
$damage @s[tag=!defense-breeze] $(damage) core:defense/wind_charge by @p
tag @s remove defense-target
playsound minecraft:entity.breeze.wind_burst master @a ~ ~ ~ 1 2
particle minecraft:gust_emitter_small ~ ~ ~ 0.1 0.1 0.1 0 3
summon lightning_bolt ~ ~-10 ~
execute if entity @s[tag=defense-warden] run return fail
$execute if entity @s[tag=defense-skeleton] on vehicle at @s run return run function core:defense/towers/storm/spider_jockey_fallback {"blow_power":"$(blow_power)"}
$tp @s ^ ^ ^-$(blow_power)
$data modify storage core:defense.storm_blowback power set value $(blow_power)
execute store result score $blow_power defense.distance run data get storage core:defense.storm_blowback power 200
scoreboard players operation @s defense.distance -= $blow_power defense.distance