# Generate random numbers
execute as @s store result storage core:defense.storm_raycast x float .01 run random value -20..20
execute as @s store result storage core:defense.storm_raycast y float .01 run random value -20..20

execute as @s run particle electric_spark ~ ~ ~ 0 0 0 0 0

# Looping
$execute facing entity @n[tag=!defense.in_chain,tag=defense.first_chain_target] feet positioned ^$(x) ^$(y) ^.1 unless entity @n[tag=!defense.in_chain,tag=defense.first_chain_target,distance=..0.3] run return run function core:defense/towers/storm/chain/starter_raycast with storage core:defense.storm_raycast