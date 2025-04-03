playsound entity.enderman.teleport master @a ~ ~ ~ 0.5
tag @s add defense.enderman-tping
function core:defense/monsters/abilities/enderman_recursive
tag @s remove defense.enderman-tping

tag @s add this
# Find the linked enderman
execute as @e[type=marker,tag=this,limit=1] if score @s defense.entity_id = @n[type=enderman,tag=defense-enderman,tag=this] defense.marker_id run tp @s ~ ~ ~

scoreboard players set @s defense.abilities 203
execute unless predicate {condition:"random_chance","chance":0.5} run return 0
function core:defense/monsters/summon/endermite
rotate @n[tag=defense-endermite] facing entity @s feet