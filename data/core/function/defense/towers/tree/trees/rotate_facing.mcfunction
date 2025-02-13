execute run rotate @s facing entity @n[tag=defense-monster] eyes
execute run rotate @s ~ 0
execute store result score @s defense.rotation run data get entity @s Rotation[0]
execute if score @s defense.rotation matches -45..45 run rotate @s 0 ~
execute if score @s defense.rotation matches 46..135 run rotate @s 90 ~
execute if score @s defense.rotation matches 136..180 run rotate @s -180 ~
execute if score @s defense.rotation matches -180..-135 run rotate @s -180 ~
execute if score @s defense.rotation matches -136..-44 run rotate @s -90 ~