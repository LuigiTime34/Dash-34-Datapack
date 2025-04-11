data modify storage core:defense.bee_damage damage set from entity @n[tag=defense.bee] Health
execute on passengers positioned ~ -59 ~ if entity @e[tag=upgrade_money2,tag=bee-center-marker,distance=..10,limit=1] run attribute @s attack_damage modifier add core:honey_rain 1 add_value
execute on passengers store result storage core:defense.bee_damage money int 1 run attribute @s attack_damage get
execute on passengers as @s[tag=!defense.queen-bee] on vehicle run function core:defense/towers/bee/damage_entity with storage core:defense.bee_damage
execute on passengers as @s[tag=defense.queen-bee] on vehicle as @s[tag=!defense.queen-bee_attacked] run function core:defense/towers/bee/queen_damage_entity with storage core:defense.bee_damage