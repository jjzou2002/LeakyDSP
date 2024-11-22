

set_property PACKAGE_PIN W5 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk_in]
set_property PACKAGE_PIN R2 [get_ports reset_n_in]
set_property IOSTANDARD LVCMOS33 [get_ports reset_n_in]

create_pblock pblock_AES
add_cells_to_pblock [get_pblocks pblock_AES] [get_cells -quiet [list aes]]
resize_pblock [get_pblocks pblock_AES] -add {SLICE_X0Y130:SLICE_X19Y149}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_AES]
set_property KEEP_HIERARCHY true [get_cells aes]

#-------------------------------------------------------------------------------------
## placement1
#create_pblock pblock_sensor
#resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X10Y120:SLICE_X13Y129}
#resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X0Y48:DSP48_X0Y51}
#add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]

## placement2
#create_pblock pblock_sensor
#resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X10Y100:SLICE_X13Y109}
#resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X0Y40:DSP48_X0Y43}
#add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]

## placement3 
#create_pblock pblock_sensor
#resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X10Y90:SLICE_X13Y99}
#resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X0Y36:DSP48_X0Y39}
#add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]

## placement4 
#create_pblock pblock_sensor
#resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X10Y50:SLICE_X13Y59}
#resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X0Y20:DSP48_X0Y23}
#add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]

## placement5 
#create_pblock pblock_sensor
#resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X52Y140:SLICE_X55Y149}
#resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X1Y56:DSP48_X1Y59}
#add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]

## placement6
create_pblock pblock_sensor
resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X52Y100:SLICE_X55Y109}
resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X1Y40:DSP48_X1Y43}
add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]

## placement7 
#create_pblock pblock_sensor
#resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X52Y90:SLICE_X55Y99}
#resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X1Y36:DSP48_X1Y39}
#add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]

# placement8 
#create_pblock pblock_sensor
#resize_pblock [get_pblocks pblock_sensor] -add {SLICE_X52Y50:SLICE_X55Y59}
#resize_pblock [get_pblocks pblock_sensor] -add {DSP48_X1Y20:DSP48_X1Y23}
#add_cells_to_pblock [get_pblocks pblock_sensor] [get_cells sensor/*]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_sensor]
#-------------------------------------------------------------------------------------

#set_property DONT_TOUCH true [get_cells */tdc0/*]

create_pblock pblock_BOTTOM
add_cells_to_pblock [get_pblocks pblock_BOTTOM] [get_cells -quiet [list ttest]]
resize_pblock [get_pblocks pblock_BOTTOM] -add {CLOCKREGION_X0Y0:CLOCKREGION_X1Y0}
add_cells_to_pblock [get_pblocks pblock_BOTTOM] [get_cells *reset*]
add_cells_to_pblock [get_pblocks pblock_BOTTOM] [get_cells *io_controller*]
add_cells_to_pblock [get_pblocks pblock_BOTTOM] [get_cells *delay*]
add_cells_to_pblock [get_pblocks pblock_BOTTOM] [get_cells *ttest*]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_BOTTOM]

set_property PACKAGE_PIN B18 [get_ports rx_i]
set_property IOSTANDARD LVCMOS33 [get_ports rx_i]
set_property PACKAGE_PIN A18 [get_ports tx_o]
set_property IOSTANDARD LVCMOS33 [get_ports tx_o]

set_false_path -from [get_clocks sensor_clk_clock_generator] 
#set_false_path -to [get_pins {*/tdc0/sensor_instances[0].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[1].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[2].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[3].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[4].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[5].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[6].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[7].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[8].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[9].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[10].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[11].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[12].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[13].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[14].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[15].sensor_instance/clk_i}]


#set_false_path -to [get_pins {*/tdc0/sensor_instances[16].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[17].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[18].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[19].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[20].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[21].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[22].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[23].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[24].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[25].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[26].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[27].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[28].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[29].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[30].sensor_instance/clk_i}]
#set_false_path -to [get_pins {*/tdc0/sensor_instances[31].sensor_instance/clk_i}]

#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[127].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[126].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[125].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[124].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[123].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[122].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[121].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[120].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[119].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[118].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[117].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[116].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[115].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[114].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[113].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[112].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[111].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[110].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[109].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[108].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[107].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[106].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[105].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[104].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[103].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[102].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[101].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[100].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[99].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[98].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[97].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[96].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[95].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[94].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[93].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[92].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[91].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[90].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[89].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[88].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[87].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[86].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[85].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[84].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[83].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[82].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[81].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[80].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[79].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[78].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[77].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[76].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[75].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[74].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[73].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[72].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[71].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[70].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[69].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[68].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[67].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[66].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[65].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[64].obs_regs/D}]


#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[63].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[62].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[61].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[60].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[59].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[58].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[57].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[56].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[55].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[54].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[53].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[52].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[51].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[50].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[49].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[48].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[47].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[46].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[45].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[44].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[43].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[42].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[41].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[40].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[39].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[38].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[37].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[36].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[35].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[34].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[33].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[32].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[31].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[30].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[29].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[28].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[27].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[26].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[25].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[24].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[23].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[22].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[21].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[20].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[19].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[18].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[17].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[16].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[15].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[14].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[13].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[12].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[11].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[10].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[9].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[8].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[7].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[6].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[5].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[4].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[3].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[2].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[1].obs_regs/D}]
#set_false_path -to [get_pins {*/tdc0/sensor_o_regs[0].obs_regs/D}]
