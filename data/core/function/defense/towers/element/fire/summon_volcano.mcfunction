$damage @s[tag=!defense-blaze] $(damage) core:defense/on_fire by @p
summon minecraft:blaze ~ -59.5 ~ {NoAI:true,Invulnerable:true,CustomName:"Dinnerbone",Silent:true,Tags:["element-blaze"]}
# Summon interaction to stop the player to see the name of the blaze
summon minecraft:interaction ~ ~ ~ {width:0.7,height:1.9,Tags:["element-blaze-blocker"]}
playsound minecraft:item.firecharge.use master @a ~ ~ ~ 1 0.7