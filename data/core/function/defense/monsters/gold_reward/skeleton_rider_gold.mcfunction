advancement revoke @s only core:defense/mobs/gold_reward/skeleton_reward

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0

scoreboard players add $money defense.money 10
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money 10

function core:defense/scoreboard/get_highest
