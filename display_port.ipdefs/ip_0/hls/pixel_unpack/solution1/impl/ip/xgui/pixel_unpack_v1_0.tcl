# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"

}


proc update_MODELPARAM_VALUE.C_S_AXI_AXILITES_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_AXILITES_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_S_AXI_AXILITES_ADDR_WIDTH". Setting updated value from the model parameter.
set_property value 5 ${MODELPARAM_VALUE.C_S_AXI_AXILITES_ADDR_WIDTH}
}

