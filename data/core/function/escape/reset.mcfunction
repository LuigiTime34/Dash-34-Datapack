clone 19 -60 24 19 -60 24 4 -55 17
clone 19 -60 23 19 -60 23 14 -60 22
clone 19 -60 22 19 -60 22 13 -60 23
clone 19 -60 21 19 -60 21 14 -59 23
clone 19 -60 20 19 -60 20 4 -60 27
clone 19 -60 19 19 -60 19 17 -60 17
clone 19 -60 18 19 -60 18 -5 -62 23
clone 19 -60 17 19 -60 17 17 -61 17
clone 22 -60 3 16 -57 9 5 -60 0
clone 19 -60 16 19 -60 16 13 -60 9
clone 19 -60 15 19 -60 15 7 -58 9
clone 19 -60 13 19 -60 13 4 -61 8
fill -1 -58 5 1 -60 5 minecraft:iron_block
fill 4 -60 24 4 -59 24 minecraft:cobbled_deepslate_wall
fill 15 -60 17 15 -59 17 minecraft:tuff_wall
fill 8 -60 9 10 -60 9 air
fill 6 -59 6 6 -60 6 cobbled_deepslate
setblock 5 -56 5 air
setblock 5 -56 5 chiseled_bookshelf[facing=east]
setblock 15 -61 17 minecraft:cracked_deepslate_bricks replace
setblock -5 -58 11 air
setblock -2 -58 11 air
setblock 14 -62 10 minecraft:redstone_block
tag @p[gamemode=adventure] remove escape-done
kill @e[tag=escape-minecart]
setblock 6 -50 1 minecraft:lever[powered=false,facing=east]
setblock 3 -49 1 air
setblock 3 -49 1 redstone_wire
tag @n[tag=minecart-indicator] remove on
tag @n[tag=crafting-indicator] remove on
fill -7 -58 19 -7 -60 17 air
data modify entity @n[tag=escape-rack] HandItems set value [{components:{"minecraft:can_break":{predicates:[{blocks:"minecraft:tuff_wall"}]},"minecraft:custom_name":'{"extra":[{"color":"gray","italic":false,"text":"Tuff Tearer"}],"text":""}',"minecraft:damage":129,"minecraft:lore":['{"extra":[{"color":"green","text":"\\"Not so Tuff now, are ya?\\"™"}],"text":""}']},count:1,id:"minecraft:stone_pickaxe"},{}]