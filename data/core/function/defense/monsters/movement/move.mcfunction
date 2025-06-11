#say Moving!
$scoreboard players add @s defense.distance $(distance)
#tellraw @a {"score": {"name": "@s","objective": "defense.distance"}}
tag @s add this.moving.entity
$execute positioned ^ ^ ^$(speed) run summon marker ~ ~ ~ {Tags:["this.moving.target"]}
execute at @e[type=marker,tag=this.moving.target,limit=1] rotated as @s run tp @e[type=marker,tag=this.moving.target,limit=1] ~ ~ ~ ~ ~
# movement check + movement itself
# moves marker back to the entity or hits an intersection
execute as @e[type=marker,tag=this.moving.target,limit=1] at @s run function core:defense/monsters/movement/move_fallback with storage core:mob_speed
tp @s @e[type=marker,tag=this.moving.target,limit=1]
# kill a marker and cleanup
kill @e[type=marker,tag=this.moving.target,limit=1]