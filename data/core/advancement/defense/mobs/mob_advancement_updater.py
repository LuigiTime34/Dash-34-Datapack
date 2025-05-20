import sys
import os
import json

# --- Configuration ---
DATABASE_FILE_PATH = os.path.join("data", "core", "advancement", "defense", "mobs", "Mobs Database.txt")
ADVANCEMENT_OUTPUT_DIR = os.path.join("data", "core", "advancement", "defense", "mobs")
ROOT_ADVANCEMENT = "core:defense/mobs_root" # The parent for the start of new rows
INFO_FUNCTION_BASE_PATH = "core:defense/monsters/info"

DEFAULT_TEXTURE = "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDM0ZTE3NjdhNmI5MWFmNzIzYTczOTMxYTA4YTRhMTUwMTVkOTE2Y2E2NzNhNGIzYzNkNzZjZDA3YjgyOSJ9fX0="
MOBS_PER_REGULAR_ROW = 5

VANILLA_MOB_HEAD_IDS = {
    "minecraft:zombie_head",
    "minecraft:skeleton_skull",
    "minecraft:wither_skeleton_skull",
    "minecraft:piglin_head",
    "minecraft:creeper_head"
}
EXPECTED_LINES_PER_MOB = 6
BOSS_NAMES = {"Iron_Golem", "Giant", "Ravager", "Warden"}

# --- Function Definitions ---

def parse_mobs_database(filepath):
    ordered_mobs_list = []
    line_num = 0
    current_mob_name = None

    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = [line.strip() for line in f.readlines()]

        i = 0
        while i < len(lines):
            if not lines[i]:
                i += 1
                continue

            current_mob_name = lines[i]
            line_num = i + 1

            if i + EXPECTED_LINES_PER_MOB > len(lines):
                print(f"Warning: Incomplete data found starting line {line_num} for potential mob '{current_mob_name}'. Skipping remainder of file.")
                break

            try:
                data = {}
                data["Health"] = lines[i + 1].split(": ", 1)[1]
                data["Speed"] = lines[i + 2].split(": ", 1)[1]
                data["Gold"] = lines[i + 3].split(": ", 1)[1]
                ability_line = lines[i + 4]
                data["Ability"] = ability_line[9:].strip() if ability_line.startswith("Ability: ") and len(ability_line) > 9 else ""
                data["Icon"] = lines[i + 5].strip()

                ordered_mobs_list.append((current_mob_name, data))
                i += EXPECTED_LINES_PER_MOB

            except IndexError as e:
                print(f"Error: Incorrect format or missing data near line {line_num} for mob '{current_mob_name}'. Details: {e}. Skipping this mob.")
                i += EXPECTED_LINES_PER_MOB
                continue
            except Exception as e:
                 print(f"An unexpected error occurred parsing mob '{current_mob_name}' near line {line_num}: {e}. Skipping this mob.")
                 i += EXPECTED_LINES_PER_MOB
                 continue

    except FileNotFoundError:
        print(f"Error: Database file not found: {filepath}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred reading {filepath}: {e}")
        return None

    if not ordered_mobs_list:
        print(f"Warning: No valid mob data found in {filepath}.")

    return ordered_mobs_list


