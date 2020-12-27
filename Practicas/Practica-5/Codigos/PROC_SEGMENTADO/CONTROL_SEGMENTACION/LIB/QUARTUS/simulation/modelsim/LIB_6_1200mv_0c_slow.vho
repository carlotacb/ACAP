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
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "12/14/2020 13:59:32"

-- 
-- Device: Altera EP4CGX30CF23C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LIB IS
    PORT (
	reloj : IN std_logic;
	pcero : IN std_logic;
	B : IN std_logic;
	I : IN std_logic;
	instruc : IN std_logic_vector(31 DOWNTO 0);
	bloqCP : OUT std_logic;
	bloqBDL : OUT std_logic;
	inyecBDL : OUT std_logic;
	inyecDLA : OUT std_logic
	);
END LIB;

-- Design Ports Information
-- reloj	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pcero	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[0]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[1]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[2]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[3]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[4]	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[5]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[6]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[7]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[8]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[9]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[10]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[11]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[12]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[13]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[14]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[15]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[16]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[17]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[18]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[19]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[20]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[21]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[22]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[23]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[24]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[25]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[26]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[27]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[28]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[29]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[30]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instruc[31]	=>  Location: PIN_H9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bloqCP	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bloqBDL	=>  Location: PIN_A1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inyecBDL	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inyecDLA	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF LIB IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reloj : std_logic;
SIGNAL ww_pcero : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_I : std_logic;
SIGNAL ww_instruc : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_bloqCP : std_logic;
SIGNAL ww_bloqBDL : std_logic;
SIGNAL ww_inyecBDL : std_logic;
SIGNAL ww_inyecDLA : std_logic;
SIGNAL \reloj~input_o\ : std_logic;
SIGNAL \pcero~input_o\ : std_logic;
SIGNAL \B~input_o\ : std_logic;
SIGNAL \I~input_o\ : std_logic;
SIGNAL \instruc[0]~input_o\ : std_logic;
SIGNAL \instruc[1]~input_o\ : std_logic;
SIGNAL \instruc[2]~input_o\ : std_logic;
SIGNAL \instruc[3]~input_o\ : std_logic;
SIGNAL \instruc[4]~input_o\ : std_logic;
SIGNAL \instruc[5]~input_o\ : std_logic;
SIGNAL \instruc[6]~input_o\ : std_logic;
SIGNAL \instruc[7]~input_o\ : std_logic;
SIGNAL \instruc[8]~input_o\ : std_logic;
SIGNAL \instruc[9]~input_o\ : std_logic;
SIGNAL \instruc[10]~input_o\ : std_logic;
SIGNAL \instruc[11]~input_o\ : std_logic;
SIGNAL \instruc[12]~input_o\ : std_logic;
SIGNAL \instruc[13]~input_o\ : std_logic;
SIGNAL \instruc[14]~input_o\ : std_logic;
SIGNAL \instruc[15]~input_o\ : std_logic;
SIGNAL \instruc[16]~input_o\ : std_logic;
SIGNAL \instruc[17]~input_o\ : std_logic;
SIGNAL \instruc[18]~input_o\ : std_logic;
SIGNAL \instruc[19]~input_o\ : std_logic;
SIGNAL \instruc[20]~input_o\ : std_logic;
SIGNAL \instruc[21]~input_o\ : std_logic;
SIGNAL \instruc[22]~input_o\ : std_logic;
SIGNAL \instruc[23]~input_o\ : std_logic;
SIGNAL \instruc[24]~input_o\ : std_logic;
SIGNAL \instruc[25]~input_o\ : std_logic;
SIGNAL \instruc[26]~input_o\ : std_logic;
SIGNAL \instruc[27]~input_o\ : std_logic;
SIGNAL \instruc[28]~input_o\ : std_logic;
SIGNAL \instruc[29]~input_o\ : std_logic;
SIGNAL \instruc[30]~input_o\ : std_logic;
SIGNAL \instruc[31]~input_o\ : std_logic;
SIGNAL \bloqCP~output_o\ : std_logic;
SIGNAL \bloqBDL~output_o\ : std_logic;
SIGNAL \inyecBDL~output_o\ : std_logic;
SIGNAL \inyecDLA~output_o\ : std_logic;

BEGIN

ww_reloj <= reloj;
ww_pcero <= pcero;
ww_B <= B;
ww_I <= I;
ww_instruc <= instruc;
bloqCP <= ww_bloqCP;
bloqBDL <= ww_bloqBDL;
inyecBDL <= ww_inyecBDL;
inyecDLA <= ww_inyecDLA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X22_Y0_N2
\bloqCP~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bloqCP~output_o\);

-- Location: IOOBUF_X26_Y67_N9
\bloqBDL~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bloqBDL~output_o\);

