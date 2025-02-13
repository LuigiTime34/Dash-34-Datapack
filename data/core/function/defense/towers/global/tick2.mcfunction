# ARCHER TOWER UPGRADES
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"1","cost":"20","item_slot":"0","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_witch1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_witch","cost":"200","item_slot":"1","slot_to_replace":"11"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_witch2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_witch2","cost":"400","item_slot":"2","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_pillager1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_pillager","cost":"250","item_slot":"3","slot_to_replace":"15"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_pillager2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_pillager2","cost":"450","item_slot":"4","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{archer_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/sell

# ELEMENT UPGRADES
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_fire1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_fire1","cost":"100","item_slot":"5","slot_to_replace":"10"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_fire2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_fire2","cost":"350","item_slot":"6","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_upgrade_wind1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_wind1","cost":"100","item_slot":"7","slot_to_replace":"12"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_wind2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_wind2","cost":"350","item_slot":"8","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_upgrade_ice1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_ice1","cost":"100","item_slot":"9","slot_to_replace":"14"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_ice2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_ice2","cost":"350","item_slot":"10","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_upgrade_earth1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_earth1","cost":"100","item_slot":"11","slot_to_replace":"16"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_earth2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_earth2","cost":"350","item_slot":"12","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/sell


# TREEEEE UPGRADES
$execute if items entity @s $(slot) *[custom_data~{tree_upgrade1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tree-center-marker] run function core:defense/towers/tree/placement/get_rotation {"building":"1","cost":"60","item_slot":"13","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{tree_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tree-center-marker] run function core:defense/towers/tree/sell

# TENT UPGRADES
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade1:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"1"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_camp:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_camp"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_barracks:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_barracks"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_camp2:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_camp2"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_barracks2:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_barracks2"}