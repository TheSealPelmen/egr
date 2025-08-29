tag @s add egr_phase_second
data modify entity @s Attributes set value [{Modifiers:[{Name:"generic.movement_speed",Amount:0.5}]}]
particle explosion_emitter ~ ~ ~ 0 0 0 1 1 normal @a
playsound entity.warden.roar neutral @a[distance=..42] ~ ~ ~ 10000 2 0
#stopsound @a[distance=..42] master cataclysm:leviathan_music_1
#stopsound @a[distance=..42] master cataclysm:leviathan_music_2
#execute as @a[tag=ElderGuardianMusicPlaying] run playsound cataclysm:leviathan_music_2 master @a[distance=..42] ~ ~ ~ 10000 1 1
effect give @a[distance=..42] darkness 3 0 false
effect give @s[distance=..42] resistance 3 4 false
scoreboard players set @s egr_second_phase_particle_cosmetic 0
scoreboard players set @s egr_attack1_cd 100
scoreboard players set @s egr_attack2_cd 600
scoreboard players set @s egr_attack3_cd 300