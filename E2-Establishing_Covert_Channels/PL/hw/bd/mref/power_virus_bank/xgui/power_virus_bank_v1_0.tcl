# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BANK_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BANK_SIZE" -parent ${Page_0}


}

proc update_PARAM_VALUE.BANK_COUNT { PARAM_VALUE.BANK_COUNT } {
	# Procedure called to update BANK_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BANK_COUNT { PARAM_VALUE.BANK_COUNT } {
	# Procedure called to validate BANK_COUNT
	return true
}

proc update_PARAM_VALUE.BANK_SIZE { PARAM_VALUE.BANK_SIZE } {
	# Procedure called to update BANK_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BANK_SIZE { PARAM_VALUE.BANK_SIZE } {
	# Procedure called to validate BANK_SIZE
	return true
}


proc update_MODELPARAM_VALUE.BANK_COUNT { MODELPARAM_VALUE.BANK_COUNT PARAM_VALUE.BANK_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BANK_COUNT}] ${MODELPARAM_VALUE.BANK_COUNT}
}

proc update_MODELPARAM_VALUE.BANK_SIZE { MODELPARAM_VALUE.BANK_SIZE PARAM_VALUE.BANK_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BANK_SIZE}] ${MODELPARAM_VALUE.BANK_SIZE}
}

