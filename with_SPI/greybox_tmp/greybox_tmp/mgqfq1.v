//altlvds_rx BUFFER_IMPLEMENTATION="RAM" CBX_SINGLE_OUTPUT_FILE="ON" clk_src_is_pll="off" COMMON_RX_TX_PLL="OFF" DATA_RATE=""800.0 Mbps"" DESERIALIZATION_FACTOR=1 ENABLE_DPA_CALIBRATION="ON" ENABLE_DPA_MODE="OFF" ENABLE_SOFT_CDR_MODE="OFF" IMPLEMENT_IN_LES="OFF" INCLOCK_BOOST=0 INCLOCK_PERIOD=50000 INCLOCK_PHASE_SHIFT=0 INPUT_DATA_RATE=800 INTENDED_DEVICE_FAMILY=""Cyclone V"" LPM_TYPE="altlvds_rx" NUMBER_OF_CHANNELS=3 PORT_RX_DATA_ALIGN="PORT_UNUSED" REFCLK_FREQUENCY=""20.000000 MHz"" REGISTERED_OUTPUT="ON" SIM_DPA_OUTPUT_CLOCK_PHASE_SHIFT=0 USE_CORECLOCK_INPUT="OFF" USE_EXTERNAL_PLL="OFF" X_ON_BITSLIP="ON" rx_in rx_inclock rx_out
//VERSION_BEGIN 16.0 cbx_mgl 2016:04:27:18:06:48:SJ cbx_stratixii 2016:04:27:18:05:34:SJ cbx_util_mgl 2016:04:27:18:05:34:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, the Altera Quartus Prime License Agreement,
//  the Altera MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Altera and sold by Altera or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.



//synthesis_resources = altlvds_rx 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgqfq1
	( 
	rx_in,
	rx_inclock,
	rx_out) /* synthesis synthesis_clearbox=1 */;
	input   [2:0]  rx_in;
	input   rx_inclock;
	output   [2:0]  rx_out;

	wire  [2:0]   wire_mgl_prim1_rx_out;

	altlvds_rx   mgl_prim1
	( 
	.rx_in(rx_in),
	.rx_inclock(rx_inclock),
	.rx_out(wire_mgl_prim1_rx_out));
	defparam
		mgl_prim1.buffer_implementation = "RAM",
		mgl_prim1.clk_src_is_pll = "off",
		mgl_prim1.common_rx_tx_pll = "OFF",
		mgl_prim1.data_rate = ""800.0 Mbps"",
		mgl_prim1.deserialization_factor = 1,
		mgl_prim1.enable_dpa_calibration = "ON",
		mgl_prim1.enable_dpa_mode = "OFF",
		mgl_prim1.enable_soft_cdr_mode = "OFF",
		mgl_prim1.implement_in_les = "OFF",
		mgl_prim1.inclock_boost = 0,
		mgl_prim1.inclock_period = 50000,
		mgl_prim1.inclock_phase_shift = 0,
		mgl_prim1.input_data_rate = 800,
		mgl_prim1.intended_device_family = ""Cyclone V"",
		mgl_prim1.lpm_type = "altlvds_rx",
		mgl_prim1.number_of_channels = 3,
		mgl_prim1.port_rx_data_align = "PORT_UNUSED",
		mgl_prim1.refclk_frequency = ""20.000000 MHz"",
		mgl_prim1.registered_output = "ON",
		mgl_prim1.sim_dpa_output_clock_phase_shift = 0,
		mgl_prim1.use_coreclock_input = "OFF",
		mgl_prim1.use_external_pll = "OFF",
		mgl_prim1.x_on_bitslip = "ON";
	assign
		rx_out = wire_mgl_prim1_rx_out;
endmodule //mgqfq1
//VALID FILE
