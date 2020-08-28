set_global_assignment -entity "PLL_temp_1" -library "lib_PLL_temp_1" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_temp_1" -library "lib_PLL_temp_1" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "PLL_temp_1" -library "lib_PLL_temp_1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_temp_1" -name SPD_FILE [file join $::quartus(sip_path) "PLL_temp_1.spd"]

set_global_assignment -library "lib_PLL_temp_1" -name MISC_FILE [file join $::quartus(sip_path) "PLL_temp_1_sim/PLL_temp_1.vo"]
