$scoreboard players add $money defense.money $(sell_cost)
execute store result storage core:wave_number gold float 1 run scoreboard players get $money defense.money
function core:defense/scoreboard/update_gold with storage core:wave_number