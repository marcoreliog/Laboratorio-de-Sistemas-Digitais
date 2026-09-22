-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "09/21/2026 17:58:51"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LSD07 IS
    PORT (
	clk : IN std_logic;
	tot_ld : IN std_logic;
	tot_clr : IN std_logic;
	A : IN std_logic_vector(2 DOWNTO 0);
	tot_coins : OUT std_logic_vector(9 DOWNTO 0)
	);
END LSD07;

-- Design Ports Information
-- tot_coins[0]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[2]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[3]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[4]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[5]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[6]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[7]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[8]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_coins[9]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_clr	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tot_ld	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF LSD07 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_tot_ld : std_logic;
SIGNAL ww_tot_clr : std_logic;
SIGNAL ww_A : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_tot_coins : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \tot_coins[0]~output_o\ : std_logic;
SIGNAL \tot_coins[1]~output_o\ : std_logic;
SIGNAL \tot_coins[2]~output_o\ : std_logic;
SIGNAL \tot_coins[3]~output_o\ : std_logic;
SIGNAL \tot_coins[4]~output_o\ : std_logic;
SIGNAL \tot_coins[5]~output_o\ : std_logic;
SIGNAL \tot_coins[6]~output_o\ : std_logic;
SIGNAL \tot_coins[7]~output_o\ : std_logic;
SIGNAL \tot_coins[8]~output_o\ : std_logic;
SIGNAL \tot_coins[9]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \total|Q[0]~8_combout\ : std_logic;
SIGNAL \tot_clr~input_o\ : std_logic;
SIGNAL \tot_ld~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \total|Q[0]~9\ : std_logic;
SIGNAL \total|Q[1]~10_combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \total|Q[1]~11\ : std_logic;
SIGNAL \total|Q[2]~12_combout\ : std_logic;
SIGNAL \total|Q[2]~13\ : std_logic;
SIGNAL \total|Q[3]~14_combout\ : std_logic;
SIGNAL \total|Q[3]~15\ : std_logic;
SIGNAL \total|Q[4]~16_combout\ : std_logic;
SIGNAL \total|Q[4]~17\ : std_logic;
SIGNAL \total|Q[5]~18_combout\ : std_logic;
SIGNAL \total|Q[5]~19\ : std_logic;
SIGNAL \total|Q[6]~20_combout\ : std_logic;
SIGNAL \total|Q[6]~21\ : std_logic;
SIGNAL \total|Q[7]~22_combout\ : std_logic;
SIGNAL \total|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_tot_ld~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_tot_ld <= tot_ld;
ww_tot_clr <= tot_clr;
ww_A <= A;
tot_coins <= ww_tot_coins;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_tot_ld~input_o\ <= NOT \tot_ld~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N4
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X49_Y54_N9
\tot_coins[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(0),
	devoe => ww_devoe,
	o => \tot_coins[0]~output_o\);

-- Location: IOOBUF_X51_Y54_N9
\tot_coins[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(1),
	devoe => ww_devoe,
	o => \tot_coins[1]~output_o\);

-- Location: IOOBUF_X56_Y54_N9
\tot_coins[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(2),
	devoe => ww_devoe,
	o => \tot_coins[2]~output_o\);

-- Location: IOOBUF_X66_Y54_N23
\tot_coins[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(3),
	devoe => ww_devoe,
	o => \tot_coins[3]~output_o\);

-- Location: IOOBUF_X58_Y54_N23
\tot_coins[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(4),
	devoe => ww_devoe,
	o => \tot_coins[4]~output_o\);

-- Location: IOOBUF_X56_Y54_N30
\tot_coins[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(5),
	devoe => ww_devoe,
	o => \tot_coins[5]~output_o\);

-- Location: IOOBUF_X46_Y54_N9
\tot_coins[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(6),
	devoe => ww_devoe,
	o => \tot_coins[6]~output_o\);

-- Location: IOOBUF_X51_Y54_N16
\tot_coins[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \total|Q\(7),
	devoe => ww_devoe,
	o => \tot_coins[7]~output_o\);

-- Location: IOOBUF_X46_Y54_N23
\tot_coins[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tot_coins[8]~output_o\);

