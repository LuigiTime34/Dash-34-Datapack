$scoreboard players set @s[tag=!defense-stray] defense.element.ice_power $(freeze_power)
$scoreboard players set @s defense.element.freeze_timer $(freeze_time)
$scoreboard players set @s[tag=defense-stray] defense.element.ice_power -$(freeze_power)
$damage @s $(damage) core:defense/freeze by @p
$damage @s[tag=defense-blaze] $(damage) core:defense/freeze by @p
playsound minecraft:entity.turtle.egg_break master @a ~ ~ ~ 1 2
particle minecraft:item_snowball ~ ~ ~ 0.2 1 0.2 0 50