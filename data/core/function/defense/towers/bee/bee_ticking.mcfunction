rotate @s facing entity @n[tag=defense-monster] eyes
tp @s ^ ^ ^0.1
execute as @n[tag=defense.bee] run rotate @s facing entity @n[tag=defense-monster]

execute on passengers at @s positioned ~ -59 ~ if entity @n[tag=defense-monster,distance=..2] run rotate @s ~-180 ~
execute positioned ~-0.5 ~ ~-0.5 if entity @n[tag=defense-monster,dx=0] run function core:defense/towers/bee/get_damage