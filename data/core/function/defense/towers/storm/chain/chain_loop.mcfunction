# See if the max chain limit has been reached
$execute if score $current_chain defense.storm matches $(max_chain_length).. run return run function core:defense/towers/storm/chain/reset

scoreboard players add $current_chain defense.storm 1
tag @s add defense.in_chain
$damage @s $(chain_damage) core:defense/wind_charge by @p
playsound minecraft:block.vault.close_shutter master @a ~ ~ ~ 10 1.8
playsound minecraft:block.vault.eject_item master @a ~ ~ ~ 10 1.8
# playsound minecraft:entity.creaking.sway master @a ~ ~ ~ 10 1
playsound minecraft:entity.player.attack.crit master @a ~ ~ ~ 10 0.5

# If no other entities are found to be in the chain, stop and reset
$execute unless entity @n[tag=defense-monster,distance=..$(chain_radius),tag=!defense.in_chain,tag=!defense.chain_starter] run return run function core:defense/towers/storm/chain/reset

# Otherwise, continue the chain by doing raycast towards and them running the function again
tag @n[tag=defense-monster,tag=!defense.in_chain,tag=!defense.chain_starter] add defense.chain_target
# Generate random numbers before raycast
execute as @s store result storage core:defense.storm_raycast x float .01 run random value -30..30
execute as @s store result storage core:defense.storm_raycast y float .01 run random value -30..30
execute anchored eyes run function core:defense/towers/storm/chain/raycast with storage core:defense.storm_raycast

execute as @n[tag=defense-monster,tag=!defense.in_chain,tag=!defense.chain_starter] at @s run function core:defense/towers/storm/chain/chain_loop with storage core:defense.storm_raycast