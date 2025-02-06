# End of path
execute if block ~ ~-0.1 ~ black_concrete run function core:defense/monsters/reached_end
# Update health display at start
# execute if entity @n[tag=defense-start,distance=..0.01] run data modify entity @s HurtTime set value 10
# Determine Speed
execute store result score @s defense.speed run attribute @s attack_knockback base get
# Move
function core:defense/monsters/movement/determine_speed
# Intersection
execute if entity @s[tag=!chosen-path] if block ~ ~-0.1 ~ ochre_froglight if entity @n[type=marker,tag=defense-intersection,distance=..0.2] run function core:defense/intersection/decide_turn
execute if entity @s[tag=chosen-path] if block ~ ~-1.1 ~ white_concrete run tag @s remove chosen-path