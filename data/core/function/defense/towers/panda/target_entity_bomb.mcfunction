$scoreboard players set @s defense.towers $(cooldown)
$function core:defense/towers/global/target_mob {"range":"$(range)","reset_cooldown":"2"}
execute unless entity @n[tag=defense-target] run return run scoreboard players set @s defense.towers 2

$execute at @n[tag=defense.panda] run function core:defense/towers/panda/summon_bomb {"damage":"$(damage)","bomb_range":"3"}