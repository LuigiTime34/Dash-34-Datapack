tellraw @a ["",{"text":"You escaped in ","color":"green"},{"score":{"name":"#timerminutes","objective":"timer"},"color":"green"},{"text":" Minutes and ","color":"green"},{"score":{"name":"#timerseconds","objective":"timer"},"color":"green"},{"text":" Seconds!","color":"green"}]
execute unless score #timerminutes timer matches 6..14 run playsound entity.experience_orb.pickup master @p[gamemode=adventure] ~ ~ ~ 10000000000000 2
clear @p[gamemode=adventure]
execute if score #timerminutes timer matches ..5 run advancement grant @p[gamemode=adventure] only core:escape/escapist
execute if score #timerminutes timer matches 15.. run advancement grant @p[gamemode=adventure] only core:escape/you_had_one_job
schedule function core:escape/dialouge2 40t