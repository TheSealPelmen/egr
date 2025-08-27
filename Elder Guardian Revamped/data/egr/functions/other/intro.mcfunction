execute if entity @a[distance=..36] run title @a title {"text":"ELDER GUARDIAN","font":"minecraft:uniform","bold":true,"color":"white"}
execute if entity @a[distance=..36] run title @a subtitle {"text":"The One Who does not Fear Time","font":"minecraft:alt","bold":true,"color":"white"}
execute if entity @a[distance=..36] run playsound block.glass.break neutral @a ~ ~ ~ 18 0 0
tag @s add Elder_Intro
