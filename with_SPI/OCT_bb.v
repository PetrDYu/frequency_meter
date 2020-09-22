// megafunction wizard: %ALTOCT%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALT_OCT_POWER 

// ============================================================
// File Name: OCT.v
// Megafunction Name(s):
// 			ALT_OCT_POWER
//
// Simulation Library Files(s):
// 			altera_mf
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

module OCT (
	rzqin,
	parallelterminationcontrol,
	seriesterminationcontrol)/* synthesis synthesis_clearbox = 1 */;

	input	[0:0]  rzqin;
	output	[15:0]  parallelterminationcontrol;
	output	[15:0]  seriesterminationcontrol;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: CONSTANT: LPM_TYPE STRING "ALT_OCT_POWER"
// Retrieval info: CONSTANT: width_ptc NUMERIC "16"
// Retrieval info: CONSTANT: width_stc NUMERIC "16"
// Retrieval info: USED_PORT: parallelterminationcontrol 0 0 16 0 OUTPUT NODEFVAL "parallelterminationcontrol[15..0]"
// Retrieval info: USED_PORT: rzqin 0 0 1 0 INPUT NODEFVAL "rzqin[0..0]"
// Retrieval info: USED_PORT: seriesterminationcontrol 0 0 16 0 OUTPUT NODEFVAL "seriesterminationcontrol[15..0]"
// Retrieval info: CONNECT: @rzqin 0 0 1 0 rzqin 0 0 1 0
// Retrieval info: CONNECT: parallelterminationcontrol 0 0 16 0 @parallelterminationcontrol 0 0 16 0
// Retrieval info: CONNECT: seriesterminationcontrol 0 0 16 0 @seriesterminationcontrol 0 0 16 0
// Retrieval info: GEN_FILE: TYPE_NORMAL OCT.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL OCT.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL OCT.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL OCT.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL OCT_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL OCT_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
