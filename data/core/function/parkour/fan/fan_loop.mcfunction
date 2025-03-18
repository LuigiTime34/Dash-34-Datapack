execute as @e[tag=fan,tag=!dead-fan,tag=fan-east] at @s if entity @p[distance=..40,gamemode=adventure] positioned ~ ~4 ~4 as @a[dx=21,dy=-8,dz=-8,gamemode=adventure] at @s run function core:parkour/fan/push_positive_x
execute as @e[tag=fan,tag=!dead-fan,tag=fan-west] at @s if entity @p[distance=..40,gamemode=adventure] positioned ~ ~4 ~4 as @a[dx=-21,dy=-8,dz=-8,gamemode=adventure] at @s run function core:parkour/fan/push_negative_x
execute as @e[tag=fan,tag=!dead-fan,tag=fan-north] at @s if entity @p[distance=..40,gamemode=adventure] positioned ~4 ~4 ~ as @a[dx=8,dy=-8,dz=-21,gamemode=adventure] at @s run function core:parkour/fan/push_negative_z
execute as @e[tag=fan,tag=!dead-fan,tag=fan-south] at @s if entity @p[distance=..40,gamemode=adventure] positioned ~4 ~4 ~ as @a[dx=-8,dy=-8,dz=21,gamemode=adventure] at @s run function core:parkour/fan/push_positive_z
execute as @e[tag=fan,tag=fan-east,tag=!dead-fan] at @s if entity @p[distance=..40,gamemode=adventure] run particle cloud ~ ~ ~ 4 0 0 0.1 0
execute as @e[tag=fan,tag=fan-west,tag=!dead-fan] at @s if entity @p[distance=..40,gamemode=adventure] run particle cloud ~ ~ ~ -4 0 0 0.1 0
execute as @e[tag=fan,tag=fan-north,tag=!dead-fan] at @s if entity @p[distance=..40,gamemode=adventure] run particle cloud ~ ~ ~ 0 0 -4 0.1 0
execute as @e[tag=fan,tag=fan-south,tag=!dead-fan] at @s if entity @p[distance=..40,gamemode=adventure] run particle cloud ~ ~ ~ 0 0 4 0.1 0

execute at @e[tag=fan-east,tag=!dead-fan] if score $fan-animation parkour matches 1 run clone -107 -40 134 -107 -48 126 ~ ~-4 ~-4
execute at @e[tag=fan-east,tag=!dead-fan] if score $fan-animation parkour matches 2 run clone -107 -40 124 -107 -48 116 ~ ~-4 ~-4
execute at @e[tag=fan-east,tag=!dead-fan] if score $fan-animation parkour matches 3 run clone -107 -40 114 -107 -48 106 ~ ~-4 ~-4
execute at @e[tag=fan-east,tag=!dead-fan] if score $fan-animation parkour matches 4 run clone -107 -40 104 -107 -48 96 ~ ~-4 ~-4

execute at @e[tag=fan-west,tag=!dead-fan] if score $fan-animation parkour matches 1 run clone -110 -40 134 -110 -48 126 ~ ~-4 ~-4
execute at @e[tag=fan-west,tag=!dead-fan] if score $fan-animation parkour matches 2 run clone -110 -40 124 -110 -48 116 ~ ~-4 ~-4
execute at @e[tag=fan-west,tag=!dead-fan] if score $fan-animation parkour matches 3 run clone -110 -40 114 -110 -48 106 ~ ~-4 ~-4
execute at @e[tag=fan-west,tag=!dead-fan] if score $fan-animation parkour matches 4 run clone -110 -40 104 -110 -48 96 ~ ~-4 ~-4

execute at @e[tag=fan-north,tag=!dead-fan] if score $fan-animation parkour matches 1 run clone -114 -40 102 -122 -48 102 ~-4 ~-4 ~
execute at @e[tag=fan-north,tag=!dead-fan] if score $fan-animation parkour matches 2 run clone -114 -40 112 -122 -48 112 ~-4 ~-4 ~
execute at @e[tag=fan-north,tag=!dead-fan] if score $fan-animation parkour matches 3 run clone -114 -40 122 -122 -48 122 ~-4 ~-4 ~
execute at @e[tag=fan-north,tag=!dead-fan] if score $fan-animation parkour matches 4 run clone -114 -40 132 -122 -48 132 ~-4 ~-4 ~

execute at @e[tag=fan-south,tag=!dead-fan] if score $fan-animation parkour matches 1 run clone -114 -40 105 -122 -48 105 ~-4 ~-4 ~
execute at @e[tag=fan-south,tag=!dead-fan] if score $fan-animation parkour matches 2 run clone -114 -40 115 -122 -48 115 ~-4 ~-4 ~
execute at @e[tag=fan-south,tag=!dead-fan] if score $fan-animation parkour matches 3 run clone -114 -40 125 -122 -48 125 ~-4 ~-4 ~
execute at @e[tag=fan-south,tag=!dead-fan] if score $fan-animation parkour matches 4 run clone -114 -40 135 -122 -48 135 ~-4 ~-4 ~

execute if score $fan-animation parkour matches 1..3 run scoreboard players add $fan-animation parkour 1
execute if score $fan-animation parkour matches 4 run scoreboard players set $fan-animation parkour 1