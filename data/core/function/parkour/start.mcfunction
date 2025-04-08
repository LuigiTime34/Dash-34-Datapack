function core:parkour/door/door_reset
tp @a[gamemode=adventure] -143 -53 -34 -90 0
spawnpoint @a[gamemode=adventure] -143 -53 -34
function core:parkour/dev/place_checkpoint
tellraw @a {"text": "This next test focuses on precision and agility. Your goal is to navigate through the obstacle course and collect as many Gears as possible. While 15 Gears are required to pass, gathering more will greatly boost your overall score. The Gears are scattered throughout the course, often in tricky spots that will challenge your spatial awareness, jumping ability, and parkour skills. Some blocks along the way may grant helpful items or effects, so keep an eye out for them. Although speed is still a factor, the true test lies in how effectively you can plan your path and retrieve the Gears. Good luck!","color": "green"}
scoreboard players set $gears parkour 0
scoreboard players set $deaths parkour 0
execute at @a run playsound minecraft:sound.custom.dialouge.3rdpuzzle_greeting voice @a ~ ~ ~ 10000000000000000000000000000
schedule function core:parkour/door/door1 680t
kill @e[type=item,nbt={Item:{id:"minecraft:chain"}}]
function core:parkour/gears/summon