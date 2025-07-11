# Secret Scale down
attribute @p[gamemode=adventure,tag=defense-started] minecraft:scale base set 2
execute as @p[gamemode=adventure,tag=defense-started,x=-62,y=-50,z=123,dx=-40,dy=21,dz=-14] run attribute @s minecraft:scale base set 1
# ====================================================================================================================
#         _______ __  __ 
#      /\|__   __|  \/  |
#     /  \  | |  | \  / |
#    / /\ \ | |  | |\/| |
#   / ____ \| |  | |  | |
#  /_/    \_\_|  |_|  |_|
# ====================================================================================================================
execute as @a[gamemode=adventure] if data entity @n[tag=atm-interaction-buy] interaction run function core:defense/atm/get_values
execute as @a[gamemode=adventure] if data entity @n[tag=atm-interaction-down] interaction run function core:defense/atm/change_amount_down
execute as @a[gamemode=adventure] if data entity @n[tag=atm-interaction-up] interaction run function core:defense/atm/change_amount_up
# ====================================================================================================================
#   _____ _______ ______ __  __  _____ 
#  |_   _|__   __|  ____|  \/  |/ ____|
#    | |    | |  | |__  | \  / | (___  
#    | |    | |  |  __| | |\/| |\___ \ 
#   _| |_   | |  | |____| |  | |____) |
#  |_____|  |_|  |______|_|  |_|_____/ 
# ====================================================================================================================
execute as @e[type=tnt] unless score @s defense.items matches 1.. run function core:defense/items/tnt/tnt_init
execute as @e[type=tnt] at @s if score @s defense.items matches 1.. run scoreboard players remove @s defense.items 1
execute as @e[type=tnt] at @s if score @s defense.items matches 1 run function core:defense/items/tnt/tnt_explode
# aerial view
# Change location of the marker
execute at @p[gamemode=adventure,tag=!aerial_view] as @e[tag=defense.aerial_view_marker,limit=1] unless block ~ -61 ~ purple_wool run tp @s ~ -38 ~
# Init enter
execute as @p[gamemode=adventure] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"equipment":{"chest":{"items":"minecraft:iron_chestplate","predicates":{"minecraft:custom_data":{"defense.aerial_view":true}}}}}} run function core:defense/items/aerial/enter
# Info
execute as @a[tag=defense.aerial_view] run title @s actionbar ["",{"text":"Press ","color":"green"},{"keybind":"key.sneak","color":"green"},{"text":" to exit, and ","color":"green"},{"keybind":"key.sprint","color":"green"},{"text":" to move faster.","color":"green"}]
# Moving
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~-0.5 ~ ~"}
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"backward":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~0.5 ~ ~"}
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"left":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~ ~ ~0.5"}
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"right":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~ ~ ~-0.5"}
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":true,"sprint":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~-1 ~ ~"}
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"backward":true,"sprint":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~1 ~ ~"}
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"left":true,"sprint":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~ ~ ~1"}
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"right":true,"sprint":true}}}} as @n[tag=defense.aerial_view_marker] at @s run function core:defense/items/aerial/move {"offset":"~ ~ ~-1"}
# Return back
execute as @a[tag=defense.aerial_view] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} run function core:defense/items/aerial/return
# ====================================================================================================================
#  __          ____      ________  _____ 
#  \ \        / /\ \    / /  ____|/ ____|
#   \ \  /\  / /  \ \  / /| |__  | (___  
#    \ \/  \/ / /\ \ \/ / |  __|  \___ \ 
#     \  /\  / ____ \  /  | |____ ____) |
#      \/  \/_/    \_\/   |______|_____/ 
# ====================================================================================================================
# Wave end
execute if score $mobs_left defense.wave matches ..0 unless score $wave_timer defense.wave matches 1.. unless score $dead defense matches 1 run function core:defense/monsters/waves/end_of_wave
execute if score $wave_timer defense.wave matches 0 run schedule clear core:defense/scoreboard/wave_timer
execute if score $wave_timer defense.wave matches 0 run clear @a[gamemode=adventure] iron_helmet
execute as @a if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"equipment":{"head":{"items":"minecraft:iron_helmet","predicates":{"minecraft:custom_data":{"defense.start_wave":true}}}}}} run function core:defense/monsters/waves/start_next_wave_early
# Display mobs left in the bossbar
# execute if score $mobs_left defense.wave matches 1.. run title @a[gamemode=adventure] actionbar [{"text":"Mobs Left: ","color":"yellow"},{"score":{"name":"$mobs_left","objective":"defense.wave"},"color":"gold","bold":true}]
execute store result bossbar minecraft:defense.mobs_left value run scoreboard players get $mobs_left defense.wave
# Give all mobs glowing when theres 5 left
execute if score $mobs_left defense.wave matches ..5 if score $wave_level defense.wave matches 9.. run effect give @e[tag=defense-monster] glowing infinite 0 true
# ====================================================================================================================
#   __  __  ____  _   _  _____ _______ ______ _____   _____ 
#  |  \/  |/ __ \| \ | |/ ____|__   __|  ____|  __ \ / ____|
#  | \  / | |  | |  \| | (___    | |  | |__  | |__) | (___  
#  | |\/| | |  | | . ` |\___ \   | |  |  __| |  _  / \___ \ 
#  | |  | | |__| | |\  |____) |  | |  | |____| | \ \ ____) |
#  |_|  |_|\____/|_| \_|_____/   |_|  |______|_|  \_\_____/ 
# ====================================================================================================================
#    Movement    #
execute as @e[tag=defense-monster] at @s run function core:defense/monsters/movement/movement_ticking

