
advancement revoke @s only core:defense/mobs/gold_reward/chicken_reward

playsound minecraft:entity.experience_orb.pickup master @s

scoreboard players add $money defense.money 4
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money 4

function core:defense/scoreboard/get_highest
