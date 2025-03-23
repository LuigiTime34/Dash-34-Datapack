data remove entity @n[tag=atm-interaction-buy] interaction

data merge entity @n[tag=atm-display-buy] {start_interpolation:0,interpolation_duration:0, transformation: {left_rotation: [0.09229594f, 0.70105743f, -0.09229594f, 0.70105743f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.5f, 0.5f, 0.5f], translation: [0.1f, 0.0f, 0.0f]}}

schedule function core:defense/atm/button_release_buy 2t append

execute positioned 2 -59 108 run playsound minecraft:block.crafter.craft master @a ~ ~ ~ 5 1

execute store result storage core:defense_atm gold_cost int 1 run scoreboard players get $gold_cost defense.money
execute store result storage core:defense_atm emerald_cost int 1 run scoreboard players get $emerald_cost defense.money
function core:defense/atm/purchase with storage core:defense_atm