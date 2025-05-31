$scoreboard players set @s defense.towers $(cooldown)
execute as @n[tag=defense.bee_deployer] at @s anchored eyes positioned ^ ^ ^ positioned ~ -58.5 ~ anchored feet run function core:defense/towers/bee/raycast/start_ray
execute if score $bee-target defense.bee_tower matches 0 run return run scoreboard players set @s defense.towers 2

scoreboard players set $bee-target defense.bee_tower 0
execute as @n[tag=defense.bee_deployer] at @s run particle wax_on ~ ~ ~ 0.5 0.75 0.5 0 15
scoreboard players add @s defense.bee_cooldown 1
$execute if score @s defense.bee_cooldown matches 6.. run return run function core:defense/towers/bee/launch_queen_bee {"damage":"$(damage)","speed":"$(speed)"}

$execute at @n[tag=defense.bee_deployer] run summon text_display ~ ~ ~ {Tags:["defense.bee_display"],teleport_duration:1,Passengers:[{id:"minecraft:bee",AngerTime:10000,NoAI:1b,Tags:["defense.bee"],Health:$(damage),Invulnerable:1b,attributes:[{id:"attack_knockback",base:$(speed)},{id:"attack_damage",base:0}]}]}
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ cyan_wool run rotate @s 0 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ blue_wool run rotate @s -90 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ light_blue_wool run rotate @s -180 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ purple_wool run rotate @s 90 0