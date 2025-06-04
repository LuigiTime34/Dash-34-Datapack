#!/usr/bin/env python3
"""
Mob Wave Analyzer - Reads wave data and displays mob statistics with terminal bar graph
"""

import sys
from collections import Counter

# Gold values for each mob
GOLD_VALUES = {
    'Zombie': 5,
    'Skeleton': 10,
    'Silverfish': 8,
    'Spider': 6,
    'Chicken_Jockey': 8,
    'Creeper': 10,
    'Charged_Creeper': 10,
    'Witch': 10,
    'Zombified_Piglin': 3,
    'Stray': 12,
    'Bogged': 12,
    'Enderman': 16,
    'Endermite': 0,
    'Breeze': 20,
    'Zoglin': 25,
    'Iron_Golem': 40,
    'Iron_Golem_Boss': 40,  # Assuming same as Iron_Golem
    'Giant': 50,
    'Ravager': 30,
    'Illusioner': 30,
    'Warden': 0
}

def create_abbreviations(mob_names):
    """Create unique 2-letter abbreviations for mob names"""
    abbreviations = {}
    used_abbrevs = set()
    
    # First pass: try first two letters
    for mob in mob_names:
        abbrev = mob[:2].upper()
        if abbrev not in used_abbrevs:
            abbreviations[mob] = abbrev
            used_abbrevs.add(abbrev)
    
    # Second pass: handle conflicts
    for mob in mob_names:
        if mob not in abbreviations:
            # Try first letter + second letter of second word (if exists)
            parts = mob.split('_')
            if len(parts) > 1:
                abbrev = (parts[0][0] + parts[1][0]).upper()
                if abbrev not in used_abbrevs:
                    abbreviations[mob] = abbrev
                    used_abbrevs.add(abbrev)
                    continue
            
            # Try first letter + last letter
            abbrev = (mob[0] + mob[-1]).upper()
            if abbrev not in used_abbrevs:
                abbreviations[mob] = abbrev
                used_abbrevs.add(abbrev)
                continue
            
            # Try first letter + second-to-last letter
            abbrev = (mob[0] + mob[-2]).upper()
            if abbrev not in used_abbrevs:
                abbreviations[mob] = abbrev
                used_abbrevs.add(abbrev)
                continue
            
            # Last resort: add a number
            base_abbrev = mob[:2].upper()
            counter = 1
            while f"{base_abbrev}{counter}" in used_abbrevs:
                counter += 1
            abbrev = f"{base_abbrev}{counter}"
            abbreviations[mob] = abbrev
            used_abbrevs.add(abbrev)
    
    return abbreviations

def parse_wave_file(filename):
    """Parse the wave file and return a list of all mobs"""
    mobs = []
    try:
        with open(filename, 'r') as file:
            for line in file:
                line = line.strip()
                if line and not line.startswith('Wave'):
                    mobs.append(line)
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file: {e}")
        sys.exit(1)
    
    return mobs

def create_bar_graph(mob_counts, abbreviations, max_width=50):
    """Create a terminal bar graph of mob counts"""
    if not mob_counts:
        return
    
    max_count = max(mob_counts.values())
    
    print("MOB COUNT BAR GRAPH")
    print("=" * 60)
    
    # Sort by count (descending) then by name
    sorted_mobs = sorted(mob_counts.items(), key=lambda x: (-x[1], x[0]))
    
    for mob, count in sorted_mobs:
        abbrev = abbreviations[mob]
        # Calculate bar length
        bar_length = int((count / max_count) * max_width)
        bar = '█' * bar_length
        
        # Format the line
        print(f"{abbrev:>3} │{bar:<{max_width}} │ {count:>3}")
    
    print("=" * 60)

def calculate_gold_stats(mob_counts):
    """Calculate gold statistics"""
    total_gold = 0
    total_mobs = 0
    
    for mob, count in mob_counts.items():
        gold_per_mob = GOLD_VALUES.get(mob, 0)
        total_gold += gold_per_mob * count
        total_mobs += count
    
    return total_gold, total_mobs

def main():
    filename = r"data\core\function\defense\monsters\waves\wave_list.txt"
    
    # Parse the wave file
    mobs = parse_wave_file(filename)
    
    # Count mob occurrences
    mob_counts = Counter(mobs)
    
    # Create abbreviations
    unique_mobs = list(mob_counts.keys())
    abbreviations = create_abbreviations(unique_mobs)
    
    # Display bar graph
    create_bar_graph(mob_counts, abbreviations)
    
    # Calculate and display statistics
    total_gold, total_mobs = calculate_gold_stats(mob_counts)
    num_waves = 50  # Based on the provided data
    
    print(f"\nSTATISTICS")
    print("=" * 30)
    print(f"Total Mobs:        {total_mobs:>6}")
    print(f"Average per Wave:  {total_mobs/num_waves:>6.1f}")
    print(f"Total Gold:        {total_gold:>6}")
    print(f"Average per Wave:  {total_gold/num_waves:>6.1f}")
    print("=" * 30)
    
    # Show abbreviation legend
    print(f"\nABBREVIATION LEGEND")
    print("=" * 30)
    for mob in sorted(unique_mobs):
        abbrev = abbreviations[mob]
        gold = GOLD_VALUES.get(mob, 0)
        print(f"{abbrev:>3} = {mob:<20} (Gold: {gold:>2})")

if __name__ == "__main__":
    main()