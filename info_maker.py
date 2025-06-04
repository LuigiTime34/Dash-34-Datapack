import os
import json

# --- Configuration ---
DATABASE_FILE_PATH = os.path.join("data", "core", "advancement", "defense", "mobs", "Mobs Database.txt")
OUTPUT_DIR = os.path.join("data", "core", "function", "defense", "monsters", "info")
EXPECTED_LINES_PER_MOB = 7 # Name + 6 data lines

# --- Main Execution ---
if __name__ == "__main__":
    print(f"Reading mob database: {DATABASE_FILE_PATH}")
    mob_data = {}
    line_num = 0
    current_mob_name = None

    # --- Simplified Parsing ---
    try:
        with open(DATABASE_FILE_PATH, 'r', encoding='utf-8') as f:
            lines = [line.strip() for line in f.readlines()]

        i = 0
        while i < len(lines):
            if not lines[i]: # Skip empty lines
                i += 1
                continue

            current_mob_name = lines[i]
            line_num = i + 1

            if i + EXPECTED_LINES_PER_MOB > len(lines):
                print(f"Warning: Incomplete data near end of file for '{current_mob_name}'. Stopping.")
                break

            try:
                # Directly extract needed data
                health = lines[i + 1].split(": ", 1)[1]
                speed = lines[i + 2].split(": ", 1)[1]
                ability_line = lines[i + 4]
                ability_text = ability_line[9:].strip() if ability_line.startswith("Ability: ") else ""

                mob_data[current_mob_name] = {
                    "Health": health,
                    "Speed": speed,
                    "Ability": ability_text
                }
                i += EXPECTED_LINES_PER_MOB # Skip processed lines

            except IndexError:
                print(f"Error: Formatting error near line {line_num} for mob '{current_mob_name}'. Skipping mob.")
                i += 1 # Try to recover by advancing one line (might misalign)
                # A more robust parser would be needed for flexible formats
            except Exception as e:
                 print(f"Error parsing mob '{current_mob_name}' near line {line_num}: {e}. Skipping mob.")
                 i += 1 # Try to recover

    except FileNotFoundError:
        print(f"Error: Database file not found: {DATABASE_FILE_PATH}")
        mob_data = None # Signal error
    except Exception as e:
        print(f"Error reading database file: {e}")
        mob_data = None # Signal error

    # --- File Generation ---
    if mob_data:
        print(f"\nFound data for {len(mob_data)} mobs.")
        print(f"Checking/creating info functions in: {OUTPUT_DIR}")
        os.makedirs(OUTPUT_DIR, exist_ok=True) # Ensure dir exists once

        for name, data in mob_data.items():
            mob_filename = f"{name.lower()}.mcfunction"
            filepath = os.path.join(OUTPUT_DIR, mob_filename)

            if os.path.exists(filepath):
                # print(f"Skipping existing file: {mob_filename}")
                continue # Skip if file exists

            # --- Generate Content Directly ---
            display_name = name.replace('_', ' ')
            description_parts = [
                f"New mob found!\n{display_name}\n",
                f"Speed: {data.get('Speed', '?')}\n",
                f"Health: {data.get('Health', '?')}",
            ]
            if data.get('Ability'):
                description_parts.append(f"\n{data['Ability']}")
            description_text = "".join(description_parts)
            tellraw_json = json.dumps({"text": description_text, "color": "red"})
            content = (
                f"title @s actionbar {{\"text\":\"New mob found!\", \"color\": \"red\", \"bold\":true}}\n"
                f"tellraw @s {{\"text\":\"New mob found!\", \"color\": \"red\", \"bold\":true}}\n"
                f"tellraw @s {tellraw_json}\n"
                f"execute as @a at @s run playsound entity.villager.work_cartographer master @s ~ ~ ~ 1"
            )
            # --- End Generate Content ---

            try:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(content + '\n')
                print(f"+ Created: {mob_filename}")
            except Exception as e:
                print(f"! Error writing {mob_filename}: {e}")

        print("\nInfo function generation finished.")
    else:
        print("Could not process mob data. Exiting.")