# particle ring
execute positioned ^ ^ ^1 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^2 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^3 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^4 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^5 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^6 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^7 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^8 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^9 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^10 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal
execute positioned ^ ^ ^11 if block ~ -60 ~ #core:path_blocks positioned ~ -58.9 ~ run particle block_marker{block_state:{Name:oxeye_daisy}} ~ ~ ~ ^ ^ ^ 0 0 normal

scoreboard players add @s defense.range_indicator 1
execute if score @s defense.range_indicator matches ..4 rotated ~90 0 run function core:defense/towers/bee/money_rain with storage core:defense.money_rain
execute if score @s defense.range_indicator matches 5.. run scoreboard players reset @s defense.range_indicator