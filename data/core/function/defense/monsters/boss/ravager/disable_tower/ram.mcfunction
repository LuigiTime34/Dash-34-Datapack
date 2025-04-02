execute at @s run tp @s ^ ^ ^3
execute at @s run playsound entity.wither.break_block master @a ~ ~ ~ 1 0.7
tag @e[tag=defense.ravager_ram,limit=1] add defense.ravager_disabled
tag @e[tag=defense.ravager_ram,limit=1] remove defense.ravager_ram