tp @s ~ ~2.9 ~
scoreboard players set @s defense.panda_boo_delay 20
$scoreboard players set @s defense.panda_boo_damage $(damage)
tag @s remove defense.new_boo
#scoreboard players operation @s UUID = @n[tag=defense.getting_uuid] UUID
#tag @n[tag=defense.getting_uuid] remove defense.getting_uuid