import os

def create_wave_function(wave_number, mobs):
    """
    Create a Minecraft function file for a specific wave
    """
    # Ensure the directory exists
    os.makedirs('data\\core\\function\\defense\\monsters\\waves', exist_ok=True)
    
    # Open the file for writing
    filename = f'data\\core\\function\\defense\\monsters\\waves\\wave{wave_number}.mcfunction'
    print(f"Creating wave {wave_number} function...")
    
    with open(filename, 'w') as f:
        # Write mobs left and the bossbar update command
        f.write(f"execute if score $wave_track defense.wave matches 1 run scoreboard players set $mobs_left defense.wave {len(mobs)}\n")
        f.write(f"execute if score $wave_track defense.wave matches 1 store result bossbar minecraft:defense.mobs_left max run scoreboard players get $mobs_left defense.wave\n")
        # Write mob summoning commands
        for i, mob in enumerate(mobs):
            if mob.lower() in ['iron_golem_boss', 'giant', 'ravager', 'warden']:
                function_path = f"boss/{mob.lower()}/summon"
            else:
                function_path = f"summon/{mob.lower()}"
            f.write(f"execute if score $wave_track defense.wave matches {i+1} run function core:defense/monsters/{function_path}\n")
        
        # Schedule next wave and increment wave tracker
        # First get the delay depending on which wave it is
        delay = '3s'  # default value
        wave_num = int(wave_number)
        if wave_num in range(1, 21):
            delay = '3s'
        elif wave_num in range(21, 41):
            delay = '30t'
        elif wave_num in range(41, 51):
            delay = '15t'
        f.write(f'execute if score $wave_track defense.wave matches 1..{len(mobs)} run schedule function core:defense/monsters/waves/wave{wave_number} {delay}\n')
        f.write(f'execute if score $wave_track defense.wave matches 1..{len(mobs)} run scoreboard players add $wave_track defense.wave 1\n')
    
    print(f"Wave {wave_number} function created successfully!")

def bulk_create_waves(input_file):
    """
    Read waves from an input file and create function files
    """
    print(f"Reading waves from {input_file}")
    
    with open(input_file, 'r') as file:
        lines = file.readlines()
    
    current_wave = None
    current_mobs = []
    
    for line in lines:
        line = line.strip()
        
        # Skip empty lines and comments
        if not line or line.startswith('#'):
            continue
        
        # Check if this is a new wave definition
        if line.startswith('Wave '):
            # If we had a previous wave, create its function
            if current_wave is not None:
                create_wave_function(current_wave, current_mobs)
            
            # Start a new wave
            current_wave = line.split()[1]
            current_mobs = []
        else:
            # Add mob to current wave
            current_mobs.append(line)
    
    # Create the last wave
    if current_wave is not None:
        create_wave_function(current_wave, current_mobs)
    
    print("Bulk wave creation complete!")

# Example usage
if __name__ == "__main__":
    input_file = 'data\\core\\function\\defense\\monsters\\waves\\wave_list.txt'
    bulk_create_waves(input_file)