$scoreboard players set @s defense.towers $(cooldown)
$function core:defense/towers/global/target_mob {"range":"$(range)","reset_cooldown":"2"}
execute unless entity @n[tag=defense-target] run return run scoreboard players set @s defense.towers 2
execute as @n[tag=defense.storm_rod] at @s run function core:defense/towers/storm/prepare_raycast
$execute as @n[tag=defense-monster,tag=defense-target] at @s run function core:defense/towers/storm/blow_back_chain {"damage":"$(damage)","blow_power":"$(blow_power)","max_chain_length":"$(max_chain_length)","chain_damage":"$(chain_damage)","chain_radius":"$(chain_radius)"}