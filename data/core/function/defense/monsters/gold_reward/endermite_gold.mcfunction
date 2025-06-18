advancement revoke @s only core:defense/mobs/gold_reward/endermite_reward

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0
scoreboard players remove $mobs_left defense.wave 1

function core:defense/scoreboard/get_highest
