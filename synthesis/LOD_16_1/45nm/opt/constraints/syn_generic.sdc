# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.10-p002_1 on Wed Nov 20 13:10:24 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design lod_16_1_decoder

set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
