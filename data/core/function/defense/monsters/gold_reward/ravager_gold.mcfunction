
advancement revoke @s only core:defense/mobs/gold_reward/ravager_reward

playsound minecraft:entity.experience_orb.pickup master @s

scoreboard players add $money defense.money 30
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money 30

function core:defense/scoreboard/get_highest
