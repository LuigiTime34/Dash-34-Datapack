$scoreboard players add $money defense.money $(money)
scoreboard players set $recent_kill defense.money 20
$scoreboard players add $recent_money defense.money $(money)
execute at @s run playsound block.beehive.enter master @a ~ ~ ~ 5 2
function core:defense/scoreboard/get_highest