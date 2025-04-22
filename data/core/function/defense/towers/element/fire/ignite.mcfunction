$data modify entity @s Fire set value $(ignite_time)
$damage @s[tag=!defense-blaze] $(damage) core:defense/on_fire by @p
particle flame ~ ~ ~ 0.5 2 0.5 0 200 force
playsound minecraft:item.firecharge.use master @a ~ ~ ~ 1 0.7