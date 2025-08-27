execute as @s[scores={rain_shard=1}] at @s run playsound entity.evoker.prepare_summon neutral @a ~ ~ ~ 10 2 0
execute as @s[scores={rain_shard=1}] at @s run title @a[distance=..30] title {"text":""}
execute as @s[scores={rain_shard=1}] at @s run title @a[distance=..30] subtitle {"text":"Careful!","color":"red","bold":true}