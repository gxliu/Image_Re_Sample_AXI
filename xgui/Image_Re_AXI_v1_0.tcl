# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_S00_AXI_BASEADDR [ipgui::add_param $IPINST -parent $Page0 -name C_S00_AXI_BASEADDR]
	set C_S00_AXI_HIGHADDR [ipgui::add_param $IPINST -parent $Page0 -name C_S00_AXI_HIGHADDR]
	set C_S00_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S00_AXI_ADDR_WIDTH]
	set_property tooltip {Width of S_AXI address bus} $C_S00_AXI_ADDR_WIDTH
	set addr_width [ipgui::add_param $IPINST -parent $Page0 -name addr_width]
	set col_max_bit [ipgui::add_param $IPINST -parent $Page0 -name col_max_bit]
	set data_delay [ipgui::add_param $IPINST -parent $Page0 -name data_delay]
	set C_S00_AXI_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S00_AXI_DATA_WIDTH]
	set_property tooltip {Width of S_AXI data bus} $C_S00_AXI_DATA_WIDTH
	set row_max_bit [ipgui::add_param $IPINST -parent $Page0 -name row_max_bit]
	set diff_min [ipgui::add_param $IPINST -parent $Page0 -name diff_min]
	set diff_max [ipgui::add_param $IPINST -parent $Page0 -name diff_max]
	set b_b_min [ipgui::add_param $IPINST -parent $Page0 -name b_b_min]
	set b_g_min [ipgui::add_param $IPINST -parent $Page0 -name b_g_min]
	set b_r_min [ipgui::add_param $IPINST -parent $Page0 -name b_r_min]
	set b_b_max [ipgui::add_param $IPINST -parent $Page0 -name b_b_max]
	set b_g_max [ipgui::add_param $IPINST -parent $Page0 -name b_g_max]
	set b_r_max [ipgui::add_param $IPINST -parent $Page0 -name b_r_max]
	set g_b_min [ipgui::add_param $IPINST -parent $Page0 -name g_b_min]
	set g_g_min [ipgui::add_param $IPINST -parent $Page0 -name g_g_min]
	set g_r_min [ipgui::add_param $IPINST -parent $Page0 -name g_r_min]
	set g_b_max [ipgui::add_param $IPINST -parent $Page0 -name g_b_max]
	set g_g_max [ipgui::add_param $IPINST -parent $Page0 -name g_g_max]
	set g_r_max [ipgui::add_param $IPINST -parent $Page0 -name g_r_max]
	set y_b_min [ipgui::add_param $IPINST -parent $Page0 -name y_b_min]
	set y_g_min [ipgui::add_param $IPINST -parent $Page0 -name y_g_min]
	set y_r_min [ipgui::add_param $IPINST -parent $Page0 -name y_r_min]
	set y_b_max [ipgui::add_param $IPINST -parent $Page0 -name y_b_max]
	set y_g_max [ipgui::add_param $IPINST -parent $Page0 -name y_g_max]
	set y_r_max [ipgui::add_param $IPINST -parent $Page0 -name y_r_max]
	set col_max [ipgui::add_param $IPINST -parent $Page0 -name col_max]
	set row_max [ipgui::add_param $IPINST -parent $Page0 -name row_max]
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.addr_width { PARAM_VALUE.addr_width } {
	# Procedure called to update addr_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.addr_width { PARAM_VALUE.addr_width } {
	# Procedure called to validate addr_width
	return true
}

proc update_PARAM_VALUE.col_max_bit { PARAM_VALUE.col_max_bit } {
	# Procedure called to update col_max_bit when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.col_max_bit { PARAM_VALUE.col_max_bit } {
	# Procedure called to validate col_max_bit
	return true
}

