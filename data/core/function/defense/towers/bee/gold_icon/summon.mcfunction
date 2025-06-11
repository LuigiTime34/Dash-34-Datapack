function core:defense/towers/bee/gold_icon/generate_random_motion

summon item ~ ~ ~ {Tags:["defense.gold_item","new"],Item:{id:"minecraft:stick", components:{item_model:"minecraft:gold_ingot"}},Age:5980,PickupDelay:32767,Glowing:1b}

execute as @e[type=item,tag=new] run function core:defense/towers/bee/gold_icon/gold_init