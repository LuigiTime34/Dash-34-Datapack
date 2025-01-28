# Secret 0_0
execute as @p[gamemode=adventure] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"stepping_on":{"block":{"blocks":"minecraft:lime_terracotta"}}}} run effect give @s minecraft:jump_boost 1 4 false

#    Monster Movement    #
execute as @e[tag=defense-monster] at @s run function core:defense/monsters/movement/movement_ticking
#   Monster Abilities   #

# Witch
execute as @e[tag=defense-monster,tag=defense-witch] at @s if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-monster,tag=defense-witch] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/abilities/witch
item replace entity @e[type=witch] weapon with air

# Silverfish
execute as @e[tag=defense-silverfish,type=silverfish] at @s if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-silverfish,type=silverfish] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/abilities/silverfish
execute as @e[tag=defense-silverfish,type=silverfish] at @s if score @s defense.abilities matches 100 run function core:defense/monsters/abilities/silverfish2

# Enderman
# execute as @e[tag=defense-monster,tag=defense-enderman] if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
# execute as @e[tag=defense-monster,tag=defense-enderman] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/abilities/enderman

# Wither Skeleton
execute as @e[tag=defense-monster,tag=defense-wither_skeleton] store result score @s defense.abilities run data get entity @s Health
execute as @e[tag=defense-monster,tag=defense-wither_skeleton] if score @s defense.abilities matches ..30 run scoreboard players set @s defense.speed 120
execute as @e[tag=defense-monster,tag=defense-wither_skeleton] if score @s defense.abilities matches 30.. unless score @s defense.speed matches 40 run scoreboard players set @s defense.speed 40


# Kill detection for money
execute as @a if score @s defense.kill matches 1.. at @s run function core:defense/monsters/killed_monster



#   Towers   #
# Tower Placement
execute as @p store result score @s defense.rotation run data get entity @s Rotation[0]
# Tower Upgrade Ticking Commands:
execute as @p[gamemode=adventure] at @s at @n[tag=tower-barrel-marker,tag=open] run function core:defense/towers/global/tick
execute as @e[tag=tower-barrel-marker,type=marker,tag=!open] at @s if block ~ ~ ~ minecraft:barrel[open=true] run tag @s add open
execute as @e[tag=tower-barrel-marker,type=minecraft:marker,tag=open] at @s if block ~ ~ ~ minecraft:barrel[open=false] run tag @s remove open
# Archer Tower
# All of the archer towers
execute as @e[tag=archer-skeleton] at @s run rotate @s facing entity @n[tag=defense-monster,distance=..50] feet
execute as @e[tag=archer-skeleton] at @s unless entity @n[tag=defense-monster,distance=..50] run rotate @s -180 0
execute as @e[tag=archer-skeleton] unless score @s defense.towers matches 1.. run scoreboard players set @s defense.towers 2
execute as @e[tag=archer-skeleton] if score @s defense.towers matches 1.. run scoreboard players remove @s defense.towers 1
# Witch/Wizard ticking
execute as @e[tag=defense-monster,tag=!defense.slowed,nbt={active_effects:[{id:"minecraft:slowness",amplifier:0b}]}] run tag @s add defense.slowed
execute as @e[tag=defense-monster,tag=defense.slowed,nbt=!{active_effects:[{id:"minecraft:slowness",amplifier:0b}]}] run tag @s remove defense.slowed

execute as @e[tag=defense-monster,tag=!defense.weakened,nbt={active_effects:[{id:"minecraft:weakness"}]}] run tag @s add defense.weakened
execute as @e[tag=defense-monster,tag=defense.weakened,nbt=!{active_effects:[{id:"minecraft:weakness"}]}] run tag @s remove defense.weakened


# Base
execute as @e[tag=archer-skellie1] if score @s defense.towers matches 1 run function core:defense/towers/archer/shoot {"cooldown":"100","damage":"5","range":"9.5"}
# First Upgrade
execute as @e[tag=archer-skellie_castle] if score @s defense.towers matches 1 run function core:defense/towers/archer/shoot {"cooldown":"60","damage":"5","range":"11.5"}
# Castle Upgrade 1
execute as @e[tag=archer-skellie_castle2] if score @s defense.towers matches 1 run function core:defense/towers/archer/shoot_multishot {"cooldown":"50","damage":"10","range":"13.5"}
# Castle Upgrade 2
execute as @e[tag=archer-skellie_final] if score @s defense.towers matches 1 run function core:defense/towers/archer/shoot_multishot {"cooldown":"30","damage":"20","range":"18.5"}
# Witch Upgrade 1
execute as @e[tag=archer-skellie_witch2] if score @s defense.towers matches 1 run function core:defense/towers/archer/potion {"cooldown":"60","damage":"8","range":"18.5"}
# Witch Upgrade 2
execute as @e[tag=archer-skellie_witch_final] if score @s defense.towers matches 1 run function core:defense/towers/archer/potion {"cooldown":"50","damage":"12","range":"23.5"}

