execute as @s[tag=defense-spider] on passengers on vehicle run return fail
$damage @s $(damage) core:defense/arrow by @p
playsound minecraft:entity.player.attack.crit master @a ~ ~ ~ 10 1.3