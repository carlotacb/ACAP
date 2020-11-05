-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "09/22/2020 17:53:06"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	s1bit IS
    PORT (
	x : IN std_logic;
	y : IN std_logic;
	cen : IN std_logic;
	s : OUT std_logic;
	csal : OUT std_logic
	);
END s1bit;

-- Design Ports Information
-- s	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- csal	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cen	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF s1bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_x : std_logic;
SIGNAL ww_y : std_logic;
SIGNAL ww_cen : std_logic;
SIGNAL ww_s : std_logic;
SIGNAL ww_csal : std_logic;
SIGNAL \s~output_o\ : std_logic;
SIGNAL \csal~output_o\ : std_logic;
SIGNAL \x~input_o\ : std_logic;
SIGNAL \y~input_o\ : std_logic;
SIGNAL \cen~input_o\ : std_logic;
SIGNAL \s~0_combout\ : std_logic;
SIGNAL \csal~0_combout\ : std_logic;

BEGIN

ww_x <= x;
ww_y <= y;
ww_cen <= cen;
s <= ww_s;
csal <= ww_csal;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X8_Y0_N9
\s~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s~0_combout\,
	devoe => ww_devoe,
	o => \s~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\csal~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \csal~0_combout\,
	devoe => ww_devoe,
	o => \csal~output_o\);

-- Location: IOIBUF_X12_Y0_N1
\x~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x,
	o => \x~input_o\);

-- Location: IOIBUF_X12_Y0_N8
\y~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y,
	o => \y~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\cen~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cen,
	o => \cen~input_o\);

-- Location: LCCOMB_X12_Y1_N0
\s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s~0_combout\ = \x~input_o\ $ (\y~input_o\ $ (\cen~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x~input_o\,
	datab => \y~input_o\,
	datad => \cen~input_o\,
	combout => \s~0_combout\);

-- Location: LCCOMB_X12_Y1_N2
\csal~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \csal~0_combout\ = (\x~input_o\ & ((\y~input_o\) # (\cen~input_o\))) # (!\x~input_o\ & (\y~input_o\ & \cen~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x~input_o\,
	datab => \y~input_o\,
	datad => \cen~input_o\,
	combout => \csal~0_combout\);

ww_s <= \s~output_o\;

ww_csal <= \csal~output_o\;
END structure;


