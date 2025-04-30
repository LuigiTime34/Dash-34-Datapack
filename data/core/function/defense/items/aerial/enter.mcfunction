clear @s iron_chestplate
# summon marker ~ ~ ~ {Tags:["defense.aerial_view_return"]}
gamemode spectator @s
spectate @e[tag=defense.aerial_view_marker,limit=1] @s
execute at @s run playsound entity.enderman.teleport master @s ~ ~ ~ 1
tag @s add defense.aerial_view

execute unless items entity @s hotbar.8 * run return run item replace entity @s hotbar.8 with iron_chestplate[custom_name='["",{"text":"Enter Aerial View","italic":false,"color":"green"}]',lore=['["",{"text":"Right click to view your towers from above","color":"dark_gray"}]'],equippable={slot:chest},!attribute_modifiers,item_model="minecraft:spyglass",custom_data={"defense.aerial_view":true}]
give @s minecraft:iron_chestplate[custom_name='["",{"text":"Enter Aerial View","italic":false,"color":"green"}]',lore=['["",{"text":"Right click to view your towers from above","color":"dark_gray"}]'],equippable={slot:chest},!attribute_modifiers,item_model="minecraft:spyglass",custom_data={"defense.aerial_view":true}]