execute at @s[tag=!egr_phase_second] run summon guardian ~ ~ ~ {NoAI:1b,Tags:["guardian_healer"],Attributes:[{Name:generic.armor,Base:8},{Name:generic.max_health,Base:24}],ActiveEffects:[{Id:20,Amplifier:2b,Duration:1800}],DeathLootTable:"minecraft:entities/armor_stand",CustomName:'{"text":"Healer Guardian"}',CustomNameVisible:1b}
execute at @s[tag=egr_phase_second] run summon guardian ~ ~ ~ {NoAI:1b,Tags:["guardian_healer"],Attributes:[{Name:generic.armor,Base:10},{Name:generic.max_health,Base:24}],ActiveEffects:[{Id:20,Amplifier:1b,Duration:1800},{Id:22,Amplifier:0b,Duration:1800}],DeathLootTable:"minecraft:entities/armor_stand",CustomName:'{"text":"Healer Guardian"}',CustomNameVisible:1b}
playsound entity.zombie_villager.cure neutral @a ~ ~ ~ 1 2 0
playsound entity.zombie_villager.cure neutral @a ~ ~ ~ 1 2 0
effect give @s absorption 10 2
scoreboard players set @s egr_attack2_cd 0
scoreboard players set @s guardian_healing 2
scoreboard players remove @s egr_attack1_cd 100