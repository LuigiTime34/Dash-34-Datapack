$scoreboard players set @s defense.towers $(cooldown)
execute as @n[tag=defense.bee_deployer] at @s anchored eyes positioned ^ ^ ^ positioned ~ -58.5 ~ anchored feet run function core:defense/towers/bee/raycast/start_ray
execute if score $bee-target defense.bee_tower matches 0 run return fail

scoreboard players set $bee-target defense.bee_tower 0
execute as @n[tag=defense.bee_deployer] at @s anchored eyes positioned ^ ^ ^ run particle wax_on ^-1.5 ^ ^ 0.5 0.75 0.5 0 15

$execute at @n[tag=defense.bee_deployer] run summon text_display ~ ~ ~ {Tags:["defense.bee_display"],teleport_duration:1,Passengers:[{id:"minecraft:bee",NoAI:1b,Tags:["defense.bee"],Health:$(damage),Invulnerable:1b,attributes:[{id:"attack_knockback",base:$(speed)},{id:"attack_damage",base:0}]}]}
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ cyan_wool run rotate @s 0 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ blue_wool run rotate @s -90 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ light_blue_wool run rotate @s -180 0