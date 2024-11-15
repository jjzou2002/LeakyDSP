##############################PS XDC#########################################
############################################################################
##
##  Xilinx, Inc. 2006            www.xilinx.com
############################################################################
##  File name :       psu_constraints.xdc
##
##  Details :     Constraints file
##                    FPGA family:       zynq
##                    FPGA:              PROD-1
##                    Device Size:       xczu3eg
##                    Package:           sfvc784
##                    Speedgrade:        -1
##
##
############################################################################
############################################################################
############################################################################
# Clock constraints                                                        #
############################################################################
create_clock -name clk_pl_0 -period "3.333" [get_pins "PS8_i/PLCLK[0]"]
create_clock -name clk_pl_1 -period "3.333" [get_pins "PS8_i/PLCLK[1]"]
create_clock -name clk_pl_2 -period "3.333" [get_pins "PS8_i/PLCLK[2]"]
create_clock -name clk_pl_3 -period "3.333" [get_pins "PS8_i/PLCLK[3]"]



set_property DONT_TOUCH true [get_cells "PS8_i"]
