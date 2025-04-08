import os

def create_mcfunction_file():
    # Prompt the user for inputs
    mob = input("Enter the mob type (e.g., zombie, skeleton): ")
    health = input("Enter the mob's health: ")
    bonus_damage = input("Enter the mob's bonus damage: ")
    speed = input("Enter the mob's speed: ")

    # Generate the command
    command = (
        f"execute positioned 4 -59 146 run summon {mob} ~ ~ ~ "
        f"{{CustomNameVisible:1b,Health:{health},NoAI:1b,Rotation:[90f,0.0f],Tags:[\"defense-monster\",\"cw_hp_disp\",\"defense-{mob}\",\"Entity-Dummy\"],"
        f"Team:defense_enemies,attributes:[{{id:\"max_health\",base:{health}}},"
        f"{{id:\"minecraft:attack_damage\",base:{bonus_damage}}},"
        f"{{id:\"minecraft:attack_knockback\",base:{speed}}}]}}"
    )

    # Create the file path
    path = os.path.join(
        "data", "core", "function", "defense", "monsters", "summon"
    )
    os.makedirs(path, exist_ok=True)
    file_path = os.path.join(path, f"{mob}.mcfunction")

    # Write the command to the file
    with open(file_path, "w") as file:
        file.write(command)
        file.write(f"\nexecute as @a[advancements={{core:defense/mobs/{mob}=false}}] run advancement grant @s only core:defense/mobs/{mob}")

    print(f"The command has been written to {file_path}")

if __name__ == "__main__":
    create_mcfunction_file()
