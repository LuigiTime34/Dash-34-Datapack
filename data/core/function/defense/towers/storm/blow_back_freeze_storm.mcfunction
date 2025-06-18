$function core:defense/towers/storm/blow_back {"blow_power":"$(blow_power)","damage":"$(damage)"}
playsound minecraft:entity.turtle.egg_break master @a ~ ~ ~ 1 0.5
playsound entity.breeze.idle_ground master @a ~ ~ ~ 1
particle minecraft:item_snowball ~ ~ ~ 0.2 1 0.2 0 50
summon minecraft:marker ~ -57 ~ {Tags:["storm.freeze_storm"]}
execute as @n[tag=storm.freeze_storm] run scoreboard players set @s defense.towers 100