execute unless entity @e[tag=defense-monster,tag=!defense-new_giant_reinforcement,limit=1,distance=..0.9] run return fail
execute anchored feet run tp @s ^ ^ ^-0.7
scoreboard players remove @s defense.distance 140
execute at @s run function core:defense/monsters/boss/giant/reinforcements_kb_loop