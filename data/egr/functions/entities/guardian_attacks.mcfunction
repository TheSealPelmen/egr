# Shard Rain
execute as @e[tag=Shard] run scoreboard players add @s guardian_shard 1
execute as @e[tag=Shard] at @s run particle block prismarine ~ ~ ~ 0.1 0.0 0.1 0 0 normal @a
execute as @e[tag=Shard,scores={guardian_shard = 20..}] at @s run tp @s ~ ~-0.35 ~
execute as @e[tag=Shard,scores={guardian_shard = 20..}] at @s as @a[distance=..2] run damage @s 10 arrow
execute as @e[tag=Shard,scores={guardian_shard = 20..}] at @s if entity @a[distance=..1] run kill @s
execute as @e[tag=Shard,scores={guardian_shard = 80..}] run kill @s
# Trident Throw
execute as @e[tag=guardian_trident,tag=!Guardian_Trident_Active] run scoreboard players set @s trident_explode 0
execute as @e[tag=guardian_trident,tag=!Guardian_Trident_Active] run tag @s add Guardian_Trident_Active
execute as @e[tag=guardian_trident,scores={trident_explode = ..99},type=trident] run scoreboard players add @s trident_explode 1
execute as @e[type=trident,tag=guardian_trident,tag=!larger_explosion] at @s if score @s trident_explode matches 100 run execute as @a[distance=..5] run damage @s 7 explosion
execute as @e[type=trident,tag=guardian_trident,tag=larger_explosion] at @s if score @s trident_explode matches 100 run execute as @a[distance=..9] run damage @s 9 explosion
execute as @e[tag=guardian_trident] at @s if score @s trident_explode matches 100 run particle explosion ~ ~ ~ 0 0 0 1 1 normal @a
execute as @e[tag=guardian_trident] at @s if score @s trident_explode matches 100 run playsound entity.generic.explode neutral @a ~ ~ ~ 1 2 0
execute as @e[tag=guardian_trident] at @s if score @s trident_explode matches 100 run kill @s