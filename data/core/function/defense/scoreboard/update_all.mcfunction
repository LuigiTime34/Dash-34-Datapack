# Update health display - if the base recently took damage, display a - and the gold they got, otherwise, just display health
$execute unless score $recent_hit defense.damage matches 1.. run scoreboard players display name $defense.health defense.display ["",{"text":"\u0001","color":"white"},{"text": "\u0001","font": "minecraft:negative"},{"text": "\u0003","font": "minecraft:positive"},{"text":"     "},{"text": "$(health)","font": "minecraft:negative"},{"text": "$(spaces)","font": "minecraft:positive"},{"text":"$(health)","color":"red"},{"text":" +000","font":"minecraft:positive"}]

$execute if score $recent_hit defense.damage matches 1.. run scoreboard players display name $defense.health defense.display ["",{"text":"\u0001","color":"white"},{"text": "\u0001","font": "minecraft:negative"},{"text": "\u0003","font": "minecraft:positive"},{"text":"     "},{"text": "$(health)","font": "minecraft:negative"},{"text": "$(spaces)","font": "minecraft:positive"},{"text":"$(health)","color":"red"},{"text":" -$(recent_damage)","color":"red"}]

# Update gold display - if the player recently got gold, display a + and the gold they got, otherwise, just display the gold.
$execute unless score $recent_kill defense.money matches 1.. run scoreboard players display name $money defense.display ["",{"text":"\u0002","color":"white"},{"text": "\u0002","font": "minecraft:negative"},{"text": "\u0003","font": "minecraft:positive"},{"text":"     "},{"text": "$(money)","font": "minecraft:negative"},{"text": "$(spaces)","font": "minecraft:positive"},{"text":"$(money)","color":"gold"},{"text":" +000","font":"minecraft:positive"}]

$execute if score $recent_kill defense.money matches 1.. run scoreboard players display name $money defense.display ["",{"text":"\u0002","color":"white"},{"text": "\u0002","font": "minecraft:negative"},{"text": "\u0003","font": "minecraft:positive"},{"text":"     "},{"text": "$(money)","font": "minecraft:negative"},{"text": "$(spaces)","font": "minecraft:positive"},{"text":"$(money)","color":"gold"},{"text":" +$(recent_gold)","color":"gold"}]

# $scoreboard players display name $wave_level defense.display ["",{"text":"\u0003","color":"white"},{"text": "\u0003","font": "minecraft:negative"},{"text": "\u0003","font": "minecraft:positive"},{"text":"     "},{"text": "$(wave)","font": "minecraft:negative"},{"text": "$(spaces)","font": "minecraft:positive"},{"text":"$(wave)","color":"dark_aqua"},{"text":" +000","font":"minecraft:positive"}]

# $scoreboard players display name $wave_timer defense.display ["",{"text":"\u0004","color":"white"},{"text": "\u0004","font": "minecraft:negative"},{"text": "\u0003","font": "minecraft:positive"},{"text":"     "},{"text": "$(timer)","font": "minecraft:negative"},{"text": "$(spaces)","font": "minecraft:positive"},{"text":"$(timer)","color":"aqua"},{"text":" +000","font":"minecraft:positive"}]