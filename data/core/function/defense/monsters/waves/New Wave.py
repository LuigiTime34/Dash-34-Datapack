wave_number = input("What wave is this? ")
mob_number = int(input("How many mobs will this wave have? "))
mobs = []
for i in range(mob_number):
    mobs.append(input("Which Mob? "))

f = open(f'Dash-34-Datapack\\data\\core\\function\\defense\\monsters\\waves\\wave{wave_number}.mcfunction','a')
for i in range(len(mobs)):
    f.write(f"execute if score $wave_track defense.wave matches {i+1} run function core:defense/monsters/summon/{mobs[i]}\n")
f.write(f'execute if score $wave_track defense.wave matches 1..{len(mobs)} run schedule function core:defense/monsters/waves/wave{wave_number} 3s')
f.write(f'\nexecute if score $wave_track defense.wave matches 1..{len(mobs)} run scoreboard players add $wave_track defense.wave 1')
f.close()