execute as @e[type=elder_guardian,tag=Elder_Guardian_Active] at @s run function egr:attacks/trident_throw/trident_throw
execute as @e[type=elder_guardian,tag=Elder_Guardian_Active] at @s run function egr:attacks/guardian_healer/guardian_healer
execute as @e[type=elder_guardian,tag=Elder_Guardian_Active] at @s run function egr:attacks/shard_rain/shard_rain
execute as @e[tag=guardian_attack] if entity @s run function egr:entities/guardian_attacks
execute as @e[type=elder_guardian,tag=Elder_Guardian_Active,tag=!Elder_Intro] at @s run function egr:other/intro
# First, store the current health as a score
execute as @e[type=elder_guardian] store result score @s elder_guardian_health run data get entity @s Health
execute as @e[type=elder_guardian,tag=!maxhealthengaged] run scoreboard players add @s max_health_check 1
#execute as @e[type=elder_guardian,tag=!maxhealthengaged] run data modify entity @s ActiveEffects set value [{Id:6,Duration:10,Amplifier:254}]
execute as @e[type=elder_guardian,tag=!maxhealthengaged,scores={max_health_check = ..10}] store result score @s egr_health_max run data get entity @s Health
execute as @e[type=elder_guardian,tag=!maxhealthengaged,scores={max_health_check = 10..}] run tag @s add maxhealthengaged
execute as @e[type=elder_guardian,scores={max_health_check = 10..}] run scoreboard players reset @s max_health_check
execute as @e[type=elder_guardian,tag=maxhealthengaged] run scoreboard players operation @s egr_percentage = score_holder egr_health_percentage_const
execute as @e[type=elder_guardian,tag=maxhealthengaged] run scoreboard players operation @s egr_percentage *= @s elder_guardian_health
execute as @e[type=elder_guardian,tag=maxhealthengaged] run scoreboard players operation @s egr_percentage /= @s egr_health_max

# Now use percentage-based checks (99% = below full health, 50% = half health)
execute as @e[type=elder_guardian,scores={egr_percentage=..99},tag=!Elder_Guardian_Active] at @s if entity @p[distance=..36] run tag @s add Elder_Guardian_Active
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] at @s unless entity @p[distance=..42] run tag @s remove Elder_Guardian_Active
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] at @s unless entity @p[distance=..42] run tag @s remove Elder_Intro
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] run tag @s remove egr_phase_second
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] at @s unless entity @p[distance=..42] run function egr:technical/reset_guardian
execute as @e[type=elder_guardian,scores={egr_percentage=..50},tag=!egr_phase_second] at @s run function egr:other/second_phase
execute as @e[type=elder_guardian,scores={egr_percentage=..99}] at @s unless entity @p[distance=..42] run effect give @s instant_health 1 0 true
#
execute as @e[type=elder_guardian,tag=!Elder_Guardian_Spawned] run scoreboard players set @s max_health_check 0
execute as @e[type=elder_guardian,tag=!Elder_Guardian_Spawned] run scoreboard players set @s egr_attack1_cd 0
execute as @e[type=elder_guardian,tag=!Elder_Guardian_Spawned] run scoreboard players set @s egr_attack2_cd 450
execute as @e[type=elder_guardian,tag=!Elder_Guardian_Spawned] run scoreboard players set @s egr_attack3_cd 200
execute as @e[type=elder_guardian,tag=!Elder_Guardian_Spawned] run scoreboard players set @s rain_shard 0
execute as @e[type=elder_guardian,tag=!Elder_Guardian_Spawned] run tag @s add Elder_Guardian_Spawned
# Second Phase Specific
execute as @e[tag=egr_phase_second] at @s run scoreboard players add @s egr_second_phase_particle_cosmetic 1
execute as @e[scores={egr_second_phase_particle_cosmetic = 15}] at @s run particle dripping_obsidian_tear ~ ~ ~ 1 1 1 1 1 normal @a
execute as @e[scores={egr_second_phase_particle_cosmetic = 15}] at @s run particle dripping_lava ~ ~ ~ 1 1 1 1 1 normal @a
execute as @e[scores={egr_second_phase_particle_cosmetic = 15}] run scoreboard players set @s egr_second_phase_particle_cosmetic 0
# Projectile Protection
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[3] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[2] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[1] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[0] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data merge entity @s {ArmorDropChances:[0.0F,0.0F,0.0F,0.0F]}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run tag @s add egr_data_modified

