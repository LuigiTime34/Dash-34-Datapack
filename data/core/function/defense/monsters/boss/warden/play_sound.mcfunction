# Disabling method (current method)
execute as @n[tag=defense-warden] at @s run tag @e[tag=defense.tower_marker,limit=1,distance=..10,sort=random] add defense.warden_disabled
execute unless entity @n[tag=defense.tower_marker,tag=defense.warden_disabled] run return fail
execute as @n[tag=defense-warden] at @s facing entity @n[tag=defense.warden_disabled] feet anchored feet positioned ^ ^ ^ positioned ~ ~0.5 ~ run function core:defense/monsters/boss/warden/start_ray
execute at @n[tag=defense-warden] run playsound minecraft:entity.warden.sonic_boom master @a ~ ~ ~ 10

# Damage method (unused rn)
# execute as @n[tag=defense-warden] at @s anchored eyes positioned ^ ^ ^ facing -61 -50 116 anchored feet positioned ~ ~-0.5 ~ run function core:defense/monsters/boss/warden/start_ray

# execute if score $defense.health defense.damage matches ..50 run return fail

# scoreboard players set $recent_hit defense.damage 20
# scoreboard players add $recent_damage defense.damage 10
# scoreboard players remove $defense.health defense.damage 10

# damage @s 10 generic by @p

# function core:defense/scoreboard/get_highest

# # See if the health has changed to uppdate the castle look
# execute if score $defense.health defense.damage matches 101..250 unless block -63 -44 131 red_concrete run function core:defense/monsters/castle/low_health
# execute if score $defense.health defense.damage matches 251..500 unless block -63 -44 131 yellow_concrete run function core:defense/monsters/castle/low_health
# execute if score $defense.health defense.damage matches 500.. unless block -63 -44 131 green_concrete run function core:defense/monsters/castle/reset