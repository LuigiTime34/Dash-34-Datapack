$scoreboard players set @s[tag=!defense-stray] defense.element.ice_power $(freeze_power)
$scoreboard players set @s defense.storm.freeze_timer $(freeze_time)
$scoreboard players set @s[tag=defense-stray] defense.element.ice_power -$(freeze_power)
playsound minecraft:entity.turtle.egg_break master @a ~ ~ ~ 1 0.5
particle minecraft:item_snowball ~ ~ ~ 0.2 1 0.2 0 50
$function core:defense/towers/storm/blow_back {"blow_power":"$(blow_power)","damage":"$(damage)"}