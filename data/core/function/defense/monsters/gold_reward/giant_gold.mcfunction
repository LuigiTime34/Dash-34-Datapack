advancement revoke @s only core:defense/mobs/gold_reward/giant_reward

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0
scoreboard players remove $mobs_left defense.wave 1

scoreboard players add $money defense.money 50
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money 50

function core:defense/scoreboard/get_highest

execute unless score $defense.health defense.damage matches ..0 run function core:defense/end/end {"outcome":"win"}