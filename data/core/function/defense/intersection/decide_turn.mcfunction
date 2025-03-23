scoreboard players reset @s defense
scoreboard players reset @s defense.intersection
execute if block ~ ~-2 ~ green_glazed_terracotta run function core:defense/intersection/basic_turn
execute if block ~ ~-2 ~ pink_glazed_terracotta run function core:defense/intersection/red_gray
execute if block ~ ~-2 ~ orange_glazed_terracotta run function core:defense/intersection/yellow_orange
execute if block ~ ~-2 ~ yellow_glazed_terracotta run function core:defense/intersection/yellow_gray
execute if block ~ ~-2 ~ gray_glazed_terracotta run function core:defense/intersection/orange_gray
execute if block ~ ~-2 ~ red_glazed_terracotta run function core:defense/intersection/yellow_red
execute if block ~ ~-2 ~ black_glazed_terracotta run function core:defense/intersection/orange_red
execute align xz positioned ~ ~ ~ run tp @s ~0.5 ~ ~0.5
tag @s add chosen-path