# End of path
execute if block ~ ~-0.1 ~ black_concrete run function core:defense/monsters/reached_end
# Determine Speed
execute store result score @s defense.speed run attribute @s attack_knockback base get
# Move
function core:defense/monsters/movement/determine_speed
# Intersection
execute if entity @s[tag=!chosen-path] if block ~ ~-0.1 ~ ochre_froglight if entity @n[type=marker,tag=defense-intersection,distance=..0.2] run function core:defense/intersection/decide_turn
execute if entity @s[tag=chosen-path] if block ~ -63 ~ white_concrete run tag @s remove chosen-path