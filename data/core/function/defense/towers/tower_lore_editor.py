import sys
import shutil
import os

try:
    import pyperclip
except ImportError:
    print("Error: The 'pyperclip' library is required.")
    print("Please install it using: pip install pyperclip")
    sys.exit(1)

# --- Configuration ---
BASE_FILE = "towers.txt"
EDITED_FILE = "towers_new.txt"
ITEM_PREFIX = "-"
VALID_COLORS = {
    "gray": "&7",
    "purple": "" # Purple is the default, no color code needed
}
# Note: The parser now looks for 'Color:colorname' without a mandatory preceding space

# --- Function Definitions ---

def parse_towers_file(filepath):
    """
    Parses the tower data file into a dictionary. Handles 'Text...Color: color' format.
    Treats blank lines as empty lore lines (represented by a space, defaulting to purple).

    Args:
        filepath (str): The path to the file.

    Returns:
        dict: A dictionary where keys are item names and values are lists
              of tuples (lore_text, color_code). Returns None on critical error.
    """
    data = {}
    current_item_name = None
    current_item_lore = []
    line_num = 0
    global VALID_COLORS # Make configuration accessible

    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            for line in f:
                line_num += 1
                processed_line = line.strip()

                # Handle blank lines explicitly as lore lines
                if not processed_line:
                    if current_item_name is not None:
                        # Add a single space for visual representation in MC lore
                        current_item_lore.append((' ', ''))
                    continue # Go to next line

                # Handle item definition lines
                if processed_line.startswith(ITEM_PREFIX):
                    if current_item_name is not None:
                        data[current_item_name] = current_item_lore # Store previous item
                    item_name_candidate = processed_line[len(ITEM_PREFIX):].strip()
                    if not item_name_candidate:
                        print(f"Warning: Item definition starting with '{ITEM_PREFIX}' on line {line_num} "
                              f"in '{filepath}' has no name. Skipping item block.")
                        current_item_name = None
                        continue
                    current_item_name = item_name_candidate
                    current_item_lore = []

                # Handle lore lines for the current item
                elif current_item_name is not None:
                    color_marker = "Color:"
                    marker_index = processed_line.rfind(color_marker) # Find last 'Color:'

                    found_color = False
                    if marker_index != -1:
                        text = processed_line[:marker_index].rstrip()
                        potential_color_name = processed_line[marker_index + len(color_marker):].strip()
                        if potential_color_name in VALID_COLORS:
                            color_code = VALID_COLORS[potential_color_name]
                            # Use space if text part is empty, otherwise use text
                            current_item_lore.append((text if text else ' ', color_code))
                            found_color = True

                    if not found_color:
                        # Report error if format is incorrect for a lore line
                        print(f"Error: Invalid format or missing/incorrect color spec "
                              f"(expected '...Color:gray' or '...Color:purple') "
                              f"on line {line_num} for item '{current_item_name}' in '{filepath}'. "
                              f"Skipping line: '{processed_line}'")

            # Store the last item after the loop finishes
            if current_item_name is not None:
                data[current_item_name] = current_item_lore

    except FileNotFoundError:
        print(f"Error: File not found: {filepath}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred while reading {filepath} at line {line_num}: {e}")
        return None

    # Warnings for empty files or files with no valid items
    if not data and line_num > 0:
         print(f"Warning: File '{filepath}' was read, but no valid items starting with '{ITEM_PREFIX}' were found.")
    elif not data and line_num == 0:
         print(f"Warning: File '{filepath}' is empty.")

    return data

def generate_commands(base_data, edited_data):
    """
    Compares base and edited data to generate Minecraft commands for differences.

    Args:
        base_data (dict): Parsed data from the base file.
        edited_data (dict): Parsed data from the edited file.

    Returns:
        list: A list of tuples, where each tuple is (item_name, command_string).
        list: A list of names of deleted items.
    """
    commands = []
    base_items = set(base_data.keys())
    edited_items = set(edited_data.keys())

    new_item_names = edited_items - base_items
    deleted_item_names = base_items - edited_items
    common_item_names = base_items.intersection(edited_items)

    # 1. Handle New Items (Generate all lines)
    for item_name in new_item_names:
        print(f"Info: Detected new item '{item_name}'. Generating all lore lines.")
        edited_lore = edited_data[item_name]
        for idx, (text, color_code) in enumerate(edited_lore):
            command = f"/edit lore set {idx} {color_code}{text}"
            commands.append((item_name, command))

    # 2. Handle Common Items (Check for modifications, additions, deletions)
    for item_name in common_item_names:
        base_lore = base_data[item_name]
        edited_lore = edited_data[item_name]
        max_len = max(len(base_lore), len(edited_lore))

        for idx in range(max_len):
            base_line_data = base_lore[idx] if idx < len(base_lore) else None
            edited_line_data = edited_lore[idx] if idx < len(edited_lore) else None

            generate_cmd = False
            # Check conditions requiring a 'set' command for the edited line
            if edited_line_data is None:
                # Line was present in base but deleted in edited. No command needed.
                pass
            elif base_line_data is None:
                # Line is new in the edited file.
                generate_cmd = True
            else:
                # Line exists in both. Check if text content changed.
                # (Color-only changes do not trigger a command per original request)
                base_text, _ = base_line_data
                edited_text, _ = edited_line_data
                if base_text != edited_text:
                    generate_cmd = True

            # If a command is needed, use the data from the edited line
            if generate_cmd and edited_line_data:
                edited_text, edited_color = edited_line_data
                command = f"/edit lore set {idx} {edited_color}{edited_text}"
                commands.append((item_name, command))

    # 3. Return generated commands and list of deleted item names
    return commands, list(deleted_item_names)


