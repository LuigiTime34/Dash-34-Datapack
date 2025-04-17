# execute as @a run function tl:title {"text":"'Wave complete!'","tick":1,"location":"actionbar","sound":"'block.note_block.hat master @s ~ ~ ~ 1 2 1'"}
function core:defense/monsters/waves/animation
scoreboard players set $wave_timer defense.wave 30
function core:defense/scoreboard/wave_timer
give @a[gamemode=adventure] iron_helmet[custom_name='["",{"text":"Start Next Wave","italic":false,"color":"green"}]',lore=['["",{"text":"Right Click to begin the next wave.","color":"dark_gray"}]'],equippable={slot:head,equip_sound:"entity.iron_golem.repair",camera_overlay:"minecraft:red"},item_model="green_concrete",custom_data={defense.start_wave:1b},!attribute_modifiers]