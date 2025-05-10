scoreboard players set @s defense.abilities 200
execute run playsound minecraft:entity.warden.sonic_charge master @a ~ ~ ~ 10
schedule function core:defense/monsters/boss/warden/play_sound 40t
# scoreboard players remove $defense.health defense.damage 10