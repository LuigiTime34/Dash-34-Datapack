$scoreboard players add $money defense.money $(sell_cost)
$tellraw @a[tag=!defense.selling_all] {"text":"+$(sell_cost) gold!","color":"gold"}

function core:defense/scoreboard/get_highest