proc update_PARAM_VALUE.data_delay { PARAM_VALUE.data_delay } {
	# Procedure called to update data_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_delay { PARAM_VALUE.data_delay } {
	# Procedure called to validate data_delay
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.row_max_bit { PARAM_VALUE.row_max_bit } {
	# Procedure called to update row_max_bit when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.row_max_bit { PARAM_VALUE.row_max_bit } {
	# Procedure called to validate row_max_bit
	return true
}

proc update_PARAM_VALUE.diff_min { PARAM_VALUE.diff_min } {
	# Procedure called to update diff_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.diff_min { PARAM_VALUE.diff_min } {
	# Procedure called to validate diff_min
	return true
}

proc update_PARAM_VALUE.diff_max { PARAM_VALUE.diff_max } {
	# Procedure called to update diff_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.diff_max { PARAM_VALUE.diff_max } {
	# Procedure called to validate diff_max
	return true
}

proc update_PARAM_VALUE.b_b_min { PARAM_VALUE.b_b_min } {
	# Procedure called to update b_b_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.b_b_min { PARAM_VALUE.b_b_min } {
	# Procedure called to validate b_b_min
	return true
}

proc update_PARAM_VALUE.b_g_min { PARAM_VALUE.b_g_min } {
	# Procedure called to update b_g_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.b_g_min { PARAM_VALUE.b_g_min } {
	# Procedure called to validate b_g_min
	return true
}

proc update_PARAM_VALUE.b_r_min { PARAM_VALUE.b_r_min } {
	# Procedure called to update b_r_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.b_r_min { PARAM_VALUE.b_r_min } {
	# Procedure called to validate b_r_min
	return true
}

proc update_PARAM_VALUE.b_b_max { PARAM_VALUE.b_b_max } {
	# Procedure called to update b_b_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.b_b_max { PARAM_VALUE.b_b_max } {
	# Procedure called to validate b_b_max
	return true
}

proc update_PARAM_VALUE.b_g_max { PARAM_VALUE.b_g_max } {
	# Procedure called to update b_g_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.b_g_max { PARAM_VALUE.b_g_max } {
	# Procedure called to validate b_g_max
	return true
}

proc update_PARAM_VALUE.b_r_max { PARAM_VALUE.b_r_max } {
	# Procedure called to update b_r_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.b_r_max { PARAM_VALUE.b_r_max } {
	# Procedure called to validate b_r_max
	return true
}

proc update_PARAM_VALUE.g_b_min { PARAM_VALUE.g_b_min } {
	# Procedure called to update g_b_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_b_min { PARAM_VALUE.g_b_min } {
	# Procedure called to validate g_b_min
	return true
}

proc update_PARAM_VALUE.g_g_min { PARAM_VALUE.g_g_min } {
	# Procedure called to update g_g_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_g_min { PARAM_VALUE.g_g_min } {
	# Procedure called to validate g_g_min
	return true
}

proc update_PARAM_VALUE.g_r_min { PARAM_VALUE.g_r_min } {
	# Procedure called to update g_r_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_r_min { PARAM_VALUE.g_r_min } {
	# Procedure called to validate g_r_min
	return true
}

proc update_PARAM_VALUE.g_b_max { PARAM_VALUE.g_b_max } {
	# Procedure called to update g_b_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_b_max { PARAM_VALUE.g_b_max } {
	# Procedure called to validate g_b_max
	return true
}

proc update_PARAM_VALUE.g_g_max { PARAM_VALUE.g_g_max } {
	# Procedure called to update g_g_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_g_max { PARAM_VALUE.g_g_max } {
	# Procedure called to validate g_g_max
	return true
}

proc update_PARAM_VALUE.g_r_max { PARAM_VALUE.g_r_max } {
	# Procedure called to update g_r_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_r_max { PARAM_VALUE.g_r_max } {
	# Procedure called to validate g_r_max
	return true
}

proc update_PARAM_VALUE.y_b_min { PARAM_VALUE.y_b_min } {
	# Procedure called to update y_b_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.y_b_min { PARAM_VALUE.y_b_min } {
	# Procedure called to validate y_b_min
	return true
}

proc update_PARAM_VALUE.y_g_min { PARAM_VALUE.y_g_min } {
	# Procedure called to update y_g_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.y_g_min { PARAM_VALUE.y_g_min } {
	# Procedure called to validate y_g_min
	return true
}

proc update_PARAM_VALUE.y_r_min { PARAM_VALUE.y_r_min } {
	# Procedure called to update y_r_min when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.y_r_min { PARAM_VALUE.y_r_min } {
	# Procedure called to validate y_r_min
	return true
}

proc update_PARAM_VALUE.y_b_max { PARAM_VALUE.y_b_max } {
	# Procedure called to update y_b_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.y_b_max { PARAM_VALUE.y_b_max } {
	# Procedure called to validate y_b_max
	return true
}

proc update_PARAM_VALUE.y_g_max { PARAM_VALUE.y_g_max } {
	# Procedure called to update y_g_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.y_g_max { PARAM_VALUE.y_g_max } {
	# Procedure called to validate y_g_max
	return true
}

proc update_PARAM_VALUE.y_r_max { PARAM_VALUE.y_r_max } {
	# Procedure called to update y_r_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.y_r_max { PARAM_VALUE.y_r_max } {
	# Procedure called to validate y_r_max
	return true
}

proc update_PARAM_VALUE.col_max { PARAM_VALUE.col_max } {
	# Procedure called to update col_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.col_max { PARAM_VALUE.col_max } {
	# Procedure called to validate col_max
	return true
}

proc update_PARAM_VALUE.row_max { PARAM_VALUE.row_max } {
	# Procedure called to update row_max when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.row_max { PARAM_VALUE.row_max } {
	# Procedure called to validate row_max
	return true
}


proc update_MODELPARAM_VALUE.data_delay { MODELPARAM_VALUE.data_delay PARAM_VALUE.data_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_delay}] ${MODELPARAM_VALUE.data_delay}
}

proc update_MODELPARAM_VALUE.row_max { MODELPARAM_VALUE.row_max PARAM_VALUE.row_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.row_max}] ${MODELPARAM_VALUE.row_max}
}

proc update_MODELPARAM_VALUE.col_max { MODELPARAM_VALUE.col_max PARAM_VALUE.col_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.col_max}] ${MODELPARAM_VALUE.col_max}
}

