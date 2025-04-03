
advancement revoke @s only core:defense/mobs/gold_reward/witch_reward

playsound minecraft:entity.experience_orb.pickup master @s
scoreboard players remove $mobs_left defense.wave 1

scoreboard players add $money defense.money 7
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money 7

function core:defense/scoreboard/get_highest
