scoreboard players set @s defense.bee_cooldown 1
$execute at @n[tag=defense.bee_deployer] run summon text_display ~ ~ ~ {Tags:["defense.bee_display"],teleport_duration:1,Passengers:[{id:"minecraft:bee",AngerTime:10000,NoAI:1b,Tags:["defense.bee","defense.queen-bee"],Health:$(damage),Invulnerable:1b,attributes:[{id:"attack_knockback",base:$(speed)},{id:"scale",base:1.5},{id:"attack_damage",base:0}]}]}
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ cyan_wool run rotate @s 0 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ blue_wool run rotate @s -90 0
execute as @e[tag=defense.bee_display] at @s if block ~ -62 ~ light_blue_wool run rotate @s -180 0