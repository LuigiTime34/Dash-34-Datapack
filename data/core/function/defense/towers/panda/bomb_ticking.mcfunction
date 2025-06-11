execute positioned ~ -49 ~ if entity @s[distance=..0.3] as @e[tag=defense.panda_landing] if score @s UUID = @n[tag=defense.panda_tnt] UUID run rotate @n[tag=defense.panda_tnt] facing entity @s
execute at @e[tag=defense.panda_landing,distance=..0.3] if score @s UUID = @n[tag=defense.panda_landing] UUID run function core:defense/towers/panda/get_damage_bomb
tp @s ^ ^ ^0.3

execute as @e[tag=defense.panda_landing,distance=20..] if score @s UUID = @n[tag=defense.panda_tnt] UUID as @n[tag=defense.panda_tnt] run function core:defense/towers/panda/bomb_failsafe