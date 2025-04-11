tag @s add defense.queen-bee_attacked
scoreboard players set @s defense.bee_tower 10
$damage @n[tag=defense-monster] $(damage) core:defense/sting by @p
playsound entity.bee.sting master @a ~ ~ ~ 1 1
execute on passengers unless data entity @s {Health:1.0f} run return run damage @s 1 minecraft:out_of_world
execute on passengers run kill @s
kill @s