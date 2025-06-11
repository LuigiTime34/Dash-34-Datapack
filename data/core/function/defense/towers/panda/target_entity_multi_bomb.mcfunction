$scoreboard players set @s defense.towers $(cooldown)
$function core:defense/towers/global/target_mob {"range":"$(range)","reset_cooldown":"11"}
execute unless entity @e[tag=defense-target,limit=1] run return run scoreboard players set @s defense.towers 11

$execute at @n[tag=defense.panda] run function core:defense/towers/panda/summon_bomb {"damage":"$(damage)","bomb_range":"3"}