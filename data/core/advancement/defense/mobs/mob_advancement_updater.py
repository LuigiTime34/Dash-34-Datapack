database = open("data\\core\\advancement\\defense\\mobs\\Mobs Database.txt", "r")
mobs = database.readlines()
mob_dict = {}

# Track categories and their first mobs
categories = {}
category_last_mob = {}

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
        mob_dict[mob]["Gold"] = mobs[i + 3].strip().split(": ")[1]
        mob_dict[mob]["Ability"] = mobs[i + 4].strip()[9:]
        mob_dict[mob]["Category"] = mobs[i + 5].strip().split(": ")[1]  # Category field
        mob_dict[mob]["Icon"] = mobs[i + 6].strip()  # Icon field
        
        # Track categories
        category = mob_dict[mob]["Category"]
        if category not in categories:
            categories[category] = mob
        category_last_mob[category] = mob
        
    except IndexError:
        print(f"Error: Not enough data for mob {mob}")
        break
    i += 7  # Account for Category field

# Get icons for each category
category_icons = {}
for category in categories:
    icon = input(f"Enter icon item ID for category '{category}': ")
    if not icon or icon.strip() == "":
        icon = "dirt"
    category_icons[category] = icon

# Create category advancement files
for category in categories:
    category_file = open(f"data\\core\\advancement\\defense\\mobs\\category_{category.lower()}.json", "w")
    category_file.write(f'''{{
    "display": {{
    "icon": {{
    "id": "minecraft:{category_icons[category]}"
    }},
    "title": "{category} Mobs",
    "frame": "task",
    "show_toast": false,
    "announce_to_chat": false,
    "hidden": true
    }},
    "parent": "core:defense/mobs_root",
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
    category_file.close()
    print(f"Created category file for {category}")

# Now create mob advancement files
for mob in mob_dict:
    category = mob_dict[mob]["Category"]
    
    # Determine parent based on category logic
    if mob == categories[category]:  # First mob in category
        parent = f"core:defense/mobs/category_{category.lower()}"
    else:
        # Find previous mob in same category
        prev_mob = None
        for check_mob in mob_dict:
            if check_mob == mob:
                break
            if mob_dict[check_mob]["Category"] == category:
                prev_mob = check_mob
        
        parent = f"core:defense/mobs/{prev_mob.lower()}" if prev_mob else f"core:defense/mobs/category_{category.lower()}"
    
    current_mob_file = open(f"data\\core\\advancement\\defense\\mobs\\{mob.lower()}.json", "w")
    current_mob_file.write(f'''{{
    "display": {{
    "icon": {{
    "id": "minecraft:{mob_dict[mob].get('Icon', 'default_icon')}"
    }},
    "title": "{mob.replace('_', ' ')}",
    "description": "Health: {mob_dict[mob]['Health']}\\nSpeed: {mob_dict[mob]['Speed']}\\nGold: {mob_dict[mob]['Gold']}\\nCategory: {mob_dict[mob]['Category']}\\n{mob_dict[mob]['Ability']}",
    "frame": "task",
    "show_toast": true,
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
    current_mob_file.close()
    print(f"Created advancement file for {mob}")

print("All files created successfully!")