#    Bossbar update display    #
execute unless entity @n[tag=defense.boss] run bossbar set core:defense.boss visible false
execute if entity @n[tag=defense.boss] run bossbar set core:defense.boss name {"selector":"@n[tag=defense.boss]"}
#execute as @n[tag=defense.boss] store result bossbar core:defense.boss value run data get entity @s Health

#   Abilities   #

# Spider With Skellie Riding
# Rotate snap
execute as @e[tag=defense-skeleton] on vehicle on passengers at @s run data modify entity @s Rotation set from entity @n[tag=defense-spider,distance=..1] Rotation
# Store same distance
execute as @e[tag=defense-skeleton,tag=defense.riding_spider] at @s run scoreboard players operation @s defense.distance = @n[tag=defense-spider,distance=..1] defense.distance
execute as @e[tag=defense-spider] on passengers on vehicle run tag @s add defense.has_skellie
execute as @e[tag=defense-spider] run tag @s remove defense.has_skellie

# Witch
execute as @e[tag=defense-monster,tag=defense-witch] at @s if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-monster,tag=defense-witch] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/abilities/witch
item replace entity @e[type=witch] weapon with air

# Bogged
# Heal Every second
execute as @e[tag=defense-monster,tag=defense-bogged] at @s if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-monster,tag=defense-bogged] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/abilities/bogged
# Double speed at half health
execute as @e[tag=defense-monster,tag=defense-bogged] store result score @s defense.bogged_health run data get entity @s Health
execute as @e[tag=defense-monster,tag=defense-bogged] if score @s defense.bogged_health matches ..39 unless score @s defense.speed matches 38 at @s run playsound block.trial_spawner.ominous_activate master @a ~ ~ ~ 1
execute as @e[tag=defense-monster,tag=defense-bogged] if score @s defense.bogged_health matches ..39 unless score @s defense.speed matches 38 at @s run particle minecraft:trial_spawner_detection_ominous ~ ~ ~ 0.3 0.6 0.3 0 35
execute as @e[tag=defense-monster,tag=defense-bogged] if score @s defense.bogged_health matches ..40 run scoreboard players set @s defense.speed 38
execute as @e[tag=defense-monster,tag=defense-bogged] if score @s defense.bogged_health matches 40.. run scoreboard players set @s defense.speed 19

# Silverfish
execute as @e[tag=defense-silverfish,type=silverfish] at @s if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-silverfish,type=silverfish] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/abilities/silverfish
execute as @e[tag=defense-silverfish,type=silverfish] at @s if score @s defense.abilities matches 60 run function core:defense/monsters/abilities/silverfish2

# Enderman
execute as @e[tag=defense-monster,tag=defense-enderman] if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1

execute as @e[tag=defense-monster,tag=defense-enderman] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/abilities/enderman

# Create a marker for each enderman that doesn't have one
execute as @e[tag=defense-monster,tag=defense-enderman,tag=!has_marker] at @s run function core:defense/monsters/abilities/summon_enderman_marker

# Teleport endermen that are too far from their markers and
# Update marker positions to their linked endermen
execute as @e[tag=defense.enderman-marker] at @s run function core:defense/monsters/abilities/update_enderman_marker

# Chicken Jockey (Minecraft movie refrence???)
execute as @e[tag=defense-baby_zombie,tag=defense-jockey] run tag @s remove defense-jockey
execute as @e[tag=defense-baby_zombie,tag=!defense-monster] on vehicle on passengers run tag @s add defense-jockey
execute as @e[tag=defense-baby_zombie,tag=!defense-monster,tag=!defense-jockey] run function core:defense/monsters/abilities/chicken_jockey_dismount
# Rotate snap
execute as @e[tag=defense-baby_zombie,tag=!defense-monster] at @s run data modify entity @s Rotation set from entity @n[tag=defense-chicken,distance=..1] Rotation
# Store same distance
execute as @e[tag=defense-baby_zombie,tag=!defense-monster] at @s run scoreboard players operation @s defense.distance = @n[tag=defense-chicken,distance=..1] defense.distance

