database =  open("Dash-34-Datapack\\data\\core\\advancement\\defense\\mobs\\Mobs Database.txt", "r")
mobs = database.readlines()
mob_dict = {}

i = 0
while i < len(mobs):
    mob = mobs[i].strip()
    if mob == "":
        i += 1
        continue
    mob_dict[mob] = {}
    try:
        mob_dict[mob]["Health"] = mobs[i + 1].strip().split(": ")[1]
        mob_dict[mob]["Speed"] = mobs[i + 2].strip().split(": ")[1]
        mob_dict[mob]["Ability"] = mobs[i + 3].strip()[9:]
        mob_dict[mob]["Icon"] = mobs[i + 4].strip()
    except IndexError:
        print(f"Error: Not enough data for mob {mob}")
        break
    i += 6

previous_mob = None
for mob in mob_dict:
  parent = "core:defense/root" if previous_mob is None else f"core:defense/mobs/{previous_mob.lower()}"
  current_mob_file = open(f"Dash-34-Datapack\\data\\core\\advancement\\defense\\mobs\\{mob.lower()}.json", "w")
  current_mob_file.write(f'''{{
  "display": {{
    "icon": {{
    "id": "minecraft:{mob_dict[mob].get('Icon', 'default_icon')}"
    }},
    "title": "{mob}",
    "description": "Health: {mob_dict[mob]['Health']}\\nSpeed: {mob_dict[mob]['Speed']}\\n{mob_dict[mob]['Ability']}",
    "frame": "task",
    "show_toast": false,
    "announce_to_chat": false,
    "hidden": true
  }},
  "parent": "{parent}",
  "criteria": {{
    "impossible": {{
    "trigger": "minecraft:impossible"
    }}
  }},
  "requirements": [
    [
    "impossible"
    ]
  ]
  }}''')
  previous_mob = mob