# Elemental Tower
execute as @e[tag=element-center-marker] unless score @s defense.towers matches 1.. run scoreboard players set @s defense.towers 2
execute as @e[tag=element-center-marker] if score @s defense.towers matches 1.. run scoreboard players remove @s defense.towers 1
# Base
execute as @e[tag=element-center-marker,tag=!fire1,tag=!fire2,tag=!wind1,tag=!wind2,tag=!ice1,tag=!ice2,tag=!earth1,tag=!earth2] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/activations/activate_base {"fire_damage":"3","range":"9.5","ice_damage":"3","earth_damage":"7","wind_damage":"2","ignite_time":"60","freeze_time":"100","freeze_power":"10","cooldown":"150","blow_power":"0.3"}
# Fire 1
execute as @e[tag=element-center-marker,tag=fire1] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/activations/activate_fire_med {"fire_damage":"10","range":"13.5","ice_damage":"1","earth_damage":"3","wind_damage":"0","ignite_time":"80","freeze_time":"40","freeze_power":"5","cooldown":"100","blow_power":"0.2"}
# Fire 2
execute as @e[tag=element-center-marker,tag=fire2] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/activations/activate_fire_high {"fire_damage":"15","range":"18.5","cooldown":"80"}
# Fire ticking
execute as @e[tag=defense-monster] at @s if entity @n[type=blaze,tag=element-blaze,distance=..1] run data modify entity @s Fire set value 100
execute as @e[tag=element-blaze] unless score @s defense.towers matches 1.. run scoreboard players set @s defense.towers 60
execute as @e[tag=element-blaze] if score @s defense.towers matches 1.. run scoreboard players remove @s defense.towers 1
execute as @e[tag=element-blaze] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/fire/kill_volcano
execute at @e[tag=element-blaze] run particle minecraft:lava ~ ~ ~ 0.4 0.6 0.4 0 2
execute at @e[tag=element-blaze] run particle dust{color:[1.0,0.48,0.0],scale:2} ~ ~ ~ 0.3 0.6 0.3 0 5
execute at @e[tag=element-blaze] run particle dust{color:[1.0,0.3,0.0],scale:2} ~ ~ ~ 0.3 0.6 0.3 0 3

# Ice 1
execute as @e[tag=element-center-marker,tag=ice1] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/activations/activate_ice_med {"fire_damage":"2","range":"10.5","ice_damage":"5","earth_damage":"3","wind_damage":"0","ignite_time":"20","freeze_time":"60","freeze_power":"15","cooldown":"120","blow_power":"0.2"}
# Ice 2
execute as @e[tag=element-center-marker,tag=ice2] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/activations/activate_ice_high {"ice_damage":"7.5","range":"15.5","cooldown":"100"}

# Ice Ticking
execute at @e[tag=element-snowstorm] run particle snowflake ~ ~ ~ 0.5 1 0.5 0 30
execute as @e[tag=defense-monster] at @s if entity @n[tag=element-snowstorm,distance=..3] run scoreboard players set @s defense.slowness 30
execute as @e[tag=defense-monster] at @s if entity @n[tag=element-snowstorm,distance=..3] run scoreboard players set @s defense.element.freeze_timer 50
execute as @e[tag=element-snowstorm] unless score @s defense.towers matches 1.. run scoreboard players set @s defense.towers 60
execute as @e[tag=element-snowstorm] if score @s defense.towers matches 1.. run scoreboard players remove @s defense.towers 1
execute as @e[tag=element-snowstorm] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/ice/kill_snowstorm
# Wind 1
execute as @e[tag=element-center-marker,tag=wind1] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/activations/activate_wind_med {"fire_damage":"2","range":"15.5","ice_damage":"2","earth_damage":"3","wind_damage":"4","ignite_time":"20","freeze_time":"20","freeze_power":"5","cooldown":"125","blow_power":"0.6"}
# Wind 2
execute as @e[tag=element-center-marker,tag=wind2] if score @s defense.towers matches 1 at @s run function core:defense/towers/element/activations/activate_wind_high {"wind_damage":"7.5","range":"23.5","blow_power":"1.5","cooldown":"100"}


# Earth Ticking
execute as @e[tag=elemental-spike] if score @s defense.towers matches 1.. run scoreboard players remove @s defense.towers 1
execute as @e[tag=elemental-spike] if score @s defense.towers matches 6 run data merge entity @s {start_interpolation: -1, interpolation_duration:5,transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 2.5f, 1.0f], translation: [-0.5f, -0.5f, -0.5f]}}
execute as @e[tag=elemental-spike] if score @s defense.towers matches 1 run kill @s
# Ice Timer
execute as @e[tag=defense-monster] if score @s defense.element.freeze_timer matches 1.. run scoreboard players remove @s defense.element.freeze_timer 1
execute as @e[tag=defense-monster] if score @s defense.element.freeze_timer matches 1.. at @s run particle snowflake ~ ~ ~ 0.2 1 0.2 0 5
execute as @e[tag=defense-monster] if score @s defense.element.freeze_timer matches 1 run scoreboard players set @s defense.slowness 0