
advancement revoke @s only core:defense/mobs/gold_reward/stray_reward

playsound minecraft:entity.experience_orb.pickup master @s
scoreboard players remove $mobs_left defense.wave 1

scoreboard players add $money defense.money 13
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money 13

function core:defense/scoreboard/get_highest
