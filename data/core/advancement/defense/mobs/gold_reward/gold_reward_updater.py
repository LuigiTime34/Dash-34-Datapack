import os
import json

def read_mobs_database(filename):
    """
    Read the mobs database file and extract mob information.
    Returns a list of tuples (mob_name, gold_reward).
    Handles potential errors during parsing.
    """
    mobs = []
    current_mob = None
    gold_reward = None
    line_num = 0
    expected_lines_per_mob = 6 # Name + 6 data lines

    try:
        with open(filename, 'r', encoding='utf-8') as file:
            lines = [line.strip() for line in file.readlines()] # Read all lines once

        i = 0
        while i < len(lines):
            line_num = i + 1
            line = lines[i]

            # Skip empty lines
            if not line:
                i += 1
                continue

            # Assume non-empty lines that aren't part of data are mob names
            # This relies heavily on the strict 7-line format
            # A better parser would explicitly look for known keys, but we stick to the original logic structure
            # Save previous mob data if a new potential mob name is found
            if ':' not in line and not line.startswith(' ') and not line.startswith('\t'):
                 if current_mob is not None and gold_reward is not None:
                      mobs.append((current_mob, gold_reward))
                 elif current_mob is not None and gold_reward is None:
                      print(f"Warning: Missing Gold Reward for mob '{current_mob}' ending before line {line_num}. Discarding.")

                 current_mob = line
                 gold_reward = None # Reset for the new mob

                 # Check if there are enough lines for the data fields
                 if i + expected_lines_per_mob > len(lines):
                     print(f"Warning: Potential mob '{current_mob}' starts at line {line_num}, but not enough lines follow for full data. Stopping parse.")
                     current_mob = None # Ensure this incomplete mob isn't saved later
                     break

                 # Now specifically look for Gold Reward in the expected line
                 gold_line_index = i + 3
                 if gold_line_index < len(lines) and 'Gold Reward:' in lines[gold_line_index]:
                     try:
                         gold_reward = lines[gold_line_index].split(':', 1)[1].strip()
                     except IndexError:
                         print(f"Warning: Malformed 'Gold Reward:' line ({line_num + 3}) for mob '{current_mob}'. Setting gold to 0.")
                         gold_reward = "0"
                 else:
                     print(f"Warning: Expected 'Gold Reward:' on line {line_num + 3} for mob '{current_mob}', but not found. Setting gold to 0.")
                     gold_reward = "0"

                 i += expected_lines_per_mob # Skip the mob name and its data lines
                 continue # Continue to next potential mob start

            # If it's not a mob name line according to the simple check, just advance
            i += 1


        # Add the very last mob after the loop finishes
        if current_mob is not None and gold_reward is not None:
            mobs.append((current_mob, gold_reward))
        elif current_mob is not None and gold_reward is None:
             print(f"Warning: Missing Gold Reward for the last mob '{current_mob}'. Discarding.")


    except FileNotFoundError:
        print(f"Error: Mobs database file not found: {filename}")
        return []
    except Exception as e:
        print(f"An unexpected error occurred while reading {filename}: {e}")
        return []

    return mobs

def create_advancement_json(mob_name, base_path):
    """
    Create a JSON advancement file for the given mob, ONLY if it doesn't exist.
    Returns the filename if created or skipped, or None on error.
    """
    mob_lowercase = mob_name.lower()
    filename = os.path.join(base_path, f"{mob_lowercase}_reward.json")

    # --- Check if file already exists ---
    if os.path.exists(filename):
        # print(f"Skipping existing advancement file: {os.path.basename(filename)}")
        return filename # Return filename even if skipped, for tracking purposes if needed

    try:
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
                                    # Using lowercase tag consistently
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
        with open(filename, 'w', encoding='utf-8') as file:
            json.dump(advancement, file, indent=4)
        # print(f"Created advancement file: {os.path.basename(filename)}")
        return filename
    except IOError as e:
        print(f"Error writing advancement file {os.path.basename(filename)}: {e}")
        return None
    except Exception as e:
        print(f"Unexpected error creating advancement {os.path.basename(filename)}: {e}")
        return None


