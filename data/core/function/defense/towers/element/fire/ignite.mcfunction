$scoreboard players set @s defense.towers $(cooldown)
$data modify entity @s Fire set value $(ignite_time)
$damage @s $(damage) on_fire
particle flame ~ ~ ~ 0.5 2 0.5 0 200 force
playsound minecraft:item.firecharge.use master @a ~ ~ ~ 1 0.7