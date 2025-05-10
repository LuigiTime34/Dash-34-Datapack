advancement grant @a only core:defense/mobs/illusioner
tag @s add defense-monster
tag @s add cw_hp_disp
data modify entity @s CustomNameVisible set value 1b
scoreboard players set @s defense.abilities 300
scoreboard players set $illusioner_decoy defense.abilities 200
execute at @s run tp @s ~ -59 ~