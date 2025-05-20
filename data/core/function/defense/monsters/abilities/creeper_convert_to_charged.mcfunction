data merge entity @s {powered:1b}
summon marker ~ ~ ~ {Tags:["defense.creeper-death"]}
ride @n[tag=defense.creeper-death] mount @s
playsound item.trident.thunder master @a ~ ~ ~ 1 0.75
tag @s add defense-charged_creeper
tag @s remove defense-creeper
execute as @a[advancements={core:defense/mobs/charged_creeper=false}] run advancement grant @s only core:defense/mobs/charged_creeper