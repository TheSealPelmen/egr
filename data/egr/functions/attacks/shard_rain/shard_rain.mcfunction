execute as @s[scores={egr_attack3_cd = ..549}] run scoreboard players add @s egr_attack3_cd 1
execute as @s[scores={egr_attack3_cd = ..549}] at @s if entity @p[distance=..8] run scoreboard players add @s egr_attack3_cd 1
execute as @s[tag=shard_rain_progress,scores={rain_shard = ..59}] run scoreboard players add @s rain_shard 1
execute as @s[scores={rain_shard = 1}] at @s run function egr:attacks/shard_rain/shard_rain_warning
execute as @s[scores={rain_shard = 1..}] at @s run function egr:attacks/shard_rain/shard_rain_attack
execute as @s[scores={egr_attack3_cd= 550..}] at @s run tag @s add shard_rain_progress
execute as @e[tag=Shard,tag=!spawned] run scoreboard players set @s guardian_shard 0
execute as @e[tag=Shard,tag=!spawned] run tag @s add spawned
#
execute as @e[scores={rain_shard=1}] at @s run playsound entity.evoker.prepare_summon neutral @a 1 1 0
execute as @e[scores={rain_shard=1}] at @s run title @a[distance=..30] subtitle {"text":"Careful!","color":"red","bold":true}