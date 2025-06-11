$tp @s ^ ^ ^-$(blow_power)
tag @s add chosen-path
$data modify storage core:defense.storm_blowback power set value $(blow_power)
execute store result score $blow_power defense.distance run data get storage core:defense.storm_blowback power 100
scoreboard players operation @s defense.distance -= $blow_power defense.distance