scoreboard objectives add vdvcasttemp dummy
scoreboard objectives add items.smash.cooldown dummy
scoreboard objectives add items.cooldown dummy
scoreboard objectives add mobs.axethrow dummy
scoreboard objectives add delay dummy
scoreboard objectives add timer dummy
scoreboard objectives add music trigger
scoreboard objectives add defense dummy
scoreboard objectives add memory dummy
scoreboard objectives add defense.abilities dummy
scoreboard objectives add defense.intersection dummy
scoreboard objectives add defense.speed dummy
scoreboard objectives add defense.slowness dummy
scoreboard objectives add parkour dummy
scoreboard objectives add parkour.deaths deathCount
scoreboard objectives add parkour.belttimer dummy
scoreboard objectives add defense.damage dummy
scoreboard objectives add defense.extra_damage dummy
scoreboard objectives add defense.money dummy
scoreboard objectives add archercasttemp dummy
scoreboard objectives add defense.archer_slowness dummy
scoreboard objectives add defense.archer_weakness dummy
scoreboard objectives add defense.towers dummy
scoreboard objectives add defense.wave dummy
scoreboard objectives add defense.display dummy
scoreboard objectives add defense.rotation dummy
scoreboard objectives add defense.element_random dummy
scoreboard objectives add progress dummy
scoreboard objectives add defense.element.freeze_timer dummy
scoreboard objectives add defense.movement dummy
scoreboard objectives add defense.distance dummy
scoreboard objectives add defense.targetx dummy
scoreboard objectives add defense.targetz dummy
scoreboard objectives add defense.bee_cooldown dummy
scoreboard objectives add left minecraft.custom:leave_game
scoreboard objectives add defense.range_indicator dummy
scoreboard objectives add defense.towers_range_particle dummy
scoreboard objectives add defense.items dummy
scoreboard objectives add defense.element.ice_power dummy
scoreboard objectives add defense.bee.honey_slowness dummy
scoreboard objectives add defense.entity_id dummy
scoreboard objectives add defense.marker_id dummy
scoreboard objectives add defense.ravager_speed dummy
scoreboard objectives add defense.boss_animation dummy
scoreboard objectives add defense.health dummy
scoreboard objectives add defense.bee_tower dummy
scoreboard objectives add defense.storm.freeze_timer dummy
scoreboard objectives add defense.storm.freeze_power dummy
scoreboard objectives add defense.storm dummy
scoreboard objectives add defense.bogged_health dummy
scoreboard objectives add defense.panda_boo_delay dummy
scoreboard objectives add defense.panda_boo_damage dummy
scoreboard objectives add defense.panda_bomb_range dummy
scoreboard objectives add UUID dummy

team add defense_enemies
bossbar add defense.mobs_left ["",{"text":"WAVE ","bold":true,"color":"aqua"},{"score":{"name":"$wave_level","objective":"defense.wave"},"bold":true,"color":"aqua"}]

team add Players
team add Monsters
team add green
execute as @e[tag=defense.panda] run data modify entity @s NoAI set value 0b
schedule function core:defense/towers/panda/remove_ai 1s

tellraw @a {"text": "Datapack Has Loaded Succesfully!","color": "green","bold": true}
playsound minecraft:block.note_block.xylophone master @a ~ ~ ~ 100000000000