proc update_MODELPARAM_VALUE.row_max_bit { MODELPARAM_VALUE.row_max_bit PARAM_VALUE.row_max_bit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.row_max_bit}] ${MODELPARAM_VALUE.row_max_bit}
}

proc update_MODELPARAM_VALUE.col_max_bit { MODELPARAM_VALUE.col_max_bit PARAM_VALUE.col_max_bit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.col_max_bit}] ${MODELPARAM_VALUE.col_max_bit}
}

proc update_MODELPARAM_VALUE.addr_width { MODELPARAM_VALUE.addr_width PARAM_VALUE.addr_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.addr_width}] ${MODELPARAM_VALUE.addr_width}
}

proc update_MODELPARAM_VALUE.y_r_max { MODELPARAM_VALUE.y_r_max PARAM_VALUE.y_r_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.y_r_max}] ${MODELPARAM_VALUE.y_r_max}
}

proc update_MODELPARAM_VALUE.y_g_max { MODELPARAM_VALUE.y_g_max PARAM_VALUE.y_g_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.y_g_max}] ${MODELPARAM_VALUE.y_g_max}
}

proc update_MODELPARAM_VALUE.y_b_max { MODELPARAM_VALUE.y_b_max PARAM_VALUE.y_b_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.y_b_max}] ${MODELPARAM_VALUE.y_b_max}
}

proc update_MODELPARAM_VALUE.y_r_min { MODELPARAM_VALUE.y_r_min PARAM_VALUE.y_r_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.y_r_min}] ${MODELPARAM_VALUE.y_r_min}
}

proc update_MODELPARAM_VALUE.y_g_min { MODELPARAM_VALUE.y_g_min PARAM_VALUE.y_g_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.y_g_min}] ${MODELPARAM_VALUE.y_g_min}
}

proc update_MODELPARAM_VALUE.y_b_min { MODELPARAM_VALUE.y_b_min PARAM_VALUE.y_b_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.y_b_min}] ${MODELPARAM_VALUE.y_b_min}
}

proc update_MODELPARAM_VALUE.g_r_max { MODELPARAM_VALUE.g_r_max PARAM_VALUE.g_r_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_r_max}] ${MODELPARAM_VALUE.g_r_max}
}

proc update_MODELPARAM_VALUE.g_g_max { MODELPARAM_VALUE.g_g_max PARAM_VALUE.g_g_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_g_max}] ${MODELPARAM_VALUE.g_g_max}
}

proc update_MODELPARAM_VALUE.g_b_max { MODELPARAM_VALUE.g_b_max PARAM_VALUE.g_b_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_b_max}] ${MODELPARAM_VALUE.g_b_max}
}

proc update_MODELPARAM_VALUE.g_r_min { MODELPARAM_VALUE.g_r_min PARAM_VALUE.g_r_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_r_min}] ${MODELPARAM_VALUE.g_r_min}
}

proc update_MODELPARAM_VALUE.g_g_min { MODELPARAM_VALUE.g_g_min PARAM_VALUE.g_g_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_g_min}] ${MODELPARAM_VALUE.g_g_min}
}

proc update_MODELPARAM_VALUE.g_b_min { MODELPARAM_VALUE.g_b_min PARAM_VALUE.g_b_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_b_min}] ${MODELPARAM_VALUE.g_b_min}
}

proc update_MODELPARAM_VALUE.b_r_max { MODELPARAM_VALUE.b_r_max PARAM_VALUE.b_r_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.b_r_max}] ${MODELPARAM_VALUE.b_r_max}
}

proc update_MODELPARAM_VALUE.b_g_max { MODELPARAM_VALUE.b_g_max PARAM_VALUE.b_g_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.b_g_max}] ${MODELPARAM_VALUE.b_g_max}
}

proc update_MODELPARAM_VALUE.b_b_max { MODELPARAM_VALUE.b_b_max PARAM_VALUE.b_b_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.b_b_max}] ${MODELPARAM_VALUE.b_b_max}
}

proc update_MODELPARAM_VALUE.b_r_min { MODELPARAM_VALUE.b_r_min PARAM_VALUE.b_r_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.b_r_min}] ${MODELPARAM_VALUE.b_r_min}
}

proc update_MODELPARAM_VALUE.b_g_min { MODELPARAM_VALUE.b_g_min PARAM_VALUE.b_g_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.b_g_min}] ${MODELPARAM_VALUE.b_g_min}
}

proc update_MODELPARAM_VALUE.b_b_min { MODELPARAM_VALUE.b_b_min PARAM_VALUE.b_b_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.b_b_min}] ${MODELPARAM_VALUE.b_b_min}
}

proc update_MODELPARAM_VALUE.diff_max { MODELPARAM_VALUE.diff_max PARAM_VALUE.diff_max } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.diff_max}] ${MODELPARAM_VALUE.diff_max}
}

proc update_MODELPARAM_VALUE.diff_min { MODELPARAM_VALUE.diff_min PARAM_VALUE.diff_min } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.diff_min}] ${MODELPARAM_VALUE.diff_min}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