# BIG Chicken Jockey
execute as @e[tag=defense-big_jockey_zombie,tag=defense-big_jockey] run tag @s remove defense-big_jockey
execute as @e[tag=defense-big_jockey_zombie,tag=!defense-monster] on vehicle on passengers run tag @s add defense-big_jockey
execute as @e[tag=defense-big_jockey_zombie,tag=!defense-monster,tag=!defense-big_jockey] run function core:defense/monsters/abilities/chicken_jockey_dismount
# Rotate snap
execute as @e[tag=defense-big_jockey_zombie,tag=!defense-monster] at @s run data modify entity @s Rotation set from entity @n[tag=defense-big_chicken,distance=..1.5] Rotation
# Store same distance
execute as @e[tag=defense-big_jockey_zombie,tag=!defense-monster] at @s run scoreboard players operation @s defense.distance = @n[tag=defense-big_chicken,distance=..1] defense.distance

# Zombified Piglin
execute as @e[tag=defense-zombified_piglin] if data entity @s {HurtTime:9s} at @s rotated ~ 0 positioned ^ ^ ^-0.2 run function core:defense/monsters/abilities/zombified_piglin_reinforcements

# Charged Creeper
execute as @e[tag=defense.creeper-death,tag=defense.not_dead] run tag @s remove defense.not_dead
execute as @e[tag=defense.creeper-death] on vehicle on passengers run tag @s add defense.not_dead
execute as @e[tag=defense.creeper-death,tag=!defense.not_dead] unless score @s defense.abilities matches 1.. run function core:defense/monsters/abilities/charged_creeper_explode
execute as @e[tag=defense.creeper-death] if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense.creeper-death] if score @s defense.abilities matches 1 at @s positioned ~ -59 ~ run tag @e[tag=defense.creeper_disabled,distance=..9] remove defense.creeper_disabled
execute as @e[tag=defense.creeper-death] if score @s defense.abilities matches 1 run kill @s
execute as @e[tag=defense.creeper_disabled,tag=!tower-center-marker] run scoreboard players add @s defense.towers 1
execute as @e[tag=defense.creeper_disabled,tag=tower-center-marker] at @s run scoreboard players add @n[tag=archer-skeleton] defense.towers 1
execute as @e[tag=defense.creeper_disabled] at @s unless entity @n[tag=defense.creeper_display,distance=..3.5] run summon minecraft:creeper ~ ~-3 ~ {NoAI:true,powered:1b,attributes:[{id:"minecraft:scale",base:8.0}],Invulnerable:true,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:false}],Tags:["defense.creeper_display"],Team:"defense_player"}
execute as @e[tag=defense.creeper_display] run data merge entity @s {Fire:0}
execute as @e[tag=defense.creeper_display] at @s unless entity @n[tag=defense.tower_marker,distance=..3.5] run tag @s add defense.dead_creeper_display
execute as @e[tag=defense.dead_creeper_display] at @s run tp @s ~ -200 ~
execute as @e[tag=defense.dead_creeper_display] run kill @s

execute as @e[tag=defense.tower_marker,tag=!defense.creeper_disabled] at @s as @n[tag=defense.creeper_display,distance=..3.5] run tag @s add defense.dead_creeper_display

# GIANT
execute as @e[tag=defense-giant] at @s unless score @s defense.abilities matches 6.. run tp @s ~ ~-0.8 ~
execute as @e[tag=defense-giant] if score @s defense.abilities matches 1 run scoreboard players set @s defense.abilities 250
execute as @e[tag=defense-giant] if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-giant] if score @s defense.abilities matches 10 at @s run function core:defense/monsters/boss/giant/shockwave_jump
execute as @e[tag=defense-giant] if score @s defense.abilities matches 249 at @s run function core:defense/monsters/boss/giant/shockwave_land
execute as @e[tag=defense-giant,type=giant] if score @s defense.abilities matches 190 run tag @e[tag=defense.giant_disabled] remove defense.giant_disabled
execute as @e[tag=defense.giant_disabled,tag=!tower-center-marker] run scoreboard players add @s defense.towers 1
execute as @e[tag=defense.giant_disabled,tag=tower-center-marker] at @s run scoreboard players add @n[tag=archer-skeleton] defense.towers 1
execute as @e[tag=defense.giant_disabled] at @s run particle minecraft:block_crumble{block_state:{Name:dirt}} ~ ~ ~ 2 0.1 2 0 100
execute as @e[tag=defense.giant_disabled] unless entity @n[tag=defense-giant] run tag @s remove defense.giant_disabled
execute as @e[tag=defense-giant] run data merge entity @s {Fire:0}

