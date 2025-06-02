tellraw @a {"text":"Welcome to your next test. This assessment focuses on defensive strategy and adaptation. Waves of hostile entities will attempt to breach your defenses. Your objective: Prevent them from reaching the castle. Towers, upgrades, and support tools are available. Use them wisely.","color":"green"}
execute as @a at @s run playsound minecraft:sound.custom.dialouge.4thpuzzle_greeting voice @s ~ ~ ~ 10000000000000000

function core:defense/monsters/castle/reset
#function core:defense/items/tnt/reset_position
#function core:defense/monsters/waves/reset_towers
execute as @e[tag=defense.blocker_marker] at @s run function core:defense/blockers/get_blocker