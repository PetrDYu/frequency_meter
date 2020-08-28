set_global_assignment -entity "PLL_acur1" -library "lib_PLL_acur1" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_acur1" -library "lib_PLL_acur1" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "PLL_acur1" -library "lib_PLL_acur1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_acur1" -name SPD_FILE [file join $::quartus(sip_path) "PLL_acur1.spd"]

set_global_assignment -library "lib_PLL_acur1" -name MISC_FILE [file join $::quartus(sip_path) "PLL_acur1_sim/PLL_acur1.vo"]
