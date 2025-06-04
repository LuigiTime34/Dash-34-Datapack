$scoreboard players set @s defense.towers $(cooldown)
$function core:defense/towers/global/target_mob {"range":"$(range)"}
execute unless entity @n[tag=defense-target] run return fail

$execute at @n[tag=defense.panda] run function core:defense/towers/panda/summon_bomb {"damage":"$(damage)","bomb_range":"3"}