# ARCHER TOWER UPGRADES
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"1","cost":"20","item_slot":"0","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_witch1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_witch","cost":"200","item_slot":"1","slot_to_replace":"11"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_witch2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_witch2","cost":"400","item_slot":"2","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_pillager1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_pillager","cost":"250","item_slot":"3","slot_to_replace":"15"}
$execute if items entity @s $(slot) *[custom_data~{archer_upgrade_pillager2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/placement/get_rotation {"building":"_pillager2","cost":"450","item_slot":"4","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{archer_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=tower-center-marker] run function core:defense/towers/archer/sell

# ELEMENT UPGRADES
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_fire1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_fire1","cost":"75","item_slot":"5","slot_to_replace":"10"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_fire2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_fire2","cost":"300","item_slot":"6","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_upgrade_wind1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_wind1","cost":"75","item_slot":"7","slot_to_replace":"12"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_wind2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_wind2","cost":"350","item_slot":"8","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_upgrade_ice1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_ice1","cost":"75","item_slot":"9","slot_to_replace":"14"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_ice2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_ice2","cost":"350","item_slot":"10","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_upgrade_earth1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_earth1","cost":"75","item_slot":"11","slot_to_replace":"16"}
$execute if items entity @s $(slot) *[custom_data~{element_upgrade_earth2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/placement/get_rotation {"building":"_earth2","cost":"350","item_slot":"12","slot_to_replace":"13"}

$execute if items entity @s $(slot) *[custom_data~{element_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=element-center-marker] run function core:defense/towers/element/sell


# beeEEE UPGRADES
$execute if items entity @s $(slot) *[custom_data~{bee_upgrade1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=bee-center-marker] run function core:defense/towers/bee/placement/get_rotation {"building":"1","cost":"40","item_slot":"13","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{bee_upgrade_attack1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=bee-center-marker] run function core:defense/towers/bee/placement/get_rotation {"building":"_attack1","cost":"150","item_slot":"14","slot_to_replace":"15"}
$execute if items entity @s $(slot) *[custom_data~{bee_upgrade_attack2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=bee-center-marker] run function core:defense/towers/bee/placement/get_rotation {"building":"_attack2","cost":"300","item_slot":"15","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{bee_upgrade_money1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=bee-center-marker] run function core:defense/towers/bee/placement/get_rotation {"building":"_money1","cost":"200","item_slot":"16","slot_to_replace":"11"}
$execute if items entity @s $(slot) *[custom_data~{bee_upgrade_money2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=bee-center-marker] run function core:defense/towers/bee/placement/get_rotation {"building":"_money2","cost":"400","item_slot":"17","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{bee_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=bee-center-marker] run function core:defense/towers/bee/sell

# STORM UPGRADES
$execute if items entity @s $(slot) *[custom_data~{storm_upgrade1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=storm-center-marker] run function core:defense/towers/storm/placement/get_rotation {"building":"1","cost":"75","item_slot":"18","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{storm_upgrade_snow1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=storm-center-marker] run function core:defense/towers/storm/placement/get_rotation {"building":"_snow1","cost":"150","item_slot":"19","slot_to_replace":"15"}
$execute if items entity @s $(slot) *[custom_data~{storm_upgrade_snow2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=storm-center-marker] run function core:defense/towers/storm/placement/get_rotation {"building":"_snow2","cost":"300","item_slot":"20","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{storm_upgrade_surge1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=storm-center-marker] run function core:defense/towers/storm/placement/get_rotation {"building":"_surge1","cost":"150","item_slot":"21","slot_to_replace":"11"}
$execute if items entity @s $(slot) *[custom_data~{storm_upgrade_surge2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=storm-center-marker] run function core:defense/towers/storm/placement/get_rotation {"building":"_surge2","cost":"300","item_slot":"22","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{storm_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=storm-center-marker] run function core:defense/towers/storm/sell

# PANDA UPGRADES
$execute if items entity @s $(slot) *[custom_data~{panda_upgrade1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=panda-center-marker] run function core:defense/towers/panda/placement/get_rotation {"building":"1","cost":"20","item_slot":"0","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{panda_upgrade_shoot1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=panda-center-marker] run function core:defense/towers/panda/placement/get_rotation {"building":"_shoot1","cost":"150","item_slot":"1","slot_to_replace":"11"}
$execute if items entity @s $(slot) *[custom_data~{panda_upgrade_shoot2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=panda-center-marker] run function core:defense/towers/panda/placement/get_rotation {"building":"_shoot2","cost":"300","item_slot":"2","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{panda_upgrade_bamboom1:1b}] as @n[tag=tower-barrel-marker] at @n[tag=panda-center-marker] run function core:defense/towers/panda/placement/get_rotation {"building":"_bamboom1","cost":"150","item_slot":"3","slot_to_replace":"15"}
$execute if items entity @s $(slot) *[custom_data~{panda_upgrade_bamboom2:1b}] as @n[tag=tower-barrel-marker] at @n[tag=panda-center-marker] run function core:defense/towers/panda/placement/get_rotation {"building":"_bamboom2","cost":"300","item_slot":"4","slot_to_replace":"13"}
$execute if items entity @s $(slot) *[custom_data~{panda_sell:1b}] as @n[tag=tower-barrel-marker] at @n[tag=panda-center-marker] run function core:defense/towers/panda/sell


# TENT UPGRADES
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade1:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"1"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_camp:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_camp"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_barracks:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_barracks"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_camp2:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_camp2"}
# $execute if items entity @s $(slot) *[custom_data~{tent_upgrade_barracks2:1b}] run function core:defense/towers/tent/placement/upgrade {"building":"_barracks2"}