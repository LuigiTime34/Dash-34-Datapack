scoreboard players set @s defense.abilities 100
execute if predicate {"condition":"minecraft:random_chance","chance":0.6} run return 0

damage @s 4 mob_attack
particle sweep_attack ~ ~ ~ 0.1 0.5 0.1 0 10
playsound minecraft:entity.item.break master @a ~ ~ ~ 0.4 1
playsound minecraft:item.axe.scrape master @a ~ ~ ~ 1 1.5
attribute @s attack_knockback base set 180