# See if they have enough money
$execute unless score $money defense.money matches $(gold_cost).. at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 2 1
$execute unless score $money defense.money matches $(gold_cost).. run return run tellraw @s {"text": "Not enough gold!","color": "gold"}

# If they do, take away the amount they paid and give them an emerald
$scoreboard players remove $money defense.money $(gold_cost)
$give @s emerald $(emerald_cost)

# Particles and sounds
execute at @n[tag=atm-interaction] run particle happy_villager ~ ~ ~ 0.5 0.5 0.5 0.3 10
function core:defense/atm/sounds/sound1

# Update display
function core:defense/scoreboard/get_highest