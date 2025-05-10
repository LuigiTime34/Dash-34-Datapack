title @a times 100 30 10
title @a title "\uE035"
playsound entity.wither.death master @a ~ ~ ~ 1000000000000000000 0.7
schedule function core:defense/end/cleanup 125t
$function core:defense/end/$(outcome)