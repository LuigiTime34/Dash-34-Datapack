import sys
import os
import json # Using json for potentially cleaner NBT structure, though f-strings work

# --- Configuration ---
DATABASE_FILE_PATH = os.path.join("data", "core", "advancement", "defense", "mobs", "Mobs Database.txt")
ADVANCEMENT_OUTPUT_DIR = os.path.join("data", "core", "advancement", "defense", "mobs")
# Default Base64 texture (e.g., a simple question mark or Steve head)
# Using a gray question mark texture from minecraft-heads.com
DEFAULT_TEXTURE = "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDM0ZTE3NjdhNmI5MWFmNzIzYTczOTMxYTA4YTRhMTUwMTVkOTE2Y2E2NzNhNGIzYzNkNzZjZDA3YjgyOSJ9fX0="


# --- Function Definitions ---

def parse_mobs_database(filepath):
    """Parses the Mobs Database file."""
    mob_dict = {}
    categories = {}  # Stores {category_name: first_mob_name}
    line_num = 0
    current_mob_name = None
    expected_lines_per_mob = 7 # Name + 6 data lines

    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = [line.strip() for line in f.readlines()] # Read all lines once

        i = 0
        while i < len(lines):
            # Find the next non-empty line for mob name
            if not lines[i]:
                i += 1
                continue

            current_mob_name = lines[i]
            line_num = i + 1 # Line number for error reporting

            # Check if enough lines remain for this mob's data
            if i + expected_lines_per_mob > len(lines):
                print(f"Warning: Incomplete data found starting line {line_num} for potential mob '{current_mob_name}'. Skipping.")
                break # Stop processing if data seems truncated

            try:
                data = {}
                data["Health"] = lines[i + 1].split(": ", 1)[1]
                data["Speed"] = lines[i + 2].split(": ", 1)[1]
                data["Gold"] = lines[i + 3].split(": ", 1)[1]
                # Handle potential missing "Ability: " prefix gracefully
                ability_line = lines[i + 4]
                data["Ability"] = ability_line[9:] if ability_line.startswith("Ability: ") else ability_line
                data["Category"] = lines[i + 5].split(": ", 1)[1]
                data["Icon"] = lines[i + 6] # This is now the Base64 texture string

                mob_dict[current_mob_name] = data

                # Track categories
                category = data["Category"]
                if category not in categories:
                    categories[category] = current_mob_name # Record first mob seen for this category

                i += expected_lines_per_mob # Move to the next potential mob name

            except IndexError as e:
                print(f"Error: Incorrect format or missing data near line {line_num} for mob '{current_mob_name}'. Check line {i+1+e.args[0] if e.args else i+2}. Details: {e}")
                # Attempt to recover by skipping to the next potential mob block
                i += expected_lines_per_mob
                continue
            except Exception as e:
                 print(f"An unexpected error occurred parsing mob '{current_mob_name}' near line {line_num}: {e}")
                 i += expected_lines_per_mob
                 continue

    except FileNotFoundError:
        print(f"Error: Database file not found: {filepath}")
        return None, None
    except Exception as e:
        print(f"An unexpected error occurred reading {filepath}: {e}")
        return None, None

    if not mob_dict:
        print(f"Warning: No valid mob data found in {filepath}.")

    return mob_dict, categories

def get_category_textures(categories):
    """Prompts user for Base64 texture values for each category."""
    category_textures = {}
    print("\nEnter the Base64 texture value for each category icon (Player Head).")
    print(f"(Leave blank to use the default texture: {DEFAULT_TEXTURE[:30]}...)")
    for category in categories:
        texture = input(f"Texture for category '{category}': ").strip()
        if not texture:
            print(f"Using default texture for '{category}'.")
            texture = DEFAULT_TEXTURE
        category_textures[category] = texture
    return category_textures

