kill @e[tag=defense-monster]
kill @e[tag=defense-baby_zombie]
kill @e[tag=defense-skeleton_rider]
kill @e[tag=defense-illusioner]

advancement grant @a only core:defense/not_according_to_plan
gamemode spectator @p[gamemode=adventure]
scoreboard players set $dead defense 1

schedule function core:defense/end/explode 15t append
schedule function core:defense/end/explode 30t append
schedule function core:defense/end/explode 45t append
schedule function core:defense/end/explode 60t append
schedule function core:defense/end/explode 75t append
schedule function core:defense/end/explode 90t append
schedule function core:defense/end/explode 105t append
schedule function core:defense/end/explode 120t append