# RAVAGER
# Speed ability
execute as @e[tag=defense-ravager,limit=1] if data entity @s {HurtTime:10s} run function core:defense/monsters/boss/ravager/attacked
execute at @n[tag=defense-ravager,tag=defense.ravager_speed] run particle entity_effect{color:[0.18,0.85,0.93,1.0]} ~ ~1 ~ 1 0.5 1 0 1
execute as @n[tag=defense-ravager,tag=defense.ravager_speed] if score @s defense.ravager_speed matches 1.. run scoreboard players remove @s defense.ravager_speed 1
execute as @n[tag=defense-ravager,tag=defense.ravager_speed] if score @s defense.ravager_speed matches 1 run function core:defense/monsters/boss/ravager/remove_speed
# Damage self to speed
execute as @e[tag=defense-ravager] if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-ravager] at @s if score @s defense.abilities matches 1 run function core:defense/monsters/boss/ravager/damage_self
execute as @e[tag=defense-ravager] at @s if score @s defense.abilities matches 150 run scoreboard players set @s defense.speed 20


# Warden
execute as @e[tag=defense-warden,type=warden] if score @s defense.abilities matches 1.. run scoreboard players remove @s defense.abilities 1
execute as @e[tag=defense-warden,type=warden] if score @s defense.abilities matches 1 at @s run function core:defense/monsters/boss/warden/sonic_boom

execute as @e[tag=defense-warden] if score @s defense.abilities matches 75 run tag @e[tag=defense.warden_disabled] remove defense.warden_disabled
execute as @e[tag=defense.warden_disabled,tag=!tower-center-marker] run scoreboard players add @s defense.towers 1
execute as @e[tag=defense.warden_disabled,tag=tower-center-marker] at @s run scoreboard players add @n[tag=archer-skeleton] defense.towers 1
execute as @e[tag=defense.warden_disabled] at @s run particle minecraft:sculk_charge_pop ~ ~ ~ 1.5 2 1.5 0 200
execute as @e[tag=defense.warden_disabled] unless entity @n[tag=defense-warden] run tag @s remove defense.warden_disabled

#  Display extra gold recently gotten
execute if score $recent_kill defense.money matches 1.. run scoreboard players remove $recent_kill defense.money 1
execute if score $recent_kill defense.money matches 0 run scoreboard players set $recent_money defense.money 0
execute if score $recent_kill defense.money matches 0 run function core:defense/scoreboard/get_highest
execute if score $recent_hit defense.damage matches 1.. run scoreboard players remove $recent_hit defense.damage 1
execute if score $recent_hit defense.damage matches 0 run scoreboard players set $recent_damage defense.damage 0
execute if score $recent_hit defense.damage matches 0 run function core:defense/scoreboard/get_highest
# ====================================================================================================================
#   _______ ______          ________ _____   _____ 
#  |__   __/ __ \ \        / /  ____|  __ \ / ____|
#     | | | |  | \ \  /\  / /| |__  | |__) | (___  
#     | | | |  | |\ \/  \/ / |  __| |  _  / \___ \ 
#     | | | |__| | \  /\  /  | |____| | \ \ ____) |
#     |_|  \____/   \/  \/   |______|_|  \_\_____/ 
# ====================================================================================================================
# Tower Placement
execute as @p[gamemode=adventure] unless predicate core:defense/holding_placer as @e[tag=defense.tower_placer] at @s positioned ~ -60 ~ unless entity @s[distance=...1] unless entity @n[tag=tower-barrel-marker,distance=..3.5] run tp @s ~ -60 ~
execute as @p[gamemode=adventure] if predicate core:defense/holding_placer as @e[tag=defense.tower_placer] at @s positioned ~ -59 ~ unless entity @s[distance=...1] unless entity @n[tag=tower-barrel-marker,distance=..3.5] run tp @s ~ -59 ~
execute as @p[gamemode=adventure] store result score @s defense.rotation run data get entity @s Rotation[0]
execute as @e[tag=defense.tower_placer] if data entity @s interaction at @s unless entity @n[tag=panda-center-marker,distance=..3.5] on target if predicate core:defense/holding_panda positioned ~ -59 ~ run function core:defense/towers/panda/placement/panda_init
execute as @e[tag=defense.tower_placer] if data entity @s interaction at @s unless entity @n[tag=bee-center-marker,distance=..3.5] on target if predicate core:defense/holding_bee positioned ~ -59 ~ run function core:defense/towers/bee/placement/bee_init
execute as @e[tag=defense.tower_placer] if data entity @s interaction at @s unless entity @n[tag=storm-center-marker,distance=..3.5] on target if predicate core:defense/holding_storm positioned ~ -59 ~ run function core:defense/towers/storm/placement/storm_init
# Remove interaction data
execute as @e[tag=defense.tower_placer] if data entity @s interaction run data remove entity @s interaction
execute as @e[tag=defense.tower_placer] at @s if entity @n[tag=tower-barrel-marker,distance=..3.5] run tp @s ~ -60 ~

