execute as @s[tag=defense-creeper] run function core:defense/monsters/abilities/creeper_convert_to_charged
$damage @s[tag=!defense-breeze] $(damage) core:defense/wind_charge by @p
# $scoreboard players set @s[tag=!defense-stray] defense.element.ice_power $(freeze_power)
# $scoreboard players set @s defense.storm.freeze_timer $(freeze_time)
# $scoreboard players set @s[tag=defense-stray] defense.element.ice_power -$(freeze_power)
tag @s remove defense-target
playsound minecraft:entity.turtle.egg_break master @a ~ ~ ~ 1 0.5
particle minecraft:item_snowball ~ ~ ~ 0.2 1 0.2 0 50
playsound minecraft:entity.breeze.wind_burst master @a ~ ~ ~ 1 2
particle minecraft:gust_emitter_small ~ ~ ~ 0.1 0.1 0.1 0 3
summon lightning_bolt ~ ~-10 ~
summon minecraft:marker ~ -57 ~ {Tags:["storm.freeze_storm"]}
execute as @n[tag=storm.freeze_storm] run scoreboard players set @s defense.towers 100
playsound entity.breeze.idle_ground master @a ~ ~ ~ 1
execute if entity @s[tag=defense-zoglin] run return 0
execute if entity @s[tag=defense-skeleton] on vehicle run return run function core:defense/towers/storm/spider_jockey_fallback {"blow_power":"$(blow_power)"}
$tp @s ^ ^ ^-$(blow_power)
tag @s add chosen-path