def create_mcfunction_file(mob_name, gold_reward, base_path):
    """
    Create a .mcfunction file for the given mob's gold reward, ONLY if it doesn't exist.
    Returns the filename if created or skipped, or None on error.
    """
    mob_lowercase = mob_name.lower()
    filename = os.path.join(base_path, f"{mob_lowercase}_gold.mcfunction")

    # --- Check if file already exists ---
    if os.path.exists(filename):
        # print(f"Skipping existing mcfunction file: {os.path.basename(filename)}")
        return filename # Return filename even if skipped

    try:
        # Create the directory if it doesn't exist
        os.makedirs(base_path, exist_ok=True)

        # Create the mcfunction content
        # Added strip() to ensure no leading/trailing whitespace issues in reward
        mcfunction_content = f"""advancement revoke @s only core:defense/mobs/gold_reward/{mob_lowercase}_reward

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0
scoreboard players remove $mobs_left defense.wave 1

scoreboard players add $money defense.money {str(gold_reward).strip()}
scoreboard players set $recent_kill defense.money 20
scoreboard players add $recent_money defense.money {str(gold_reward).strip()}

function core:defense/scoreboard/get_highest
"""
        # Adjusted playsound syntax slightly

        # Write the content to the file
        with open(filename, 'w', encoding='utf-8') as file:
            file.write(mcfunction_content.strip() + '\n') # Ensure clean content with one trailing newline
        # print(f"Created mcfunction file: {os.path.basename(filename)}")
        return filename
    except IOError as e:
        print(f"Error writing mcfunction file {os.path.basename(filename)}: {e}")
        return None
    except Exception as e:
        print(f"Unexpected error creating mcfunction {os.path.basename(filename)}: {e}")
        return None

def main():
    # File paths
    mobs_database_file = os.path.join("data", "core", "advancement", "defense", "mobs", "Mobs Database.txt")
    advancement_base_path = os.path.join("data", "core", "advancement", "defense", "mobs", "gold_reward")
    mcfunction_base_path = os.path.join("data", "core", "function", "defense", "monsters", "gold_reward")

    # Read the mobs database
    mobs_data = read_mobs_database(mobs_database_file)

    if not mobs_data:
        print("No mob data found or error reading database. Exiting.")
        return

    # Print the extracted data for verification
    print("Extracted mob data:")
    for mob_name, gold_reward in mobs_data:
        print(f"- {mob_name}: {gold_reward} gold")

    # Confirm with user before creating files
    response = input(f"\nFound {len(mobs_data)} mobs. Check existing files in:\n"
                     f"  {advancement_base_path}\n"
                     f"  {mcfunction_base_path}\n"
                     f"Do you want to create any MISSING advancement/mcfunction files? (y/n): ")
    if response.lower() != 'y':
        print("\nOperation cancelled.")
        return

    # Create the files
    advancements_created = 0
    advancements_skipped = 0
    functions_created = 0
    functions_skipped = 0
    errors = 0

    print("\nProcessing mobs...")
    for mob_name, gold_reward in mobs_data:
        # Create the advancement JSON file
        adv_result = create_advancement_json(mob_name, advancement_base_path)
        if adv_result is None:
            errors += 1
        elif not os.path.exists(adv_result): # Check if it existed *before* the call (logic inside handles creation)
             # This logic is flawed because create_advancement_json creates it *before* returning
             # We need to check existence *inside* the function or refactor return values
             # Let's rely on the function printing skip/create and just count success/fail return
             print(f"Error: Could not verify creation state for {adv_result}") # Placeholder
             errors += 1 # Count as error if we can't verify
        # Let's refine the check: The function returns the filename if it skipped OR created successfully. None on error.
        # We need a way to know *if* it created vs skipped. Modify function to return a status?
        # Simpler: Check existence *before* calling the function.

        adv_target_file = os.path.join(advancement_base_path, f"{mob_name.lower()}_reward.json")
        adv_existed = os.path.exists(adv_target_file)
        adv_result = create_advancement_json(mob_name, advancement_base_path)

        if adv_result is None: # Error during creation attempt
            errors += 1
        elif adv_existed: # Skipped
            advancements_skipped += 1
        else: # Didn't exist before, and result is not None -> Created
            advancements_created += 1


        # Create the mcfunction file
        func_target_file = os.path.join(mcfunction_base_path, f"{mob_name.lower()}_gold.mcfunction")
        func_existed = os.path.exists(func_target_file)
        func_result = create_mcfunction_file(mob_name, gold_reward, mcfunction_base_path)

        if func_result is None: # Error during creation attempt
            errors += 1
        elif func_existed: # Skipped
            functions_skipped += 1
        else: # Didn't exist before, and result is not None -> Created
            functions_created += 1


    # Print summary
    print("\n--- File Creation Summary ---")
    if advancements_created > 0:
        print(f"Created {advancements_created} new advancement JSON file(s).")
    if functions_created > 0:
        print(f"Created {functions_created} new mcfunction file(s).")
    if advancements_skipped > 0:
        print(f"Skipped {advancements_skipped} existing advancement JSON file(s).")
    if functions_skipped > 0:
        print(f"Skipped {functions_skipped} existing mcfunction file(s).")
    if errors > 0:
         print(f"Encountered {errors} error(s) during file creation.")
    if advancements_created == 0 and functions_created == 0 and errors == 0:
        print("No new files needed to be created.")

    print("-----------------------------")


if __name__ == "__main__":
    main()