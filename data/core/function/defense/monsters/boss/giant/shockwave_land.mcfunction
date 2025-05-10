attribute @s attack_knockback base set 80
playsound minecraft:entity.player.attack.crit master @a ~ ~ ~ 10 0.5
playsound minecraft:item.mace.smash_air master @a ~ ~ ~ 10 0.5
particle minecraft:block_crumble{block_state:{Name:dirt}} ~ ~ ~ 2 0.1 2 0 1000
execute positioned ~ -59 ~ as @e[tag=defense.tower_marker,distance=..13] run tag @s add defense.giant_disabled