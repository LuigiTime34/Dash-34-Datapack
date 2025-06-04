$scoreboard players set @s defense.towers $(cooldown)
$function core:defense/towers/global/target_mob {"range":"$(range)"}
execute unless entity @n[tag=defense-target] run return fail
execute as @e[tag=defense.panda,tag=!defense.attacked,distance=..3.5,sort=random,limit=1] run function core:defense/towers/panda/show_particle
$execute as @n[tag=defense-monster,tag=defense-target] at @s positioned ^ ^ ^.3 run function core:defense/towers/panda/stab {"damage":"$(damage)","age":"$(age)","leaves":"$(leaves)"}