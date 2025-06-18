# End of path
execute if block ~ -59 ~ black_concrete run function core:defense/monsters/reached_end
# Get initial speed
execute as @e[tag=defense.new_mob] run function core:defense/monsters/movement/set_initial_speed
# Move
function core:defense/monsters/movement/determine_speed
# Fallback in case they go out of bounds :[
execute if block ~ -61 ~ black_glazed_terracotta run tp @s @n[tag=defense-intersection]