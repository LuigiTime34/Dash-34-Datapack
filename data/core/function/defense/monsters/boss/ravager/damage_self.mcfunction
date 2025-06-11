scoreboard players set @s defense.abilities 200
damage @s 10 mob_attack
particle sweep_attack ~ ~0.5 ~ 0.5 0.5 0.5 0 100
playsound minecraft:entity.player.attack.knockback master @a ~ ~ ~ 10 1
playsound minecraft:entity.player.attack.nodamage master @a ~ ~ ~ 10 1.5
attribute @s attack_knockback base set 260