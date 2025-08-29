execute as @e[type=elder_guardian,tag=Elder_Guardian_Active] at @s run function egr:attacks/trident_throw/trident_throw
execute as @e[type=elder_guardian,tag=Elder_Guardian_Active] at @s run function egr:attacks/guardian_healer/guardian_healer
execute as @e[type=elder_guardian,tag=Elder_Guardian_Active] at @s run function egr:attacks/shard_rain/shard_rain
execute as @e[tag=guardian_attack] if entity @s run function egr:entities/guardian_attacks
execute as @e[type=elder_guardian,tag=Elder_Guardian_Active,tag=!Elder_Intro] at @s run function egr:other/intro
# First, store the current health as a score
execute as @e[type=elder_guardian] store result score @s elder_guardian_health run data get entity @s Health

# Calculate percentage: (current * 100) / 80 (vanilla max health)
execute as @e[type=elder_guardian] run scoreboard players operation @s egr_percentage = @s elder_guardian_health
execute as @e[type=elder_guardian] run scoreboard players operation @s egr_percentage *= 100 const
execute as @e[type=elder_guardian] run scoreboard players operation @s egr_percentage /= @s egr_health_max

# Now use percentage-based checks (99% = below full health, 50% = half health)
execute as @e[type=elder_guardian,scores={egr_percentage=..99},tag=!Elder_Guardian_Active] at @s if entity @p[distance=..36] run tag @s add Elder_Guardian_Active
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] at @s unless entity @p[distance=..42] run tag @s remove Elder_Guardian_Active
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] at @s unless entity @p[distance=..42] run tag @s remove Elder_Intro
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] run tag @s remove egr_phase_second
execute as @e[type=elder_guardian,scores={egr_percentage=99..}] at @s unless entity @p[distance=..42] run function egr:technical/reset_guardian
execute as @e[type=elder_guardian,scores={egr_percentage=..50},tag=!egr_phase_second] at @s run function egr:other/second_phase
execute as @e[type=elder_guardian,scores={egr_percentage=..99}] at @s unless entity @p[distance=..42] run effect give @s instant_health 1 0 true
#
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
# Enhanced AI Support
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s Attributes set value [{Modifiers:[{Name:"enhancedai:generic.xray_follow_range",Amount:42}]}]
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[3] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[2] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[1] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run data modify entity @s ArmorItems[0] set value {id:"minecraft:prismarine",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:6s}]}}
execute as @e[tag=!egr_data_modified,type=elder_guardian] run tag @s add egr_data_modified