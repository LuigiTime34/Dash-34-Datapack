$damage @n[tag=defense-monster] $(damage) core:defense/sting by @p
playsound entity.bee.sting master @a ~ ~ ~ 1 1
execute on passengers run kill @s
kill @s