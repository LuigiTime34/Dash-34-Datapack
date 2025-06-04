execute as @e[tag=defense.bee_deployer,distance=..4.95] at @s anchored eyes positioned ^ ^ ^ positioned ~ -58.5 ~ anchored feet run function core:defense/towers/bee/raycast/start_ray
execute unless entity @n[tag=defense.found_target] run return run scoreboard players set @s defense.towers 3

execute as @e[tag=defense.bee_deployer,distance=..4.95,tag=defense.found_target] at @s run particle wax_on ~ ~ ~ 0.5 0.75 0.5 0 15

$execute at @e[tag=defense.bee_deployer,distance=..4.95,tag=defense.found_target] run summon text_display ~ ~ ~ {Tags:["defense.bee_display"],teleport_duration:1,Passengers:[{id:"minecraft:bee",AngerTime:10000,NoAI:1b,Tags:["defense.bee"],Health:$(damage),Invulnerable:1b,attributes:[{id:"attack_knockback",base:$(speed)},{id:"attack_damage",base:0}]}]}
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ cyan_wool run rotate @s 0 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ blue_wool run rotate @s -90 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ light_blue_wool run rotate @s -180 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ purple_wool run rotate @s 90 0

tag @e[tag=defense.found_target] remove defense.found_target