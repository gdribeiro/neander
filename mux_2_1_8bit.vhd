library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;
use work.pkg_alu_constant_definitions.all;

--  entity definition
-- it is used in all operations with ULA
entity general_8_bit_register is

    Port (
        mux_2_1_clk  : in std_logic;
        mux_2_1_rst  : in std_logic; -- enabled when high
        mux_2_1_load : in std_logic; -- enabled when high
        mux_2_1_in   : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    	mux_2_1_out  : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0'));
end general_8_bit_register;

architecture Behavioral of general_8_bit_register is
    signal sig_reg_8_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
begin
mux_2_1_out <= sig_reg_8_out;
mux_2_1 : process(mux_2_1_rst, mux_2_1_clk, mux_2_1_load)
begin


end process mux_2_1;
end Behavioral;
