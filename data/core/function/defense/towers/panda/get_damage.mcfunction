tag @s add defense.panda_boo_attacked
execute store result storage core:panda_damage damage int 1 run scoreboard players get @s defense.panda_boo_damage
execute as @n[tag=defense-monster] run function core:defense/towers/panda/deal_damage with storage core:panda_damage
#execute at @s as @e[tag=defense-monster] if score @s UUID = @n[tag=defense.panda_boo] UUID run function core:defense/towers/panda/deal_damage with storage core:panda_damage