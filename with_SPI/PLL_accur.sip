set_global_assignment -entity "PLL_accur" -library "lib_PLL_accur" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_accur" -library "lib_PLL_accur" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "PLL_accur" -library "lib_PLL_accur" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_accur" -name SPD_FILE [file join $::quartus(sip_path) "PLL_accur.spd"]

set_global_assignment -library "lib_PLL_accur" -name MISC_FILE [file join $::quartus(sip_path) "PLL_accur_sim/PLL_accur.vo"]