# Tower Upgrade Ticking Commands
execute as @p[gamemode=adventure] at @s at @n[tag=tower-barrel-marker,tag=open] run function core:defense/towers/global/tick
execute as @e[tag=tower-barrel-marker,type=marker,tag=!open] at @s if block ~ ~ ~ minecraft:barrel[open=true] run tag @s add open
execute as @e[tag=tower-barrel-marker,type=minecraft:marker,tag=open] at @s if block ~ ~ ~ minecraft:barrel[open=false] run tag @s remove open
# Targeting system
#execute as @e[tag=defense-monster] store result score @s defense.targetx run data get entity @s Pos[0] -10
#execute as @e[tag=defense-monster] store result score @s defense.targetz run data get entity @s Pos[2] -10
#execute as @e[tag=defense-monster] run scoreboard players operation @s defense.targetx -= $start.x defense.targetx
#execute as @e[tag=defense-monster] run scoreboard players operation @s defense.targetz -= $start.z defense.targetz
#execute as @e[tag=defense-monster] run scoreboard players operation @s defense.distance = @s defense.targetx
#execute as @e[tag=defense-monster] run scoreboard players operation @s defense.distance += @s defense.targetz

# Display Ranges
execute as @e[tag=defense.tower_marker,tag=!defense.off,tag=!bee-center-marker] at @s run rotate @s ~6 ~
execute as @e[tag=defense.tower_marker,tag=!defense.off,tag=!bee-center-marker] at @s positioned ~ -58.5 ~ run function core:defense/towers/global/get_range
# Cooldown
execute as @e[tag=defense.tower_marker,tag=!defense.off] unless score @s defense.towers matches 1.. run scoreboard players set @s defense.towers 2
execute as @e[tag=defense.tower_marker,tag=!defense.off] if score @s defense.towers matches 1.. run scoreboard players remove @s defense.towers 1
# Glowing barrels
execute at @a[gamemode=adventure] as @n[tag=tower-barrel-display,nbt=!{Glowing:1b},distance=..10] run data modify entity @s Glowing set value 1b
execute at @a[gamemode=adventure] as @n[tag=tower-barrel-display,nbt={Glowing:1b},distance=10..] run data modify entity @s Glowing set value 0b
# Failsafe to make sure they are always on the barrel
execute as @e[tag=tower-barrel-display] at @s unless entity @n[tag=tower-barrel-marker,distance=..0.1] run tp @s @n[tag=tower-barrel-marker,distance=..3]

# Range preview
execute as @p[gamemode=adventure] at @s run tag @e[tag=defense.tower_placer,distance=..10] add defense.tower_placer_looker
execute as @p[gamemode=adventure] at @s run tag @e[tag=defense.tower_placer,distance=10..] remove defense.tower_placer_looker
execute as @p[gamemode=adventure,tag=!defense.played_sound] if predicate core:defense/looking_at_placer if predicate core:defense/holding_placer as @a at @s run playsound minecraft:item.spyglass.use master @s ~ ~ ~ 2 1
execute as @p[gamemode=adventure] if predicate core:defense/looking_at_placer run tag @s add defense.played_sound
execute as @p[gamemode=adventure] unless predicate core:defense/looking_at_placer run tag @s remove defense.played_sound

# execute as @p[gamemode=adventure,tag=!defense.played_sound2] unless predicate core:defense/looking_at_placer if predicate core:defense/holding_placer as @a at @s run playsound minecraft:item.lodestone_compass.lock master @s ~ ~ ~ 2 1
# execute as @p[gamemode=adventure] unless predicate core:defense/looking_at_placer run tag @s add defense.played_sound2
# execute as @p[gamemode=adventure] if predicate core:defense/looking_at_placer run tag @s remove defense.played_sound2

execute as @p[gamemode=adventure] if predicate core:defense/holding_placer as @e[tag=defense.tower_square,nbt=!{Glowing:1b}] at @s unless entity @n[tag=tower-barrel-marker,distance=..3.5] run data merge entity @s {Glowing:1b}
execute as @p[gamemode=adventure] unless predicate core:defense/holding_placer as @e[tag=defense.tower_square,nbt={Glowing:1b}] at @s run data merge entity @s {Glowing:0b}
# Make path higlights back to not glowing for the bees
execute as @e[tag=defense.path_highlight,nbt={Glowing:1b}] run data merge entity @s {Glowing:0b}

execute as @e[tag=defense.tower_square,tag=defense.green] run team leave @s
execute as @e[tag=defense.tower_square,tag=defense.green] run tag @s remove defense.green
execute unless entity @e[tag=defense.green] as @a[gamemode=adventure] if predicate core:defense/holding_placer at @s anchored eyes positioned ^ ^ ^ anchored feet run function core:defense/towers/global/squares/raycast/start_ray

