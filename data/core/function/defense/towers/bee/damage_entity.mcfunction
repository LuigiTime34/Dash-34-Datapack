execute on passengers store result score @s defense.money run attribute @s attack_damage get
execute on passengers if score @s defense.money matches 1.. run function core:defense/towers/bee/add_money with storage core:defense.bee_damage
$damage @n[tag=defense-monster] $(damage) core:defense/sting by @p
playsound entity.bee.sting master @a ~ ~ ~ 1 1
execute on passengers run kill @s
kill @s