def generate_advancements(mob_dict, categories, category_textures, output_dir):
    """Generates category and mob advancement JSON files, skipping existing ones."""
    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)
    print(f"\nOutput directory: {output_dir}")

    categories_created = 0
    categories_skipped = 0
    mobs_created = 0
    mobs_skipped = 0
    errors = 0


    # --- Create Category Advancement Files (if they don't exist) ---
    print("\nChecking/Creating Category Advancements...")
    for category, first_mob in categories.items():
        category_filename = f"category_{category.lower()}.json"
        category_filepath = os.path.join(output_dir, category_filename)
        category_texture = category_textures.get(category, DEFAULT_TEXTURE)

        # --- Check if file already exists ---
        if os.path.exists(category_filepath):
            # print(f"- Skipping existing category file: {category_filename}")
            categories_skipped += 1
            continue

        # Construct the JSON data for the category icon
        icon_data = {
            "id": "minecraft:player_head",
            "components": {
                "minecraft:profile": {
                    "properties": [ # properties is a list containing one object
                        {
                           "name": "textures",
                           "value": category_texture
                        }
                    ]
                }
            }
        }

        category_advancement = {
            "display": {
                "icon": icon_data,
                "title": f"{category} Mobs",
                "frame": "task",
                "show_toast": False,
                "announce_to_chat": False,
                "hidden": True
            },
            "parent": "core:defense/mobs_root",
            "criteria": {
                "impossible": {
                    "trigger": "minecraft:impossible"
                }
            },
            "requirements": [["impossible"]]
        }

        try:
            with open(category_filepath, 'w', encoding='utf-8') as f:
                json.dump(category_advancement, f, indent=4) # Use json.dump for proper formatting
            # print(f"+ Created category file: {category_filename}")
            categories_created += 1
        except IOError as e:
            print(f"! Error writing category file {category_filename}: {e}")
            errors += 1
        except Exception as e:
            print(f"! An unexpected error occurred writing {category_filename}: {e}")
            errors += 1


    # --- Create Mob Advancement Files (if they don't exist) ---
    print("\nChecking/Creating Mob Advancements...")
    # Need to iterate in the order they were read to determine parents correctly
    processed_mobs_in_order = list(mob_dict.keys())
    last_mob_in_category = {} # Track the previous mob *within the loop*

    for i, mob_name in enumerate(processed_mobs_in_order):
        mob_data = mob_dict[mob_name]
        category = mob_data["Category"]
        mob_texture = mob_data.get("Icon", DEFAULT_TEXTURE)
        if not mob_texture: # Handle case where Icon line might be empty
             print(f"Warning: Using default texture for mob '{mob_name}' due to empty Icon field.")
             mob_texture = DEFAULT_TEXTURE

        mob_filename = f"{mob_name.lower()}.json"
        mob_filepath = os.path.join(output_dir, mob_filename)

        # --- Check if file already exists ---
        if os.path.exists(mob_filepath):
            # print(f"- Skipping existing mob file: {mob_filename}")
            mobs_skipped += 1
            # IMPORTANT: Still need to track the last mob for parent linking even if skipped
            last_mob_in_category[category] = mob_name
            continue

        # Determine parent
        if mob_name == categories[category]:  # Is this the first mob listed for this category?
            parent = f"core:defense/mobs/category_{category.lower()}"
        else:
            # Get the last processed mob that was in the *same category*
            prev_mob_in_cat = last_mob_in_category.get(category)
            if prev_mob_in_cat:
                 parent = f"core:defense/mobs/{prev_mob_in_cat.lower()}"
            else:
                 # Fallback if something went wrong finding previous (shouldn't happen with good data)
                 print(f"Warning: Could not find previous mob for '{mob_name}' in category '{category}'. Defaulting parent to category root.")
                 parent = f"core:defense/mobs/category_{category.lower()}"

        # Update the last mob seen for this category *after* determining parent
        last_mob_in_category[category] = mob_name

        # Construct the JSON data for the mob icon
        mob_icon_data = {
            "id": "minecraft:player_head",
            "components": {
                "minecraft:profile": {
                    "properties": [
                         {
                           "name": "textures",
                           "value": mob_texture
                        }
                    ]
                }
            }
        }

        # Format description string
        description = (
            f"Health: {mob_data.get('Health', '?')}\\n" # Using \n for Minecraft line breaks
            f"Speed: {mob_data.get('Speed', '?')}\\n"
            f"Gold: {mob_data.get('Gold', '?')}\\n"
            f"{mob_data.get('Ability', '')}"
        )

        mob_advancement = {
            "display": {
                "icon": mob_icon_data,
                "title": mob_name.replace('_', ' '),
                "description": description.strip(), # Remove trailing newline if ability is empty
                "frame": "task",
                "show_toast": True, # Show toast for discovering mob
                "announce_to_chat": False,
                "hidden": True # Make true so it only shows when granted
            },
            "parent": parent,
            "criteria": {
                "impossible": {
                    "trigger": "minecraft:impossible"
                }
            },
            "requirements": [["impossible"]]
        }

        try:
            with open(mob_filepath, 'w', encoding='utf-8') as f:
                json.dump(mob_advancement, f, indent=4)
            # print(f"+ Created mob file: {mob_filename}")
            mobs_created += 1
        except IOError as e:
            print(f"! Error writing mob file {mob_filename}: {e}")
            errors += 1
        except Exception as e:
            print(f"! An unexpected error occurred writing {mob_filename}: {e}")
            errors += 1

    # Return summary counts
    return categories_created, categories_skipped, mobs_created, mobs_skipped, errors


# --- Main Execution ---
if __name__ == "__main__":
    print(f"Reading mob database: {DATABASE_FILE_PATH}")
    mob_data_dict, category_data = parse_mobs_database(DATABASE_FILE_PATH)

    if mob_data_dict is None or category_data is None:
        print("Exiting due to errors reading the database.")
        sys.exit(1)

    if not mob_data_dict:
         print("No mobs found in database. Exiting.")
         sys.exit(1)

    category_textures_map = get_category_textures(category_data.keys())

    # Generate files and get counts
    cat_c, cat_s, mob_c, mob_s, err = generate_advancements(
        mob_data_dict,
        category_data,
        category_textures_map,
        ADVANCEMENT_OUTPUT_DIR
    )

    # Print Summary
    print("\n--- Advancement Generation Summary ---")
    if cat_c > 0:
        print(f"Created {cat_c} new category advancement file(s).")
    if mob_c > 0:
        print(f"Created {mob_c} new mob advancement file(s).")
    if cat_s > 0:
        print(f"Skipped {cat_s} existing category advancement file(s).")
    if mob_s > 0:
        print(f"Skipped {mob_s} existing mob advancement file(s).")
    if err > 0:
         print(f"Encountered {err} error(s) during file creation.")
    if cat_c == 0 and mob_c == 0 and err == 0:
        print("No new advancement files needed to be created.")
    print("------------------------------------")

    print("\nAdvancement generation process finished.")