tp @s ~ ~1 ~
tag @s add defense-monster
data modify entity @s Invulnerable set value 0b
attribute @s attack_knockback base set 90
data modify entity @s HurtTime set value 10
execute store result score @s defense.abilities run random value 50..100