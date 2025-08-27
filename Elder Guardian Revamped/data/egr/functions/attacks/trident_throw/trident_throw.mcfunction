execute as @s[scores={egr_attack1_cd = ..209}] run scoreboard players add @s egr_attack1_cd 1
execute as @s[scores={egr_attack1_cd = ..209}] if entity @p[distance=14..] run scoreboard players add @s egr_attack1_cd 1
execute at @s[scores={egr_attack1_cd = ..0}] run scoreboard players set @s egr_attack1_cd 0
execute at @s[scores={egr_attack1_cd = 200..205}] run function egr:attacks/trident_throw/trident_throw_warning
execute at @s[scores={egr_attack1_cd = 210..}] run function egr:attacks/trident_throw/trident_throw_attack