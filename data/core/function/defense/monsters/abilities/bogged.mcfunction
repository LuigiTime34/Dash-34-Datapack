execute store result score @s defense.damage run data get entity @s Health 10
scoreboard players operation @s defense.damage += $bogged_10 defense.damage
execute store result storage core:defense.bogged_health health float 0.1 run scoreboard players get @s defense.damage
data modify entity @s Health set from storage core:defense.bogged_health health
data modify entity @s HurtTime set value 10
particle spore_blossom_air ~ ~1 ~ 0.3 0.3 0.3 0 2
playsound minecraft:item.bone_meal.use master @a ~ ~ ~ 2 0.5
scoreboard players set @s defense.abilities 20