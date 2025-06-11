$scoreboard players add $money defense.money $(money)
scoreboard players set $recent_kill defense.money 20
$scoreboard players add $recent_money defense.money $(money)
execute at @s run playsound block.beehive.enter master @a ~ ~ ~ 5 2
execute at @s run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 5 1.6
function core:defense/scoreboard/get_highest
$scoreboard players set $bee.money_made defense.money $(money)
execute if score $bee.money_made defense.money matches 1.. at @n[tag=defense-monster] run function core:defense/towers/bee/gold_icon/summon
execute if score $bee.money_made defense.money matches 2.. at @n[tag=defense-monster] run function core:defense/towers/bee/gold_icon/summon
execute if score $bee.money_made defense.money matches 3.. at @n[tag=defense-monster] run function core:defense/towers/bee/gold_icon/summon