$scoreboard players set @s defense.slowness $(freeze_power)
$scoreboard players set @s defense.element.freeze_timer $(freeze_time)
$damage @s $(damage) freeze by @p
playsound minecraft:entity.turtle.egg_break master @a ~ ~ ~ 1 2
particle minecraft:item_snowball ~ ~ ~ 0.2 1 0.2 0 50