-- Location: IOOBUF_X17_Y67_N2
\inyecBDL~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \inyecBDL~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\inyecDLA~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \inyecDLA~output_o\);

-- Location: IOIBUF_X26_Y0_N1
\reloj~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reloj,
	o => \reloj~input_o\);

-- Location: IOIBUF_X81_Y44_N1
\pcero~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pcero,
	o => \pcero~input_o\);

-- Location: IOIBUF_X31_Y67_N1
\B~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B,
	o => \B~input_o\);

-- Location: IOIBUF_X31_Y67_N8
\I~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I,
	o => \I~input_o\);

-- Location: IOIBUF_X31_Y67_N22
\instruc[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(0),
	o => \instruc[0]~input_o\);

-- Location: IOIBUF_X29_Y67_N1
\instruc[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(1),
	o => \instruc[1]~input_o\);

-- Location: IOIBUF_X63_Y0_N1
\instruc[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(2),
	o => \instruc[2]~input_o\);

-- Location: IOIBUF_X13_Y67_N8
\instruc[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(3),
	o => \instruc[3]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\instruc[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(4),
	o => \instruc[4]~input_o\);

-- Location: IOIBUF_X65_Y67_N8
\instruc[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(5),
	o => \instruc[5]~input_o\);

-- Location: IOIBUF_X26_Y67_N15
\instruc[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(6),
	o => \instruc[6]~input_o\);

-- Location: IOIBUF_X29_Y67_N8
\instruc[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(7),
	o => \instruc[7]~input_o\);

-- Location: IOIBUF_X70_Y67_N1
\instruc[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(8),
	o => \instruc[8]~input_o\);

-- Location: IOIBUF_X44_Y67_N1
\instruc[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(9),
	o => \instruc[9]~input_o\);

-- Location: IOIBUF_X24_Y67_N22
\instruc[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(10),
	o => \instruc[10]~input_o\);

-- Location: IOIBUF_X29_Y67_N22
\instruc[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(11),
	o => \instruc[11]~input_o\);

-- Location: IOIBUF_X81_Y65_N15
\instruc[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(12),
	o => \instruc[12]~input_o\);

-- Location: IOIBUF_X19_Y67_N1
\instruc[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(13),
	o => \instruc[13]~input_o\);

-- Location: IOIBUF_X81_Y16_N1
\instruc[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(14),
	o => \instruc[14]~input_o\);

-- Location: IOIBUF_X19_Y67_N15
\instruc[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(15),
	o => \instruc[15]~input_o\);

-- Location: IOIBUF_X6_Y0_N22
\instruc[16]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(16),
	o => \instruc[16]~input_o\);

-- Location: IOIBUF_X17_Y67_N8
\instruc[17]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(17),
	o => \instruc[17]~input_o\);

-- Location: IOIBUF_X47_Y0_N1
\instruc[18]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(18),
	o => \instruc[18]~input_o\);

-- Location: IOIBUF_X81_Y2_N1
\instruc[19]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(19),
	o => \instruc[19]~input_o\);

-- Location: IOIBUF_X6_Y67_N22
\instruc[20]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(20),
	o => \instruc[20]~input_o\);

-- Location: IOIBUF_X61_Y0_N1
\instruc[21]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(21),
	o => \instruc[21]~input_o\);

-- Location: IOIBUF_X52_Y0_N15
\instruc[22]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(22),
	o => \instruc[22]~input_o\);

-- Location: IOIBUF_X13_Y67_N1
\instruc[23]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(23),
	o => \instruc[23]~input_o\);

-- Location: IOIBUF_X33_Y67_N1
\instruc[24]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(24),
	o => \instruc[24]~input_o\);

-- Location: IOIBUF_X10_Y67_N1
\instruc[25]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(25),
	o => \instruc[25]~input_o\);

-- Location: IOIBUF_X81_Y6_N1
\instruc[26]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(26),
	o => \instruc[26]~input_o\);

-- Location: IOIBUF_X40_Y0_N8
\instruc[27]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(27),
	o => \instruc[27]~input_o\);

-- Location: IOIBUF_X10_Y67_N22
\instruc[28]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(28),
	o => \instruc[28]~input_o\);

-- Location: IOIBUF_X81_Y62_N15
\instruc[29]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(29),
	o => \instruc[29]~input_o\);

-- Location: IOIBUF_X58_Y67_N15
\instruc[30]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(30),
	o => \instruc[30]~input_o\);

-- Location: IOIBUF_X8_Y67_N15
\instruc[31]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_instruc(31),
	o => \instruc[31]~input_o\);

ww_bloqCP <= \bloqCP~output_o\;

ww_bloqBDL <= \bloqBDL~output_o\;

ww_inyecBDL <= \inyecBDL~output_o\;

ww_inyecDLA <= \inyecDLA~output_o\;
END structure;


