execute as @e[tag=defense-spider] on passengers on vehicle run tag @s add defense.bomb_immunity
$execute as @e[tag=defense-monster,distance=..$(range),tag=!defense.bomb_immunity] run damage @s $(damage) core:defense/arrow by @p
execute as @e[tag=defense-spider] run tag @s remove defense.bomb_immunity
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 2 1.5
particle explosion_emitter ~ ~ ~ 0 0 0 0 0
kill @s