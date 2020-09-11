// megafunction wizard: %ALTIOBUF%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_out 

// ============================================================
// File Name: LVDS_BUF_OUT.v
// Megafunction Name(s):
// 			altiobuf_out
//
// Simulation Library Files(s):
// 			cyclonev
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 16.0.0 Build 211 04/27/2016 SJ Standard Edition
// ************************************************************

//Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, the Altera Quartus Prime License Agreement,
//the Altera MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Altera and sold by Altera or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.

module LVDS_BUF_OUT (
	datain,
	dataout,
	dataout_b)/* synthesis synthesis_clearbox = 1 */;

	input	[0:0]  datain;
	output	[0:0]  dataout;
	output	[0:0]  dataout_b;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
// Retrieval info: CONSTANT: left_shift_series_termination_control STRING "FALSE"
// Retrieval info: CONSTANT: number_of_channels NUMERIC "1"
// Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
// Retrieval info: CONSTANT: pseudo_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_differential_mode STRING "TRUE"
// Retrieval info: CONSTANT: use_oe STRING "FALSE"
// Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 1 0 INPUT NODEFVAL "datain[0..0]"
// Retrieval info: USED_PORT: dataout 0 0 1 0 OUTPUT NODEFVAL "dataout[0..0]"
// Retrieval info: USED_PORT: dataout_b 0 0 1 0 OUTPUT NODEFVAL "dataout_b[0..0]"
// Retrieval info: CONNECT: @datain 0 0 1 0 datain 0 0 1 0
// Retrieval info: CONNECT: dataout 0 0 1 0 @dataout 0 0 1 0
// Retrieval info: CONNECT: dataout_b 0 0 1 0 @dataout_b 0 0 1 0
// Retrieval info: GEN_FILE: TYPE_NORMAL LVDS_BUF_OUT.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL LVDS_BUF_OUT.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL LVDS_BUF_OUT.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL LVDS_BUF_OUT.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL LVDS_BUF_OUT_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL LVDS_BUF_OUT_bb.v TRUE
// Retrieval info: LIB_FILE: cyclonev
