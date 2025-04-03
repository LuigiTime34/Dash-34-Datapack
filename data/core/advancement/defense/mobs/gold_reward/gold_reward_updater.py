import os
import json

def read_mobs_database(filename):
    """
    Read the mobs database file and extract mob information.
    Returns a list of tuples (mob_name, gold_reward).
    """
    mobs = []
    current_mob = None
    gold_reward = None
    
    with open(filename, 'r') as file:
        lines = file.readlines()
        
        for line in lines:
            line = line.strip()
            
            # Skip empty lines
            if not line:
                continue
                
            # If line doesn't contain a colon, it might be a mob name
            if ':' not in line and not line.startswith(' ') and not line.startswith('\t'):
                # Save previous mob if we have one
                if current_mob is not None and gold_reward is not None:
                    mobs.append((current_mob, gold_reward))
                
                # Start a new mob
                current_mob = line
                gold_reward = None
            
            # Check for Gold Reward
            elif 'Gold Reward:' in line:
                gold_reward = line.split(':')[1].strip()
    
    # Add the last mob
    if current_mob is not None and gold_reward is not None:
        mobs.append((current_mob, gold_reward))
    
    return mobs

def create_advancement_json(mob_name, base_path):
    """
    Create a JSON advancement file for the given mob.
    """
    # Convert mob name to lowercase
    mob_lowercase = mob_name.lower()
    
    # Create the directory if it doesn't exist
    os.makedirs(base_path, exist_ok=True)
    
    # Create the JSON structure
    advancement = {
        "criteria": {
            f"hit_{mob_lowercase}": {
                "trigger": "minecraft:player_killed_entity",
                "conditions": {
                    "entity": [
                        {
                            "condition": "minecraft:entity_properties",
                            "entity": "this",
                            "predicate": {
                                "nbt": f"{{Tags:[\"defense-{mob_lowercase}\"]}}"
                            }
                        }
                    ]
                }
            }
        },
        "requirements": [
            [
                f"hit_{mob_lowercase}"
            ]
        ],
        "rewards": {
            "function": f"core:defense/monsters/gold_reward/{mob_lowercase}_gold"
        }
    }
    
    # Write the JSON to the file
    filename = os.path.join(base_path, f"{mob_lowercase}_reward.json")
    with open(filename, 'w') as file:
        json.dump(advancement, file, indent=4)
    
    return filename

def create_mcfunction_file(mob_name, gold_reward, base_path):
    """
    Create a .mcfunction file for the given mob's gold reward.
    """
    # Convert mob name to lowercase
    mob_lowercase = mob_name.lower()
    
    # Create the directory if it doesn't exist
    os.makedirs(base_path, exist_ok=True)
    
    # Create the mcfunction content
    mcfunction_content = f'''
advancement revoke @s only core:defense/mobs/gold_reward/{mob_lowercase}_reward

playsound minecraft:entity.experience_orb.pickup master @s
scoreboard players remove $mobs_left defense.wave 1

scoreboard players add $money defense.money {gold_reward}
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money {gold_reward}

function core:defense/scoreboard/get_highest
'''
    
    # Write the content to the file
    filename = os.path.join(base_path, f"{mob_lowercase}_gold.mcfunction")
    with open(filename, 'w') as file:
        file.write(mcfunction_content)
    
    return filename

def main():
    # File paths
    mobs_database_file = "Dash-34-Datapack/data/core/advancement/defense/mobs/Mobs Database.txt"
    advancement_base_path = "Dash-34-Datapack/data/core/advancement/defense/mobs/gold_reward"
    mcfunction_base_path = "Dash-34-Datapack/data/core/function/defense/monsters/gold_reward"
    
    # Read the mobs database
    mobs_data = read_mobs_database(mobs_database_file)
    
    # Print the extracted data for verification
    print("Extracted mob data:")
    for mob_name, gold_reward in mobs_data:
        print(f"{mob_name}: {gold_reward} gold")
    
    # Confirm with user before creating files
    response = input("\nDo you want to create the advancement JSON and mcfunction files? (y/n): ")
    if response.lower() != 'y':
        print("\nOperation cancelled.")
        return
    
    # Create the files
    advancement_files = []
    mcfunction_files = []
    
    for mob_name, gold_reward in mobs_data:
        # Create the advancement JSON file
        adv_file = create_advancement_json(mob_name, advancement_base_path)
        advancement_files.append(adv_file)
        
        # Create the mcfunction file
        func_file = create_mcfunction_file(mob_name, gold_reward, mcfunction_base_path)
        mcfunction_files.append(func_file)
    
    # Print summary
    print("\nFiles created successfully!")
    print(f"Created {len(advancement_files)} advancement JSON files in: {advancement_base_path}")
    print(f"Created {len(mcfunction_files)} mcfunction files in: {mcfunction_base_path}")

if __name__ == "__main__":
    main()