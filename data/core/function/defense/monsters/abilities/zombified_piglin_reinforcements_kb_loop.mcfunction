execute unless entity @e[tag=defense-zombified_piglin,tag=!defense-new_piglin,limit=1,distance=..0.6] run return fail
execute anchored feet run tp @s ^ ^ ^-0.4
scoreboard players remove @s defense.distance 80
execute at @s if block ~ -60 ~ grass_block run return run function core:defense/monsters/abilities/zombified_piglin_reinforcements_cap
execute at @s run function core:defense/monsters/abilities/zombified_piglin_reinforcements_kb_loop