-- Location: IOOBUF_X46_Y54_N2
\tot_coins[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tot_coins[9]~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G19
\clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X51_Y54_N29
\A[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: LCCOMB_X51_Y53_N14
\total|Q[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[0]~8_combout\ = (\A[0]~input_o\ & (\total|Q\(0) $ (VCC))) # (!\A[0]~input_o\ & (\total|Q\(0) & VCC))
-- \total|Q[0]~9\ = CARRY((\A[0]~input_o\ & \total|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \total|Q\(0),
	datad => VCC,
	combout => \total|Q[0]~8_combout\,
	cout => \total|Q[0]~9\);

-- Location: IOIBUF_X46_Y54_N29
\tot_clr~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tot_clr,
	o => \tot_clr~input_o\);

-- Location: IOIBUF_X49_Y54_N29
\tot_ld~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tot_ld,
	o => \tot_ld~input_o\);

-- Location: FF_X51_Y53_N15
\total|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[0]~8_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(0));

-- Location: IOIBUF_X51_Y54_N22
\A[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: LCCOMB_X51_Y53_N16
\total|Q[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[1]~10_combout\ = (\A[1]~input_o\ & ((\total|Q\(1) & (\total|Q[0]~9\ & VCC)) # (!\total|Q\(1) & (!\total|Q[0]~9\)))) # (!\A[1]~input_o\ & ((\total|Q\(1) & (!\total|Q[0]~9\)) # (!\total|Q\(1) & ((\total|Q[0]~9\) # (GND)))))
-- \total|Q[1]~11\ = CARRY((\A[1]~input_o\ & (!\total|Q\(1) & !\total|Q[0]~9\)) # (!\A[1]~input_o\ & ((!\total|Q[0]~9\) # (!\total|Q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \total|Q\(1),
	datad => VCC,
	cin => \total|Q[0]~9\,
	combout => \total|Q[1]~10_combout\,
	cout => \total|Q[1]~11\);

-- Location: FF_X51_Y53_N17
\total|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[1]~10_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(1));

-- Location: IOIBUF_X51_Y54_N1
\A[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: LCCOMB_X51_Y53_N18
\total|Q[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[2]~12_combout\ = ((\A[2]~input_o\ $ (\total|Q\(2) $ (!\total|Q[1]~11\)))) # (GND)
-- \total|Q[2]~13\ = CARRY((\A[2]~input_o\ & ((\total|Q\(2)) # (!\total|Q[1]~11\))) # (!\A[2]~input_o\ & (\total|Q\(2) & !\total|Q[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \total|Q\(2),
	datad => VCC,
	cin => \total|Q[1]~11\,
	combout => \total|Q[2]~12_combout\,
	cout => \total|Q[2]~13\);

-- Location: FF_X51_Y53_N19
\total|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[2]~12_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(2));

-- Location: LCCOMB_X51_Y53_N20
\total|Q[3]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[3]~14_combout\ = (\total|Q\(3) & (!\total|Q[2]~13\)) # (!\total|Q\(3) & ((\total|Q[2]~13\) # (GND)))
-- \total|Q[3]~15\ = CARRY((!\total|Q[2]~13\) # (!\total|Q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \total|Q\(3),
	datad => VCC,
	cin => \total|Q[2]~13\,
	combout => \total|Q[3]~14_combout\,
	cout => \total|Q[3]~15\);

-- Location: FF_X51_Y53_N21
\total|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[3]~14_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(3));

-- Location: LCCOMB_X51_Y53_N22
\total|Q[4]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[4]~16_combout\ = (\total|Q\(4) & (\total|Q[3]~15\ $ (GND))) # (!\total|Q\(4) & (!\total|Q[3]~15\ & VCC))
-- \total|Q[4]~17\ = CARRY((\total|Q\(4) & !\total|Q[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \total|Q\(4),
	datad => VCC,
	cin => \total|Q[3]~15\,
	combout => \total|Q[4]~16_combout\,
	cout => \total|Q[4]~17\);

-- Location: FF_X51_Y53_N23
\total|Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[4]~16_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(4));

-- Location: LCCOMB_X51_Y53_N24
\total|Q[5]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[5]~18_combout\ = (\total|Q\(5) & (!\total|Q[4]~17\)) # (!\total|Q\(5) & ((\total|Q[4]~17\) # (GND)))
-- \total|Q[5]~19\ = CARRY((!\total|Q[4]~17\) # (!\total|Q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \total|Q\(5),
	datad => VCC,
	cin => \total|Q[4]~17\,
	combout => \total|Q[5]~18_combout\,
	cout => \total|Q[5]~19\);

-- Location: FF_X51_Y53_N25
\total|Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[5]~18_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(5));

-- Location: LCCOMB_X51_Y53_N26
\total|Q[6]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[6]~20_combout\ = (\total|Q\(6) & (\total|Q[5]~19\ $ (GND))) # (!\total|Q\(6) & (!\total|Q[5]~19\ & VCC))
-- \total|Q[6]~21\ = CARRY((\total|Q\(6) & !\total|Q[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \total|Q\(6),
	datad => VCC,
	cin => \total|Q[5]~19\,
	combout => \total|Q[6]~20_combout\,
	cout => \total|Q[6]~21\);

-- Location: FF_X51_Y53_N27
\total|Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[6]~20_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(6));

-- Location: LCCOMB_X51_Y53_N28
\total|Q[7]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \total|Q[7]~22_combout\ = \total|Q[6]~21\ $ (\total|Q\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \total|Q\(7),
	cin => \total|Q[6]~21\,
	combout => \total|Q[7]~22_combout\);

-- Location: FF_X51_Y53_N29
\total|Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total|Q[7]~22_combout\,
	clrn => \tot_clr~input_o\,
	ena => \ALT_INV_tot_ld~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \total|Q\(7));

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_tot_coins(0) <= \tot_coins[0]~output_o\;

ww_tot_coins(1) <= \tot_coins[1]~output_o\;

ww_tot_coins(2) <= \tot_coins[2]~output_o\;

ww_tot_coins(3) <= \tot_coins[3]~output_o\;

ww_tot_coins(4) <= \tot_coins[4]~output_o\;

ww_tot_coins(5) <= \tot_coins[5]~output_o\;

ww_tot_coins(6) <= \tot_coins[6]~output_o\;

ww_tot_coins(7) <= \tot_coins[7]~output_o\;

ww_tot_coins(8) <= \tot_coins[8]~output_o\;

ww_tot_coins(9) <= \tot_coins[9]~output_o\;
END structure;


