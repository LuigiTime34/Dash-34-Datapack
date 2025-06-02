tag @s add defense.chain_starter
$tag @n[tag=defense-monster,distance=..$(chain_radius),tag=!defense.chain_starter] add defense.first_chain_target
# If no entity got tagged, stop immediately
execute unless entity @n[tag=defense.first_chain_target] run return run tag @s remove defense.chain_starter
# Otherwise, start the chain
# Summon storm cloud
summon marker ~ -53 ~ {Tags:["defense.storm_cloud"]}
execute as @e[tag=defense.storm_cloud] at @s run particle minecraft:campfire_cosy_smoke ~ -52 ~ 0.7 0.4 0.7 0 300
# Initial raycast to the first target
execute as @n[tag=defense.storm_cloud] at @s anchored eyes run function core:defense/towers/storm/chain/starter_raycast with storage core:defense.storm_raycast
execute as @n[tag=defense.first_chain_target] at @s run function core:defense/towers/storm/chain/chain_loop with storage core:defense.storm_raycast
# Clean up
tag @s remove defense.chain_starter
tag @n[tag=defense-monster,tag=defense.first_chain_target] remove defense.first_chain_target
kill @n[tag=defense.storm_cloud]