#execute as @e[tag=defense.tower_square,tag=defense.green] at @s run rotate @s ~6 ~
#execute as @e[tag=defense.tower_square,tag=!defense.green] run rotate @s 0 0
execute as @e[tag=defense.tower_square,tag=!defense.green] run data merge entity @s {transformation:{scale:[6.0f,6.0f,0.5f]},interpolation_duration:2,start_interpolation:0,item:{id:"white_stained_glass_pane"}}

# ====================================================================================================================
#   _               
#  | |              
#  | |__   ___  ___ 
#  | '_ \ / _ \/ _ \
#  | |_) |  __/  __/
#  |_.__/ \___|\___|
# ====================================================================================================================
# Global bee slowness (removed)
# execute as @e[tag=bee-center-marker,tag=!defense.off] at @s run function core:defense/towers/bee/get_range
# Give particles to slowed monsters
# execute as @e[tag=defense-monster] if score @s defense.bee.honey_slowness matches 1.. at @s run particle minecraft:falling_honey ~ ~ ~ 0.2 0.3 0.2 0 1

# Base
execute as @e[tag=bee-center-marker,tag=!upgrade1,tag=!upgrade_attack1,tag=!upgrade_attack2,tag=!upgrade_money1,tag=!upgrade_money2] if score @s defense.towers matches 1 at @s run function core:defense/towers/bee/launch_bee {"cooldown":"40","damage":"2","speed":20}

# First Upgrade
execute as @e[tag=bee-center-marker,tag=upgrade1] if score @s defense.towers matches 1 at @s run function core:defense/towers/bee/launch_bee {"cooldown":"35","damage":"3","speed":"25"}