def present_commands_and_update(commands, deleted_items, base_filepath, edited_filepath):
    """
    Presents commands to the user one by one, copies them, waits for Enter,
    and finally updates the base file if all commands were presented.

    Args:
        commands (list): List of (item_name, command_string) tuples.
        deleted_items (list): List of item names deleted in the edited file.
        base_filepath (str): Path to the base file.
        edited_filepath (str): Path to the edited file.

    Returns:
        bool: True if the process completed successfully and the file was updated,
              False otherwise (e.g., user interruption or file error).
    """
    if not commands and not deleted_items:
        print("\nNo changes detected between the files.")
        # Update base file anyway to sync potential metadata/format changes
        try:
             print(f"\nUpdating '{base_filepath}' to match '{edited_filepath}'...")
             shutil.copy2(edited_filepath, base_filepath) # copy2 preserves metadata
             print("Update complete.")
             return True
        except Exception as e:
            print(f"\nError updating base file even with no changes: {e}")
            return False

    print("\n--- Minecraft Lore Update Commands ---")
    if deleted_items:
        print("\nThe following items were present in the base file but removed in the edited file:")
        for name in deleted_items:
            print(f"- {name}")
        print("(No commands are generated for deletions)")

    if not commands:
         print("\nNo commands to generate for modifications or additions.")
         # Still update base file if deletions were reported
         try:
             print(f"\nUpdating '{base_filepath}' to match '{edited_filepath}'...")
             shutil.copy2(edited_filepath, base_filepath)
             print("Update complete.")
             return True
         except Exception as e:
            print(f"\nError updating base file after reporting deletions: {e}")
            return False

    # Instructions for the user
    print("\nInstructions:")
    print("1. Go into Minecraft.")
    print("2. Hold the item indicated below.")
    print("3. The script will copy the required command to your clipboard.")
    print("4. Paste the command into chat and run it.")
    print("5. Press Enter in this script's window to get the next command.")
    print("-" * 30)

    total_commands = len(commands)
    process_completed = False
    try:
        for i, (item_name, command) in enumerate(commands, 1):
            print(f"\n({i}/{total_commands}) Item: >>> {item_name} <<<")
            print(f"Command: {command}")

            try:
                pyperclip.copy(command)
                print(">>> Command copied to clipboard <<<")
            except pyperclip.PyperclipException as e:
                # Provide feedback if clipboard fails, but continue
                print(f"\n!! Error: Could not copy to clipboard: {e}")
                print(f"!! Please manually copy the command above.\n")

            input("Press Enter for the next command (or Ctrl+C to cancel)...")

        print("\n--- All commands presented ---")
        process_completed = True # Mark as completed if loop finished

    except KeyboardInterrupt:
        print("\n\nOperation cancelled by user. The base file will NOT be updated.")
        return False # Explicitly return False on user cancel
    except Exception as e:
        print(f"\nAn unexpected error occurred during command presentation: {e}")
        print("The base file was NOT updated.")
        return False # Explicitly return False on other errors during presentation

    # --- File Update Section ---
    # This block is reached only if the loop completes without error or interruption
    if process_completed:
        print(f"\nUpdating '{base_filepath}' with the contents of '{edited_filepath}'...")
        try:
            shutil.copy2(edited_filepath, base_filepath) # Use copy2 to preserve metadata
            print(f"Successfully updated '{base_filepath}'.")
            return True
        except Exception as e:
            print(f"\nError: Failed to update '{base_filepath}': {e}")
            return False # Return False if the final update fails
    else:
        # Should not typically be reached due to explicit returns above, but as a safeguard:
        print("\nProcess did not complete successfully. Base file was NOT updated.")
        return False

# --- Main Execution ---
if __name__ == "__main__":
    print(f"Reading base file: {BASE_FILE}")
    base_data = parse_towers_file(BASE_FILE)

    if base_data is None:
        print("Exiting due to error reading base file.")
        sys.exit(1)

    print(f"\nReading edited file: {EDITED_FILE}")
    edited_data = parse_towers_file(EDITED_FILE)

    if edited_data is None:
        print("Exiting due to error reading edited file.")
        sys.exit(1)

    print("\nComparing files and generating commands...")
    commands_to_run, deleted_item_names = generate_commands(base_data, edited_data)

    # Present commands and update file if successful
    present_commands_and_update(commands_to_run, deleted_item_names, BASE_FILE, EDITED_FILE)

    print("\nScript finished.")