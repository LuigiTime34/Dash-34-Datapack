execute as @e[tag=defense.tree,nbt={block_state:{Name:"minecraft:oak_leaves"}}] at @s run function core:defense/towers/tree/trees/kill_leaves
rotate @s ~ 90
tp @s ~ -58 ~
scoreboard players set @n[tag=defense.tree_marker] defense.tree_cooldown 10