# Fan loop
execute if score $fan-timer parkour matches 1..2 run scoreboard players add $fan-timer parkour 1
execute if score $fan-timer parkour matches 3 as @e[tag=fan,tag=!dead-fan] at @s if entity @p[distance=..40,gamemode=adventure] run function core:parkour/fan/fan_loop
execute if score $fan-timer parkour matches 3 run scoreboard players set $fan-timer parkour 1
function core:parkour/fan/play_sound
# Block abilities detection
execute as @p[gamemode=adventure] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:black_terracotta"}}}} run function core:parkour/blocks/gravity_up
execute as @p[gamemode=adventure] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:light_gray_terracotta"}}}} run function core:parkour/blocks/gravity_down
execute as @p[gamemode=adventure] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:gray_terracotta"}}}} run function core:parkour/blocks/gravity_normal
execute as @p[gamemode=adventure] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:pink_terracotta"}}}} run effect give @s minecraft:speed 1 4 false
execute as @p[gamemode=adventure] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:lime_terracotta"}}}} run effect give @s minecraft:jump_boost 1 4 false
# Windcharge fanagling
execute as @a[tag=!has-wind-charge,gamemode=adventure] at @s unless entity @e[type=minecraft:wind_charge] unless items entity @s container.* minecraft:wind_charge unless items entity @s player.cursor minecraft:wind_charge if block ~ ~-.01 ~ minecraft:white_terracotta run function core:parkour/wind_charge/give
execute as @a[gamemode=adventure] if items entity @s container.* minecraft:wind_charge[minecraft:count~{min:2}] run function core:parkour/wind_charge/clear_extra
execute as @e[type=minecraft:wind_charge] run schedule function core:parkour/wind_charge/cooldown_end 2t replace
# Checkpoint detect
execute as @p[gamemode=adventure] at @s if block ~ ~ ~ polished_blackstone_pressure_plate run function core:parkour/checkpoint
# Fail detect
execute as @p[gamemode=adventure] at @s if block ~ ~-1.1 ~ minecraft:orange_stained_glass run function core:parkour/fail
execute as @a[tag=parkour-started,tag=!parkour-done] at @s unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:gray_terracotta"}}}} unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:light_gray_terracotta"}}}} unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:black_terracotta"}}}} run title @s actionbar ["",{"text":"☠ ","color":"gold"},{"score":{"name":"$deaths","objective":"parkour"},"color":"gold"},{"text":" | 🔧 ","color":"gold"},{"score":{"name":"$gears","objective":"parkour"},"color":"gold"},{"text":" | ⌛ ","color":"gold"},{"score":{"name":"#timerminutes2","objective":"timer"},"color":"gold"},{"text":":","color":"gold"},{"score":{"name":"#timerseconds2","objective":"timer"},"color":"gold"}]
# execute at @a run kill @e[type=minecraft:wind_charge,distance=50..]
# Give night vision after first checkpoint
effect give @a[tag=parkour-started,tag=!parkour-done] night_vision 1 0 true
# Smoke particles around the pipes
execute as @e[tag=pipe-marker] at @s run particle minecraft:smoke ~ ~ ~ 0.4 1 0.4 0 10 force
# Gear particles
execute at @e[type=item,nbt={Item:{id:"minecraft:chain",components:{"minecraft:custom_data":{gear:1b}}}}] run particle minecraft:enchanted_hit ~ ~ ~ 0.125 0.2 0.125 0 1
# Gear pickup detect
execute as @a if items entity @s hotbar.* *[custom_data~{gear:1b}] run function core:parkour/gears/collected