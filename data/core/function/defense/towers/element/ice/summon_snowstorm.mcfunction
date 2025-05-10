$damage @s $(damage) core:defense/freeze
$damage @s[tag=defense-blaze] $(damage) core:defense/freeze by @p
summon minecraft:marker ~ -57 ~ {Tags:["element-snowstorm"]}
playsound entity.breeze.idle_ground master @a ~ ~ ~ 1