execute on passengers as @s[tag=defense.bee,type=bee] store result score @s defense.money run attribute @s attack_damage get
execute on passengers as @s[tag=defense.bee,type=bee] if score @s defense.money matches 1.. run function core:defense/towers/bee/add_money with storage core:defense.bee_damage
$execute on passengers as @s[tag=defense.bee,type=bee,tag=!defense.short_bee] run damage @n[tag=defense-monster,tag=!defense-baby_zombie,tag=!defense-chicken,tag=!defense-silverfish,tag=!defense-endermite,tag=!defense-spider,tag=!defense-zoglin] $(damage) core:defense/sting by @p
$execute on passengers as @s[tag=defense.bee,type=bee,tag=defense.short_bee] run damage @n[tag=defense-monster,tag=!defense-silverfish] $(damage) core:defense/sting by @p
playsound entity.bee.sting master @a ~ ~ ~ 1 1
execute on passengers run kill @s
kill @s