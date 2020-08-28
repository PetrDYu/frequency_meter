set_global_assignment -entity "PLL_temp" -library "lib_PLL_temp" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_temp" -library "lib_PLL_temp" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "PLL_temp" -library "lib_PLL_temp" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_temp" -name SPD_FILE [file join $::quartus(sip_path) "PLL_temp.spd"]

set_global_assignment -library "lib_PLL_temp" -name MISC_FILE [file join $::quartus(sip_path) "PLL_temp_sim/PLL_temp.vo"]
