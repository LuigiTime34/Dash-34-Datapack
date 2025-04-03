# Store each score into its respective storage.
execute store result storage core:defense_scoreboard health int 1 run scoreboard players get $defense.health defense.damage
execute store result storage core:defense_scoreboard money int 1 run scoreboard players get $money defense.money
# execute store result storage core:defense_scoreboard wave int 1 run scoreboard players get $wave_level defense.wave
# execute store result storage core:defense_scoreboard timer int 1 run scoreboard players get $wave_timer defense.wave
# also get the most recent gold gathered and damage taken
execute store result storage core:defense_scoreboard recent_gold int 1 run scoreboard players get $recent_money defense.money
execute store result storage core:defense_scoreboard recent_damage int 1 run scoreboard players get $recent_damage defense.damage

# Get highest score for each category, and then add spaces to the scoreboard based on which one is the highest.
scoreboard players set #max defense.display -2147483648

scoreboard players operation #max defense.display > $defense.health defense.damage
scoreboard players operation #max defense.display > $money defense.money
# scoreboard players operation #max defense.display > $wave_level defense.wave
# scoreboard players operation #max defense.display > $wave_timer defense.wave

execute if score $defense.health defense.damage = #max defense.display store result storage core:defense_scoreboard spaces int 1 run scoreboard players get $defense.health defense.damage
execute if score $money defense.money = #max defense.display store result storage core:defense_scoreboard spaces int 1 run scoreboard players get $money defense.money
# execute if score $defense.wave_level defense.wave = #max defense.display store result storage core:defense_scoreboard spaces int 1 run scoreboard players get $wave_level defense.wave
# execute if score $defense.wave_timer defense.wave = #max defense.display store result storage core:defense_scoreboard spaces int 1 run scoreboard players get $wave_timer defense.wave

function core:defense/scoreboard/update_all with storage core:defense_scoreboard