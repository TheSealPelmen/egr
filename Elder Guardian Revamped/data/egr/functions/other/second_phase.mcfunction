tag @s add egr_phase_second
effect give @s speed infinite 0 true
particle explosion_emitter ~ ~ ~ 0 0 0 1 1 normal @a
playsound entity.warden.roar neutral @a[distance=..42] ~ ~ ~ 10000 2 0
effect give @a[distance=..42] darkness 3 0 false
effect give @s[distance=..42] resistance 3 4 false
scoreboard players set @s egr_second_phase_particle_cosmetic 0
scoreboard players set @s egr_attack1_cd 100
scoreboard players set @s egr_attack2_cd 600
scoreboard players set @s egr_attack3_cd 300

