playsound entity.enderman.teleport master @a ~ ~ ~ 0.5
function core:defense/monsters/abilities/enderman_recursive
scoreboard players set @s defense.abilities 203
execute unless predicate {condition:"random_chance","chance":0.5} run return 0
function core:defense/monsters/summon/endermite
rotate @n[tag=defense-endermite] facing entity @s feet