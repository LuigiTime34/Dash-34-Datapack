execute if entity @s[tag=defense-illusioner_decoy] at @s run return run function core:defense/monsters/boss/ravager/decoy_disappear

playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 100000000000 0.8
# playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 100000000000 0.8

execute store result score @s defense.damage run data get entity @s Health
execute store result score @s defense.extra_damage run attribute @s attack_damage get
scoreboard players operation @s defense.damage += @s defense.extra_damage
#execute if entity @s[tag=defense.weakened] run function core:defense/towers/archer/witch/witch_weaken

scoreboard players set $recent_hit defense.damage 20
scoreboard players operation $recent_damage defense.damage += @s defense.damage
scoreboard players operation $defense.health defense.damage -= @s defense.damage

damage @s 9999 generic by @p

function core:defense/scoreboard/get_highest

# See if the health has changed to uppdate the castle look
execute if score $defense.health defense.damage matches 251..500 unless block -63 -44 131 yellow_concrete run function core:defense/monsters/castle/half_health
execute if score $defense.health defense.damage matches ..250 unless block -63 -44 131 red_concrete run function core:defense/monsters/castle/low_health
execute if score $defense.health defense.damage matches 500.. unless block -63 -44 131 lime_concrete run function core:defense/monsters/castle/reset

execute if score $defense.health defense.damage matches ..0 run function core:defense/end/end {"outcome":"loss"}