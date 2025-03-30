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
scoreboard objectives add defense.kill_piglin minecraft.killed:minecraft.piglin
scoreboard objectives add defense.kill_villager minecraft.killed:minecraft.zombie_villager
scoreboard objectives add defense.kill minecraft.custom:minecraft.mob_kills
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

team add defense_enemies
bossbar add defense_health {"text":"REAMINING HEALTH","bold":true,"color":"aqua"}

team add Players
team add Monsters

tellraw @a {"text": "Datapack Has Loaded Succesfully!","color": "green","bold": true}
playsound minecraft:block.note_block.xylophone master @a ~ ~ ~ 100000000000