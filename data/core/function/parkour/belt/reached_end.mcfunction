data modify storage core:belt_location x set from entity @n[tag=conveyer-end] data.endpos[0]
data modify storage core:belt_location y set from entity @n[tag=conveyer-end] data.endpos[1]
data modify storage core:belt_location z set from entity @n[tag=conveyer-end] data.endpos[2]
kill @s
scoreboard players reset $randombelt parkour
execute store result score $randombelt parkour run random value 1..7
execute if score $randombelt parkour matches 1 run data modify storage core:belt_location block set value barrel
execute if score $randombelt parkour matches 2 run data modify storage core:belt_location block set value deepslate_emerald_ore
execute if score $randombelt parkour matches 3 run data modify storage core:belt_location block set value raw_gold_block
execute if score $randombelt parkour matches 4 run data modify storage core:belt_location block set value deepslate_diamond_ore
execute if score $randombelt parkour matches 5 run data modify storage core:belt_location block set value deepslate_iron_ore
execute if score $randombelt parkour matches 6 run data modify storage core:belt_location block set value deepslate_gold_ore
execute if score $randombelt parkour matches 7 run data modify storage core:belt_location block set value redstone_block
execute store result score $randombelt parkour run random value 1..7
execute if score $randombelt parkour matches 7 run data modify storage core:belt_location block set value redstone_block
function core:parkour/belt/new_block with storage core:belt_location