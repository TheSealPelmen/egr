execute as @s[scores={egr_attack2_cd = ..799}] run scoreboard players add @s egr_attack2_cd 1
execute at @s[scores={egr_attack2_cd = 800..}] run function egr:attacks/guardian_healer/guardian_healer_attack
execute at @s if entity @e[tag=guardian_healer,distance=..19] run scoreboard players add @s guardian_healing 1
execute at @s[scores={egr_attack2_cd = ..0}] run scoreboard players set @s egr_attack2_cd 0
execute as @e[scores={guardian_healing=1}] run effect give @s regeneration 10 2 false
execute as @e[scores={guardian_healing=1}] run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 1 0 0
execute as @e[scores={guardian_healing=1}] run particle heart ~ ~ ~ 1 1 1 1 5 normal @a
execute as @e[scores={guardian_healing=201}] run scoreboard players reset @s guardian_healing
execute at @e[tag=guardian_healer] run particle smoke ~ ~ ~ 0.2 0.2 0.2 0 1 normal @a