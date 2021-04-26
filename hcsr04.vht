-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to
-- suit user's needs .Comments are provided in each section to help the user
-- fill out necessary details.
-- ***************************************************************************
-- Generated on "09/17/2019 19:18:19"

-- Vhdl Test Bench template for design  :  hcsr04
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hcsr04_vhd_tst IS
END hcsr04_vhd_tst;
ARCHITECTURE hcsr04_arch OF hcsr04_vhd_tst IS
-- constants
constant sys_clk_period : TIME := 20ns;
-- signals
SIGNAL i_clk_50 : STD_LOGIC;
SIGNAL i_key : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL i_reset : STD_LOGIC;
SIGNAL i_sonar_echo : STD_LOGIC;
SIGNAL o_led0 : STD_LOGIC;
SIGNAL o_led1 : STD_LOGIC;
SIGNAL o_led2 : STD_LOGIC;
SIGNAL o_led9 : STD_LOGIC;
SIGNAL o_seg_cms : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL o_seg_ms : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL o_sonar_trig : STD_LOGIC;
SIGNAL o_vga_b : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL o_vga_g : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL o_vga_hs : STD_LOGIC;
SIGNAL o_vga_r : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL o_vga_vs : STD_LOGIC;
COMPONENT hcsr04
PORT (
        i_clk_50 : IN STD_LOGIC;
        i_key : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        i_reset : IN STD_LOGIC;
        i_sonar_echo : IN STD_LOGIC;
        o_led0 : BUFFER STD_LOGIC;
        o_led1 : BUFFER STD_LOGIC;
        o_led2 : BUFFER STD_LOGIC;
        o_led9 : BUFFER STD_LOGIC;
        o_seg_cms : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_seg_ms : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_sonar_trig : BUFFER STD_LOGIC;
        );
END COMPONENT;
BEGIN
        i1 : hcsr04
        PORT MAP (
        -- list connections between master ports and signals
        i_clk_50 => i_clk_50,
        i_key => i_key,
        i_reset => i_reset,
        i_sonar_echo => i_sonar_echo,
        o_led0 => o_led0,
        o_led1 => o_led1,
        o_led2 => o_led2,
        o_led9 => o_led9,
        o_seg_cms => o_seg_cms,
        o_seg_ms => o_seg_ms,
        o_sonar_trig => o_sonar_trig,
        );

-- clock setup
clock: process
begin
    i_clk_50 <= '0';
    WAIT FOR sys_clk_period/2;
    i_clk_50 <= '1';
    WAIT FOR sys_clk_period/2;
end process clock;
---------------------------------

-- main process
process
begin

    -- Resetting
    i_key <= "11";
    i_reset <= '1';
    i_sonar_echo <= '0';
    WAIT FOR sys_clk_period*100;

    -- Requirement 1, result OK
    i_reset <= '0';
    WAIT FOR sys_clk_period*100;
    i_reset <= '1';
    WAIT FOR 5ms;

    -- Requirement 2, result OK
    i_key <= "10";
    WAIT FOR sys_clk_period*100;
    i_key <= "11";

    -- Requirement 3, result OK / 75cm
    WAIT FOR 10us;
    i_sonar_echo <= '1';
    WAIT FOR 1100us*4;
    i_sonar_echo <= '0';

WAIT;
end process;
END hcsr04_arch;