# Attack Upgrade 1
execute as @e[tag=bee-center-marker,tag=upgrade_attack1,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 2 at @s run function core:defense/towers/bee/launch_attack_bee {"damage":"2","speed":"30"}
execute as @e[tag=bee-center-marker,tag=upgrade_attack1,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 1 at @s run function core:defense/towers/bee/launch_attack_bee_short {"cooldown":"30","damage":"2","speed":"30"}

# Attack Upgrade 2
execute as @e[tag=bee-center-marker,tag=upgrade_attack2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 2 at @s run function core:defense/towers/bee/launch_attack_bee_final {"cooldown":"30","damage":"3","speed":"40"}
execute as @e[tag=bee-center-marker,tag=upgrade_attack2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 1 at @s run function core:defense/towers/bee/launch_attack_bee_short {"cooldown":"30","damage":"3","speed":"40"}

# Money Upgrade 1
execute as @e[tag=bee-center-marker,tag=upgrade_money1] if score @s defense.towers matches 1 at @s run function core:defense/towers/bee/launch_money_bee {"cooldown":"30","damage":"3","speed":"30","money":"1"}

# Money Upgrade 2
execute as @e[tag=bee-center-marker,tag=upgrade_money2] if score @s defense.towers matches 1 at @s run function core:defense/towers/bee/launch_money_bee {"cooldown":"25","damage":"3","speed":"30","money":"2"}

# MONEY RAIN
execute as @e[tag=bee-center-marker,tag=upgrade_money2] at @s if entity @p[gamemode=adventure,distance=..15] run function core:defense/towers/bee/money_rain
execute as @e[tag=bee-center-marker,tag=!defense.off,tag=upgrade_money2] at @s run rotate @s ~6 ~

# Bee ticking
execute as @e[tag=defense.bee_display] at @s run function core:defense/towers/bee/bee_ticking
# ====================================================================================================================
#       _                       
#      | |                      
#   ___| |_ ___  _ __ _ __ ___  
#  / __| __/ _ \| '__| '_ ` _ \ 
#  \__ \ || (_) | |  | | | | | |
#  |___/\__\___/|_|  |_| |_| |_|
# ====================================================================================================================
# Base
execute as @e[tag=storm-center-marker,tag=!upgrade1,tag=!upgrade_snow1,tag=!upgrade_snow2,tag=!upgrade_surge1,tag=!upgrade_surge2] if score @s defense.towers matches 1 at @s run function core:defense/towers/storm/target_entity {"cooldown":"100","damage":"8","blow_power":"0.7","range":"13.5"}
# First Upgrade
execute as @e[tag=storm-center-marker,tag=upgrade1] if score @s defense.towers matches 1 at @s run function core:defense/towers/storm/target_entity {"cooldown":"100","damage":"10","blow_power":"0.9","range":"14.5"}
# Snow 1
execute as @e[tag=storm-center-marker,tag=upgrade_snow1] if score @s defense.towers matches 1 at @s run function core:defense/towers/storm/target_entity_snow {"cooldown":"120","damage":"10","blow_power":"0.9","range":"15.5","freeze_time":"80","freeze_power":"3"}
# Snow 2
execute as @e[tag=storm-center-marker,tag=upgrade_snow2] if score @s defense.towers matches 1 at @s run function core:defense/towers/storm/target_entity_snow_storm {"cooldown":"120","damage":"12","blow_power":"1.2","range":"15.5","freeze_time":"100","freeze_power":"5"}

# Surge 1
execute as @e[tag=storm-center-marker,tag=upgrade_surge1] if score @s defense.towers matches 1 at @s run function core:defense/towers/storm/target_entity_chain {"cooldown":"80","damage":"12","blow_power":"0.5","range":"20.5","max_chain_length":"3","chain_radius":"4","chain_damage":"3"}
# Surge 2
execute as @e[tag=storm-center-marker,tag=upgrade_surge2] if score @s defense.towers matches 1 at @s run function core:defense/towers/storm/target_entity_chain {"cooldown":"80","damage":"15","blow_power":"0.5","range":"25.5","max_chain_length":"5","chain_radius":"6","chain_damage":"5"}

# Chain cloud particles
execute as @e[tag=defense.storm_cloud] at @s run particle minecraft:campfire_cosy_smoke ~ ~-52 ~ 0.5 0.3 0.5 0 100

# Freeze timer
execute as @e[tag=defense-monster] if score @s defense.storm.freeze_timer matches 1.. run scoreboard players remove @s defense.storm.freeze_timer 1
execute as @e[tag=defense-monster] if score @s defense.storm.freeze_timer matches 1.. at @s run particle snowflake ~ ~ ~ 0.2 1 0.2 0 5
execute as @e[tag=defense-monster] if score @s defense.storm.freeze_timer matches 1 run scoreboard players set @s defense.storm.freeze_power 0
# Freeze storm logic
execute at @e[tag=storm.freeze_storm] run particle snowflake ~ ~ ~ 0.5 1 0.5 0 30
execute as @e[tag=defense-monster,tag=!defense-stray] at @s if entity @n[tag=storm.freeze_storm,distance=..3] run scoreboard players set @s defense.storm.freeze_power 6
execute as @e[tag=defense-monster] at @s if entity @n[tag=storm.freeze_storm,distance=..3] run scoreboard players set @s defense.storm.freeze_timer 100

execute as @e[tag=storm.freeze_storm] if score @s defense.towers matches 1.. run scoreboard players remove @s defense.towers 1
execute as @e[tag=storm.freeze_storm] if score @s defense.towers matches 1 at @s run function core:defense/towers/storm/kill_freezestorm
# ====================================================================================================================
#                        | |      
#   _ __   __ _ _ __   __| | __ _ 
#  | '_ \ / _` | '_ \ / _` |/ _` |
#  | |_) | (_| | | | | (_| | (_| |
#  | .__/ \__,_|_| |_|\__,_|\__,_|
#  | |                            
#  |_|                            
# Base activation
execute as @e[tag=panda-center-marker,tag=!upgrade1,tag=!upgrade_shoot1,tag=!upgrade_shoot2,tag=!upgrade_bamboom1,tag=!upgrade_bamboom2] if score @s defense.towers matches 1 at @s run function core:defense/towers/panda/target_entity_normal {"cooldown":"100","damage":"4","range":"11.5","age":"0","leaves":"none","scale":"1.0","translation":"-0.5"}
# Upgrade 1
execute as @e[tag=panda-center-marker,tag=upgrade1] if score @s defense.towers matches 1 at @s run function core:defense/towers/panda/target_entity_normal {"cooldown":"60","damage":"5","range":"11.5","age":"0","leaves":"small","scale":"1.0","translation":"-0.5"}
# Shoot upgrade 1
execute as @e[tag=panda-center-marker,tag=upgrade_shoot1,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 10 at @s run function core:defense/towers/panda/target_entity_shoots1 {"cooldown":"10","damage":"4","range":"13.5","age":"1","leaves":"large","scale":"1.0","translation":"-0.5"}
execute as @e[tag=panda-center-marker,tag=upgrade_shoot1,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 5 at @s run function core:defense/towers/panda/target_entity_shoots1 {"cooldown":"5","damage":"4","range":"13.5","age":"1","leaves":"large","scale":"1.0","translation":"-0.5"}
execute as @e[tag=panda-center-marker,tag=upgrade_shoot1] if score @s defense.towers matches 1 at @s run function core:defense/towers/panda/target_entity_shoots1 {"cooldown":"70","damage":"4","range":"13.5","age":"1","leaves":"large","scale":"1.0","translation":"-0.5"}
# Shoot upgrade 2
execute as @e[tag=panda-center-marker,tag=upgrade_shoot2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 20 at @s run function core:defense/towers/panda/target_entity_shoots2 {"cooldown":"20","damage":"4","range":"15.5","age":"1","leaves":"large","scale":"1.5","translation":"-0.75"}
execute as @e[tag=panda-center-marker,tag=upgrade_shoot2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 15 at @s run function core:defense/towers/panda/target_entity_shoots2 {"cooldown":"15","damage":"4","range":"15.5","age":"1","leaves":"large","scale":"1.5","translation":"-0.75"}
execute as @e[tag=panda-center-marker,tag=upgrade_shoot2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 10 at @s run function core:defense/towers/panda/target_entity_shoots2 {"cooldown":"10","damage":"4","range":"15.5","age":"1","leaves":"large","scale":"1.5","translation":"-0.75"}
execute as @e[tag=panda-center-marker,tag=upgrade_shoot2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 5 at @s run function core:defense/towers/panda/target_entity_shoots2 {"cooldown":"5","damage":"4","range":"15.5","age":"1","leaves":"large","scale":"1.5","translation":"-0.75"}
execute as @e[tag=panda-center-marker,tag=upgrade_shoot2] if score @s defense.towers matches 1 at @s run function core:defense/towers/panda/target_entity_shoots2 {"cooldown":"70","damage":"4","range":"15.5","age":"1","leaves":"large","scale":"1.5","translation":"-0.75"}

# BamBOOM upgrade 1
execute as @e[tag=panda-center-marker,tag=upgrade_bamboom1] if score @s defense.towers matches 1 at @s run function core:defense/towers/panda/target_entity_bomb {"cooldown":"70","damage":"8","range":"12.5","bomb_range":"3"}

# BamBOOM upgrade 2
execute as @e[tag=panda-center-marker,tag=upgrade_bamboom2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 10 at @s run function core:defense/towers/panda/target_entity_multi_bomb {"cooldown":"10","damage":"8","range":"13.5","bomb_range":"3"}
execute as @e[tag=panda-center-marker,tag=upgrade_bamboom2,tag=!defense.giant_disabled,tag=!defense.warden_disabled,tag=!defense.creeper_disabled] if score @s defense.towers matches 5 at @s run function core:defense/towers/panda/target_entity_multi_bomb {"cooldown":"5","damage":"8","range":"13.5","bomb_range":"3"}
execute as @e[tag=panda-center-marker,tag=upgrade_bamboom2] if score @s defense.towers matches 1 at @s run function core:defense/towers/panda/target_entity_multi_bomb {"cooldown":"80","damage":"8","range":"16.5","bomb_range":"3"}

# TNT ticking
execute as @e[tag=defense.panda_tnt] at @s run function core:defense/towers/panda/bomb_ticking
execute as @e[tag=defense.panda_tnt] at @s run function core:defense/towers/panda/bomb_ticking
# (run twice to move at double speed)

# Display bomb ranges
execute as @e[tag=defense.panda_landing] at @s run rotate @s ~6 ~
execute as @e[tag=defense.panda_landing] at @s positioned ~ -58.5 ~ run function core:defense/towers/panda/get_particle_range

# remove tags
execute as @e[tag=panda-center-marker,tag=!upgrade1,tag=!upgrade_shoot1,tag=!upgrade_shoot2,tag=!upgrade_bamboom1,tag=!upgrade_bamboom2] if score @s defense.towers matches 100 at @s as @e[tag=defense.panda,distance=..3.5] run tag @s remove defense.attacked
execute as @e[tag=panda-center-marker,tag=upgrade1] if score @s defense.towers matches 60 at @s as @e[tag=defense.panda,distance=..3.5] run tag @s remove defense.attacked 
execute as @e[tag=panda-center-marker,tag=upgrade_shoot1] if score @s defense.towers matches 70 at @s as @e[tag=defense.panda,distance=..3.5] run tag @s remove defense.attacked 
execute as @e[tag=panda-center-marker,tag=upgrade_shoot2] if score @s defense.towers matches 70 at @s as @e[tag=defense.panda,distance=..3.5] run tag @s remove defense.attacked 

# Bamboo stab display
execute as @e[tag=defense.panda_boo] if score @s defense.panda_boo_delay matches 1.. run scoreboard players remove @s defense.panda_boo_delay 1
execute as @e[tag=defense.panda_boo_attacker,tag=!defense.panda_boo_attacked] if score @s defense.panda_boo_delay matches 16 at @s run function core:defense/towers/panda/get_damage
execute as @e[tag=defense.panda_boo] if score @s defense.panda_boo_delay matches 5 at @s run tp @s ~ ~-2.9 ~
execute as @e[tag=defense.panda_boo] if score @s defense.panda_boo_delay matches 1 run kill @s

# Rotations
execute as @e[tag=defense.panda] at @s positioned ~ -59 ~ run function core:defense/towers/panda/get_range

# ====================================================================================================================
# End stuff
execute as @p[gamemode=spectator] if score $dead defense matches 1 run spectate @n[tag=defense.failure_view]
execute if score $dead defense matches 1 run function core:defense/end/clear_all_waves