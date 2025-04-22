clear @s iron_chestplate
give @s minecraft:iron_chestplate[custom_name='["",{"text":"Enter Ariel View","italic":false,"color":"green"}]',lore=['["",{"text":"Right click to view your towers from above","color":"dark_gray"}]'],equippable={slot:chest},!attribute_modifiers,item_model="minecraft:spyglass",custom_data={"defense.ariel_view":true}]
summon marker ~ ~ ~ {Tags:["defense.ariel_view_return"]}
gamemode spectator @s
spectate @e[tag=defense.ariel_view_marker,limit=1] @s
execute at @s run playsound entity.enderman.teleport master @s ~ ~ ~ 1
tag @s add defense.ariel_view