def generate_advancements(ordered_mob_data, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    print(f"\nOutput directory: {output_dir}")

    mobs_generated_count = 0
    errors = 0
    
    previous_mob_name_overall = None
    regular_mobs_in_current_row_counter = 0

    print("\nGenerating Mob Advancements (overwriting existing files)...")

    for mob_index, (mob_name, mob_data) in enumerate(ordered_mob_data):
        is_boss = mob_name in BOSS_NAMES
        mob_icon_string = mob_data.get("Icon", DEFAULT_TEXTURE)
        if not mob_icon_string:
             print(f"Warning: Using default texture for mob '{mob_name}' due to empty Icon field.")
             mob_icon_string = DEFAULT_TEXTURE

        mob_filename_safe = mob_name.lower().replace(" ", "_") # Used for JSON filename and function path
        mob_filename_json = f"{mob_filename_safe}.json"
        mob_filepath = os.path.join(output_dir, mob_filename_json)

        parent_advancement_id = None

        if mob_index == 0:
            parent_advancement_id = ROOT_ADVANCEMENT
        elif is_boss:
            if previous_mob_name_overall:
                parent_advancement_id = f"core:defense/mobs/{previous_mob_name_overall.lower().replace(' ', '_')}"
            else:
                parent_advancement_id = ROOT_ADVANCEMENT
        else: 
            if regular_mobs_in_current_row_counter == 0:
                parent_advancement_id = ROOT_ADVANCEMENT
            else:
                if previous_mob_name_overall:
                    parent_advancement_id = f"core:defense/mobs/{previous_mob_name_overall.lower().replace(' ', '_')}"
                else:
                    parent_advancement_id = ROOT_ADVANCEMENT
        
        if is_boss:
            regular_mobs_in_current_row_counter = 0
        else:
            regular_mobs_in_current_row_counter += 1
            if regular_mobs_in_current_row_counter >= MOBS_PER_REGULAR_ROW:
                regular_mobs_in_current_row_counter = 0

        previous_mob_name_overall = mob_name

        icon_data = {}
        full_icon_id_candidate = mob_icon_string if mob_icon_string.startswith("minecraft:") else f"minecraft:{mob_icon_string}"

        if full_icon_id_candidate in VANILLA_MOB_HEAD_IDS:
            icon_data["id"] = full_icon_id_candidate
        else:
            icon_data["id"] = "minecraft:player_head"
            icon_data["components"] = {
                "minecraft:profile": {
                    "properties": [
                         {
                           "name": "textures",
                           "value": mob_icon_string
                        }
                    ]
                }
            }

        description_lines = [
            f"Health: {mob_data.get('Health', '?')}\n",
            f"Speed: {mob_data.get('Speed', '?')}\n",
            f"Gold: {mob_data.get('Gold', '?')}\n"
        ]
        ability_text = mob_data.get('Ability', '')
        if ability_text:
            description_lines.append(f"{ability_text}")
        
        description_for_json = ''.join(description_lines)


        mob_advancement_json = {
            "display": {
                "icon": icon_data,
                "title": mob_name.replace('_', ' '),
                "description": description_for_json,
                "frame": "task",
                "show_toast": True,
                "announce_to_chat": False,
                "hidden": True
            },
            "parent": parent_advancement_id,
            "criteria": {
                "impossible": {
                    "trigger": "minecraft:impossible"
                }
            },
            "requirements": [["impossible"]],
            "rewards": {
                "function": f"{INFO_FUNCTION_BASE_PATH}/{mob_filename_safe}" # Use the safe filename part
            }
        }

        try:
            with open(mob_filepath, 'w', encoding='utf-8') as f:
                json.dump(mob_advancement_json, f, indent=4)
            mobs_generated_count += 1
        except IOError as e:
            print(f"! Error writing mob advancement file {mob_filename_json}: {e}")
            errors += 1
        except Exception as e:
            print(f"! An unexpected error occurred writing {mob_filename_json}: {e}")
            errors += 1
            
    print(f"\n--- Mob Advancement Generation Summary ---")
    print(f"Generated/Overwritten {mobs_generated_count} mob advancement file(s).")
    if errors > 0:
        print(f"Encountered {errors} error(s) during generation.")
    print("----------------------------------------")

# --- Main Execution ---
if __name__ == "__main__":
    print(f"Reading mob database: {DATABASE_FILE_PATH}")
    ordered_mob_data = parse_mobs_database(DATABASE_FILE_PATH)

    if ordered_mob_data is None:
        print("Exiting due to errors reading the database.")
        sys.exit(1)

    if not ordered_mob_data:
         print("No mobs found in database. Exiting.")
         sys.exit(1)

    generate_advancements(ordered_mob_data, ADVANCEMENT_OUTPUT_DIR)

    print("\nAdvancement generation process finished.")