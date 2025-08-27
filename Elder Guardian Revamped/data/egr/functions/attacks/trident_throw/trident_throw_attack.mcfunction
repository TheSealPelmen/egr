summon trident ^ ^1 ^ {Motion:[-1.2d,0d,0d],Tags:["guardian_trident","guardian_attack"],Glowing:1b}
summon trident ^ ^1 ^ {Motion:[1.2d,0d,0d],Tags:["guardian_trident","guardian_attack"],Glowing:1b}
summon trident ^ ^1 ^ {Motion:[0d,0d,-1.2d],Tags:["guardian_trident","guardian_attack"],Glowing:1b}
summon trident ^ ^1 ^ {Motion:[0d,0d,1.2d],Tags:["guardian_trident","guardian_attack"],Glowing:1b}
summon trident ^ ^1 ^ {Motion:[0d,-1.2d,0d],Tags:["guardian_trident","guardian_attack"],Glowing:1b}
summon trident ^ ^1 ^ {Motion:[0d,1.2d,0d],Tags:["guardian_trident","guardian_attack"],Glowing:1b}
# The more tridents there is, the faster they will explode
team join guardian_ally @e[type=trident,tag=guardian_trident,distance=..1]
execute if entity @s[tag=egr_phase_second] run function egr:attacks/trident_throw/trident_throw_enraged
execute if entity @s[scores={egr_attack1_cd=210..}] run scoreboard players set @s egr_attack1_cd 0
execute if entity @s[tag=egr_phase_second,scores={egr_attack1_cd=0}] run scoreboard players add @s egr_attack1_cd 60