playsound entity.enderman.teleport master @a ~ ~ ~ 0.5
function core:defense/monsters/abilities/enderman_recursive
scoreboard players set @s defense.abilities 203
execute if predicate {condition:"random_chance","chance":0.5} rotated as @s run function core:defense/monsters/summon/endermite