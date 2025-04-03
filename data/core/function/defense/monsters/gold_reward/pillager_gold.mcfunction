
advancement revoke @s only core:defense/mobs/gold_reward/pillager_reward

playsound minecraft:entity.experience_orb.pickup master @s
scoreboard players remove $mobs_left defense.wave 1

scoreboard players add $money defense.money 16
scoreboard players set $recent_hit defense.money 20
scoreboard players add $recent_money defense.money 16

function core:defense/scoreboard/get_highest
