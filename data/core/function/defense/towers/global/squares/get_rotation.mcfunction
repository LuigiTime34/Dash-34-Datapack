# Initialize tower rotation to -999 (invalid)
scoreboard players set $bee_highlight defense.rotation -999

# Check player rotation and set tower rotation if path exists in that direction
execute as @p[gamemode=adventure] if score @s defense.rotation matches -45..45 if block ~ -60 ~-5 #core:path_blocks run scoreboard players set $bee_highlight defense.rotation 180
execute as @p[gamemode=adventure] if score @s defense.rotation matches 46..135 if block ~5 -60 ~ #core:path_blocks run scoreboard players set $bee_highlight defense.rotation -90
execute as @p[gamemode=adventure] if score @s defense.rotation matches 136..180 if block ~ -60 ~5 #core:path_blocks run scoreboard players set $bee_highlight defense.rotation 0
execute as @p[gamemode=adventure] if score @s defense.rotation matches -180..-135 if block ~ -60 ~5 #core:path_blocks run scoreboard players set $bee_highlight defense.rotation 0
execute as @p[gamemode=adventure] if score @s defense.rotation matches -136..-44 if block ~-5 -60 ~ #core:path_blocks run scoreboard players set $bee_highlight defense.rotation 90

# If no path found in player's direction, find closest available path
execute if score $bee_highlight defense.rotation matches -999 if block ~ -60 ~-5 #core:path_blocks run scoreboard players set $bee_highlight defense.rotation 180
execute if score $bee_highlight defense.rotation matches -999 if block ~5 -60 ~ #core:path_blocks run scoreboard players set $bee_highlight defense.rotation -90
execute if score $bee_highlight defense.rotation matches -999 if block ~ -60 ~5 #core:path_blocks run scoreboard players set $bee_highlight defense.rotation 0
execute if score $bee_highlight defense.rotation matches -999 if block ~-5 -60 ~ #core:path_blocks run scoreboard players set $bee_highlight defense.rotation 90

execute store result storage core:defense.bee_highlight rotation int 1 run scoreboard players get $bee_highlight defense.rotation
function core:defense/towers/global/squares/highlight_path with storage core:defense.bee_highlight