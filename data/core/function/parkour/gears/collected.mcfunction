clear @s *[custom_data={gear:1b}]
scoreboard players add $gears parkour 1
tellraw @a {"text": "You found a gear!","color": "green"}
execute as @a[gamemode=adventure] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 0.6
execute as @a[gamemode=adventure] at @s run playsound block.chain.place master @s ~ ~ ~ 1 0.7