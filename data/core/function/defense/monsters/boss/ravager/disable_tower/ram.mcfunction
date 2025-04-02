tp @s ^ ^ ^3
playsound entity.wither.break_block master @a ~ ~ ~ 1 0.7
tag @e[tag=defense.ravager_ram,limit=1] add defense.ravager_disabled
execute as @e[tag=defense.ravager_disabled,limit=1] run scoreboard players set @s defense.abilities 300
tag @e[tag=defense.ravager_ram,limit=1] remove defense.ravager_ram