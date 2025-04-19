data remove entity @n[tag=atm-interaction-down] interaction

data merge entity @n[tag=atm-display-down] {start_interpolation:0,interpolation_duration:0, transformation: {left_rotation: [0.09229594f, -0.70105743f, 0.09229594f, 0.70105743f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.5f, 0.5f, 0.5f], translation: [0.1f, 0.0f, 0.0f]}}
schedule function core:defense/atm/button_release_down 2t append

execute positioned -67 -59 106 run playsound minecraft:block.crafter.craft master @a ~ ~ ~ 5 1

execute unless score $emerald_cost defense.money matches 1 run scoreboard players remove $gold_cost defense.money 25
execute unless score $emerald_cost defense.money matches 1 run scoreboard players remove $emerald_cost defense.money 1

# Update displays
data modify entity @n[tag=gold-text-display] text set value '{"bold":true,"color":"gold","score":{"name":"$gold_cost","objective":"defense.money"}}'
data modify entity @n[tag=emerald-text-display] text set value '{"bold":true,"color":"green","score":{"name":"$emerald_cost","objective":"defense.money"}}'

execute positioned -67 -59 106 if score $emerald_cost defense.money matches 1 run return run playsound minecraft:block.note_block.didgeridoo master @a ~ ~ ~ 2

# Play sound (C scale)
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 2 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 0.7
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 3 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 0.8
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 4 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 0.9
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 5 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 0.95
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 6 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 1.05
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 7 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 1.2
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 8 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 1.35
execute positioned -67 -59 106 if score $emerald_cost defense.money matches 9 run playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 1.4