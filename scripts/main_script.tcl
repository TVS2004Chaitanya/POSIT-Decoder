source ./scripts/config_script.tcl

set_attr init_lib_search_path ./lib/$tech_node/
set_attr hdl_search_path ./RTL/LZD_64_4/
set_attribute auto_ungroup none


#set_attr library fast.lib
set_attr library $cell_types
set_attribute hdl_parameter_naming_style _%s%d

#To check DRC
set_attribute drc_first true

read_hdl ./RTL/LZD_64_4/lzd_64_4.v
elaborate
#read_sdc ./constraints/$hdl_file/$hdl_file.sdc

#set top_module decoder.v

set_attribute auto_partition true

# Generic Synthesis
set_attr syn_generic_effort $generic_effort
syn_generic
write_hdl > ./synthesis/$hdl_file/$tech_node/generic/verilog/syn_generic.v
write_sdc > ./synthesis/$hdl_file/$tech_node/generic/constraints/syn_generic.sdc
report_gates > ./reports/$hdl_file/$tech_node/generic/syn_generic_gates.txt
report_area > ./reports/$hdl_file/$tech_node/generic/syn_generic_area.txt
report_timing > ./reports/$hdl_file/$tech_node/generic/syn_generic_timing.txt
report_power > ./reports/$hdl_file/$tech_node/generic/syn_generic_power.txt


# Mapping 
set_attr syn_map_effort $map_effort
syn_map
write_hdl > ./synthesis/$hdl_file/$tech_node/mapped/verilog/syn_unopt.v
write_sdc > ./synthesis/$hdl_file/$tech_node/mapped/constraints/syn_generic.sdc
report_gates > ./reports/$hdl_file/$tech_node/mapped/syn_map_gates.txt
report_area > ./reports/$hdl_file/$tech_node/mapped/syn_map_area.txt
report_timing > ./reports/$hdl_file/$tech_node/mapped/syn_map_timing.txt
report_power > ./reports/$hdl_file/$tech_node/mapped/syn_map_power.txt


# Optimized
set_attr syn_opt_effort $opt_effort
syn_opt
write_hdl > ./synthesis/$hdl_file/$tech_node/opt/verilog/syn_opt.v
write_sdc > ./synthesis/$hdl_file/$tech_node/opt/constraints/syn_generic.sdc
report_gates > ./reports/$hdl_file/$tech_node/opt/syn_opt_gates.txt
report_area > ./reports/$hdl_file/$tech_node/opt/syn_opt_area.txt
report_timing > ./reports/$hdl_file/$tech_node/opt/syn_opt_timing.txt
report_power > ./reports/$hdl_file/$tech_node/opt/syn_opt_power.txt


 
