
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name cpu -dir "D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/planAhead_run_5" -part xc3s1200efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/cpu.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Junior/ComputerOrganization/CPU/jiyuan/cpu} {ipcore_dir} }
add_files [list {ipcore_dir/digit.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fontRom.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "cpu.ucf" [current_fileset -constrset]
add_files [list {cpu.ucf}] -fileset [get_property constrset [current_run]]
link_design
